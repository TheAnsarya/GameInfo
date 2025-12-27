namespace DarkReposEditor.Core.Models;

/// <summary>
/// Represents a label/symbol for a memory address.
/// </summary>
public class Label
{
	/// <summary>
	/// Unique identifier for the label.
	/// </summary>
	public Guid Id { get; set; }

	/// <summary>
	/// Project this label belongs to.
	/// </summary>
	public Guid ProjectId { get; set; }

	/// <summary>
	/// The address this label refers to.
	/// </summary>
	public int Address { get; set; }

	/// <summary>
	/// Bank number (for banked systems).
	/// </summary>
	public int? Bank { get; set; }

	/// <summary>
	/// Label name/symbol.
	/// </summary>
	public string Name { get; set; } = string.Empty;

	/// <summary>
	/// Optional comment/description.
	/// </summary>
	public string? Comment { get; set; }

	/// <summary>
	/// Type of label (code, data, variable, etc.).
	/// </summary>
	public LabelType Type { get; set; } = LabelType.Unknown;

	/// <summary>
	/// Data size in bytes (for data labels).
	/// </summary>
	public int? Size { get; set; }

	/// <summary>
	/// When the label was created.
	/// </summary>
	public DateTime CreatedAt { get; set; } = DateTime.UtcNow;
}

/// <summary>
/// Types of labels/symbols.
/// </summary>
public enum LabelType
{
	/// <summary>Unknown type.</summary>
	Unknown = 0,

	/// <summary>Code/function entry point.</summary>
	Code = 1,

	/// <summary>Subroutine.</summary>
	Subroutine = 2,

	/// <summary>Jump target.</summary>
	JumpTarget = 3,

	/// <summary>Data bytes.</summary>
	Data = 4,

	/// <summary>Data table/array.</summary>
	DataTable = 5,

	/// <summary>Pointer/address.</summary>
	Pointer = 6,

	/// <summary>Text/string data.</summary>
	Text = 7,

	/// <summary>Graphics/CHR data.</summary>
	Graphics = 8,

	/// <summary>RAM variable.</summary>
	Variable = 9,

	/// <summary>Hardware register.</summary>
	Register = 10
}
