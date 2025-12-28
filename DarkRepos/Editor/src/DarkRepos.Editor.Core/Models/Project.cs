namespace DarkRepos.Editor.Core.Models;

/// <summary>
/// Represents an editing project for a ROM.
/// </summary>
public class Project
{
	/// <summary>
	/// Unique identifier for the project.
	/// </summary>
	public Guid Id { get; set; }

	/// <summary>
	/// Project name.
	/// </summary>
	public string Name { get; set; } = string.Empty;

	/// <summary>
	/// Project description.
	/// </summary>
	public string? Description { get; set; }

	/// <summary>
	/// ID of the source ROM.
	/// </summary>
	public Guid RomId { get; set; }

	/// <summary>
	/// Associated ROM.
	/// </summary>
	public Rom? Rom { get; set; }

	/// <summary>
	/// Path to project folder on disk.
	/// </summary>
	public string? ProjectPath { get; set; }

	/// <summary>
	/// When the project was created.
	/// </summary>
	public DateTime CreatedAt { get; set; } = DateTime.UtcNow;

	/// <summary>
	/// When the project was last modified.
	/// </summary>
	public DateTime ModifiedAt { get; set; } = DateTime.UtcNow;

	/// <summary>
	/// Project settings as JSON.
	/// </summary>
	public string? SettingsJson { get; set; }
}
