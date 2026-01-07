namespace GameInfoTools.Core.Project;

/// <summary>
/// Custom exception for project-related errors.
/// </summary>
public class ProjectException : Exception {
	/// <summary>Error code for categorizing the exception.</summary>
	public ProjectErrorCode ErrorCode { get; }

	/// <summary>
	/// Creates a new ProjectException.
	/// </summary>
	public ProjectException(ProjectErrorCode errorCode, string message)
		: base(message) {
		ErrorCode = errorCode;
	}

	/// <summary>
	/// Creates a new ProjectException with an inner exception.
	/// </summary>
	public ProjectException(ProjectErrorCode errorCode, string message, Exception innerException)
		: base(message, innerException) {
		ErrorCode = errorCode;
	}
}

/// <summary>
/// Error codes for project operations.
/// </summary>
public enum ProjectErrorCode {
	/// <summary>Unknown or unspecified error.</summary>
	Unknown = 0,

	/// <summary>Project file not found.</summary>
	ProjectNotFound = 100,

	/// <summary>Project file is corrupted or invalid.</summary>
	InvalidProject = 101,

	/// <summary>Project version is not supported.</summary>
	UnsupportedVersion = 102,

	/// <summary>Project is already open.</summary>
	ProjectAlreadyOpen = 103,

	/// <summary>No project is currently open.</summary>
	NoProjectOpen = 104,

	/// <summary>ROM file not found.</summary>
	RomNotFound = 200,

	/// <summary>ROM file is corrupted or invalid.</summary>
	InvalidRom = 201,

	/// <summary>ROM checksum does not match expected value.</summary>
	ChecksumMismatch = 202,

	/// <summary>ROM format is not supported.</summary>
	UnsupportedRomFormat = 203,

	/// <summary>Game is not supported for project creation.</summary>
	UnsupportedGame = 204,

	/// <summary>Asset extraction failed.</summary>
	ExtractionFailed = 300,

	/// <summary>Asset not found in project.</summary>
	AssetNotFound = 301,

	/// <summary>Asset format is invalid.</summary>
	InvalidAssetFormat = 302,

	/// <summary>Build failed.</summary>
	BuildFailed = 400,

	/// <summary>Assembler not found or not configured.</summary>
	AssemblerNotFound = 401,

	/// <summary>Build verification failed.</summary>
	VerificationFailed = 402,

	/// <summary>Source file not found.</summary>
	SourceNotFound = 403,

	/// <summary>File system operation failed.</summary>
	FileSystemError = 500,

	/// <summary>Permission denied.</summary>
	PermissionDenied = 501,

	/// <summary>Disk full.</summary>
	DiskFull = 502,

	/// <summary>Operation was cancelled.</summary>
	Cancelled = 600
}
