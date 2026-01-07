namespace GameInfoTools.Core.Project;

/// <summary>
/// Default implementation of IAssetExtractorRegistry.
/// </summary>
public class AssetExtractorRegistry : IAssetExtractorRegistry {
	private readonly List<IAssetExtractor> _extractors = [];

	/// <inheritdoc/>
	public IReadOnlyList<IAssetExtractor> Extractors => _extractors.AsReadOnly();

	/// <inheritdoc/>
	public IAssetExtractor? GetExtractor(string gameId) =>
		_extractors.FirstOrDefault(e => e.GameId.Equals(gameId, StringComparison.OrdinalIgnoreCase));

	/// <inheritdoc/>
	public IReadOnlyList<GameDefinition> GetGameDefinitions() =>
		[.. _extractors.Select(e => e.GetGameDefinition())];

	/// <inheritdoc/>
	public async Task<IAssetExtractor?> DetectExtractorAsync(byte[] romData) {
		foreach (var extractor in _extractors) {
			if (await extractor.CanExtractAsync(romData)) {
				return extractor;
			}
		}

		return null;
	}

	/// <inheritdoc/>
	public void Register(IAssetExtractor extractor) {
		if (!_extractors.Any(e => e.GameId.Equals(extractor.GameId, StringComparison.OrdinalIgnoreCase))) {
			_extractors.Add(extractor);
		}
	}
}

/// <summary>
/// Default implementation of IAssemblerRegistry.
/// </summary>
public class AssemblerRegistry : IAssemblerRegistry {
	private readonly List<IAssembler> _assemblers = [];

	/// <inheritdoc/>
	public IReadOnlyList<IAssembler> Assemblers => _assemblers.AsReadOnly();

	/// <inheritdoc/>
	public IAssembler? GetAssembler(string name) =>
		_assemblers.FirstOrDefault(a => a.Name.Equals(name, StringComparison.OrdinalIgnoreCase));

	/// <inheritdoc/>
	public async Task<IReadOnlyList<IAssembler>> GetAvailableAssemblersAsync() {
		var available = new List<IAssembler>();

		foreach (var assembler in _assemblers) {
			if (await assembler.IsAvailableAsync()) {
				available.Add(assembler);
			}
		}

		return available.AsReadOnly();
	}

	/// <inheritdoc/>
	public void Register(IAssembler assembler) {
		if (!_assemblers.Any(a => a.Name.Equals(assembler.Name, StringComparison.OrdinalIgnoreCase))) {
			_assemblers.Add(assembler);
		}
	}
}

/// <summary>
/// Default implementation of IBuildVerifier.
/// </summary>
public class BuildVerifier : IBuildVerifier {
	/// <inheritdoc/>
	public Task<VerifyResult> VerifyAsync(byte[] builtRom, Project project) {
		var expectedChecksums = new RomChecksums {
			Size = project.Metadata.ReferenceRom.Size,
			Crc32 = project.Metadata.ReferenceRom.Crc32,
			Md5 = project.Metadata.ReferenceRom.Md5,
			Sha1 = project.Metadata.ReferenceRom.Sha1,
			Sha256 = project.Metadata.ReferenceRom.Sha256
		};

		return VerifyAsync(builtRom, expectedChecksums);
	}

	/// <inheritdoc/>
	public Task<VerifyResult> VerifyAsync(byte[] builtRom, RomChecksums expectedChecksums) {
		var actualSha256 = ComputeChecksum(builtRom, "sha256");
		var expectedSha256 = expectedChecksums.Sha256 ?? "";

		var isMatch = actualSha256.Equals(expectedSha256, StringComparison.OrdinalIgnoreCase);

		return Task.FromResult(new VerifyResult(
			IsMatch: isMatch,
			BytesDifferent: isMatch ? 0 : -1, // -1 indicates not computed
			Differences: [],
			ExpectedChecksum: expectedSha256,
			ActualChecksum: actualSha256
		));
	}

	/// <inheritdoc/>
	public Task<VerifyResult> CompareAsync(byte[] rom1, byte[] rom2, int maxDifferences = 100) {
		var differences = new List<(int Offset, byte Expected, byte Actual)>();
		var minLength = Math.Min(rom1.Length, rom2.Length);
		var maxLength = Math.Max(rom1.Length, rom2.Length);

		// Find byte differences
		for (int i = 0; i < minLength && differences.Count < maxDifferences; i++) {
			if (rom1[i] != rom2[i]) {
				differences.Add((i, rom1[i], rom2[i]));
			}
		}

		// Account for length difference
		var bytesDifferent = differences.Count + (maxLength - minLength);

		var sha256_1 = ComputeChecksum(rom1, "sha256");
		var sha256_2 = ComputeChecksum(rom2, "sha256");

		return Task.FromResult(new VerifyResult(
			IsMatch: bytesDifferent == 0,
			BytesDifferent: bytesDifferent,
			Differences: differences,
			ExpectedChecksum: sha256_1,
			ActualChecksum: sha256_2
		));
	}

	private static string ComputeChecksum(byte[] data, string algorithm) {
		var hash = algorithm.ToLowerInvariant() switch {
			"md5" => System.Security.Cryptography.MD5.HashData(data),
			"sha1" => System.Security.Cryptography.SHA1.HashData(data),
			"sha256" => System.Security.Cryptography.SHA256.HashData(data),
			"crc32" => ComputeCrc32(data),
			_ => throw new ArgumentException($"Unknown algorithm: {algorithm}")
		};

		return Convert.ToHexStringLower(hash);
	}

	private static byte[] ComputeCrc32(byte[] data) {
		// Simple CRC32 implementation
		uint crc = 0xFFFFFFFF;
		foreach (var b in data) {
			crc ^= b;
			for (int i = 0; i < 8; i++) {
				crc = (crc >> 1) ^ (0xEDB88320 * (crc & 1));
			}
		}

		crc ^= 0xFFFFFFFF;
		return BitConverter.GetBytes(crc);
	}
}
