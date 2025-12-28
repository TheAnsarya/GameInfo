using DarkRepos.Editor.Core.Models;

namespace DarkRepos.Editor.Core.Interfaces;

/// <summary>
/// Service for managing ROM files.
/// </summary>
public interface IRomService {
	/// <summary>
	/// Load a ROM from a file path.
	/// </summary>
	Task<Rom> LoadAsync(string filePath, CancellationToken cancellationToken = default);

	/// <summary>
	/// Load a ROM from a byte array.
	/// </summary>
	Task<Rom> LoadAsync(byte[] data, string fileName, CancellationToken cancellationToken = default);

	/// <summary>
	/// Get ROM by ID.
	/// </summary>
	Task<Rom?> GetByIdAsync(Guid id, CancellationToken cancellationToken = default);

	/// <summary>
	/// Get all stored ROMs.
	/// </summary>
	Task<IReadOnlyList<Rom>> GetAllAsync(CancellationToken cancellationToken = default);

	/// <summary>
	/// Save a ROM to the database.
	/// </summary>
	Task<Rom> SaveAsync(Rom rom, CancellationToken cancellationToken = default);

	/// <summary>
	/// Delete a ROM by ID.
	/// </summary>
	Task<bool> DeleteAsync(Guid id, CancellationToken cancellationToken = default);

	/// <summary>
	/// Detect the platform of a ROM.
	/// </summary>
	RomPlatform DetectPlatform(byte[] data, string fileName);

	/// <summary>
	/// Calculate SHA-256 hash of ROM data.
	/// </summary>
	string CalculateSha256(byte[] data);

	/// <summary>
	/// Calculate CRC32 of ROM data.
	/// </summary>
	string CalculateCrc32(byte[] data);
}
