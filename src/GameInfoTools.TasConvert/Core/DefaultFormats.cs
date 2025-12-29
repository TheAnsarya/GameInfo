using GameInfoTools.TasConvert.Formats;
using GameInfoTools.TasConvert.Formats.GameBoy;
using GameInfoTools.TasConvert.Formats.Nes;
using GameInfoTools.TasConvert.Formats.Snes;

namespace GameInfoTools.TasConvert.Core;

/// <summary>
/// Default format registration for the TAS converter.
/// </summary>
public static class DefaultFormats {
	private static bool _registered;
	private static readonly object _lock = new();

	/// <summary>
	/// Registers all default formats with the global registry.
	/// </summary>
	public static void Register() {
		Register(TasFormatRegistry.Instance);
	}

	/// <summary>
	/// Registers all default formats with the specified registry.
	/// </summary>
	/// <param name="registry">The registry to populate.</param>
	public static void Register(TasFormatRegistry registry) {
		lock (_lock) {
			if (_registered) return;

			// SNES formats
			registry.Register(new SmvFormat());
			registry.Register(new LsmvFormat());

			// NES formats
			registry.Register(new Fm2Format());

			// Game Boy formats
			registry.Register(new VbmFormat());

			// Multi-system formats
			registry.Register(new Bk2Format());

			_registered = true;
		}
	}

	/// <summary>
	/// Resets the registration state (for testing).
	/// </summary>
	internal static void Reset() {
		lock (_lock) {
			_registered = false;
		}
	}
}
