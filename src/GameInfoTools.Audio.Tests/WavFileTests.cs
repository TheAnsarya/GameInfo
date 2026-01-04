using GameInfoTools.Audio.Wav;
using Xunit;

namespace GameInfoTools.Audio.Tests;

public class WavFileTests {
	[Fact]
	public void FromSamples_CreatesCorrectly() {
		var samples = new short[] { 0, 1000, 2000, 3000 };

		var wav = WavFile.FromSamples(samples, 44100, 1);

		Assert.Equal(44100, wav.SampleRate);
		Assert.Equal(1, wav.Channels);
		Assert.Equal(16, wav.BitsPerSample);
		Assert.Equal(4, wav.Samples.Length);
	}

	[Fact]
	public void ToMono_StereoToMono_AveragesChannels() {
		var stereo = new WavFile {
			SampleRate = 44100,
			Channels = 2,
			Samples = [1000, 2000, 3000, 4000] // L=1000, R=2000, L=3000, R=4000
		};

		var mono = stereo.ToMono();

		Assert.Equal(1, mono.Channels);
		Assert.Equal(2, mono.Samples.Length);
		Assert.Equal(1500, mono.Samples[0]); // (1000 + 2000) / 2
		Assert.Equal(3500, mono.Samples[1]); // (3000 + 4000) / 2
	}

	[Fact]
	public void ToMono_AlreadyMono_ReturnsSame() {
		var mono = new WavFile {
			SampleRate = 44100,
			Channels = 1,
			Samples = [1000, 2000]
		};

		var result = mono.ToMono();

		Assert.Same(mono, result);
	}

	[Fact]
	public void Resample_SameRate_ReturnsSame() {
		var wav = new WavFile {
			SampleRate = 44100,
			Channels = 1,
			Samples = [1000, 2000, 3000]
		};

		var result = wav.Resample(44100);

		Assert.Same(wav, result);
	}

	[Fact]
	public void Resample_Downsample_ReducesSamples() {
		var wav = new WavFile {
			SampleRate = 44100,
			Channels = 1,
			Samples = new short[44100] // 1 second
		};

		var resampled = wav.Resample(22050);

		Assert.Equal(22050, resampled.SampleRate);
		Assert.Equal(22050, resampled.Samples.Length);
	}

	[Fact]
	public void Resample_Upsample_IncreasesSamples() {
		var wav = new WavFile {
			SampleRate = 22050,
			Channels = 1,
			Samples = new short[22050] // 1 second
		};

		var resampled = wav.Resample(44100);

		Assert.Equal(44100, resampled.SampleRate);
		Assert.Equal(44100, resampled.Samples.Length);
	}

	[Fact]
	public void Duration_CalculatesCorrectly() {
		var wav = new WavFile {
			SampleRate = 44100,
			Channels = 1,
			Samples = new short[44100]
		};

		Assert.Equal(1.0, wav.Duration, 5);
	}

	[Fact]
	public void Duration_Stereo_CalculatesCorrectly() {
		var wav = new WavFile {
			SampleRate = 44100,
			Channels = 2,
			Samples = new short[88200] // 1 second stereo (44100 * 2)
		};

		Assert.Equal(1.0, wav.Duration, 5);
	}

	[Fact]
	public void SaveLoad_RoundTrips_Correctly() {
		var original = WavFile.FromSamples(
			[0, 1000, 2000, 3000, -1000, -2000, -3000, 0],
			32000,
			1
		);

		var tempPath = Path.GetTempFileName();
		try {
			original.Save(tempPath);
			var loaded = WavFile.Load(tempPath);

			Assert.Equal(original.SampleRate, loaded.SampleRate);
			Assert.Equal(original.Channels, loaded.Channels);
			Assert.Equal(original.Samples, loaded.Samples);
		} finally {
			if (File.Exists(tempPath)) {
				File.Delete(tempPath);
			}
		}
	}

	[Fact]
	public void Load_InvalidFile_ThrowsException() {
		var tempPath = Path.GetTempFileName();
		try {
			File.WriteAllText(tempPath, "Not a WAV file");

			Assert.Throws<InvalidDataException>(() => WavFile.Load(tempPath));
		} finally {
			if (File.Exists(tempPath)) {
				File.Delete(tempPath);
			}
		}
	}
}
