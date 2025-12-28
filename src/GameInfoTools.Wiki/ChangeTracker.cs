using System.Text;
using System.Text.RegularExpressions;

namespace GameInfoTools.Wiki;

/// <summary>
/// Handles change tracking markers that can be embedded in wikitext documents.
/// These markers allow tracking which sections were AI-generated vs human-written,
/// and what changes need review before uploading.
///
/// Markers are HTML comments so they don't affect wiki rendering:
/// &lt;!-- @CHANGE:type:status:timestamp:description --&gt;
/// </summary>
public static partial class ChangeTracker {
	/// <summary>
	/// Change marker types.
	/// </summary>
	public enum ChangeType {
		/// <summary>AI-generated content (MUST be reviewed before upload).</summary>
		AiGenerated,
		/// <summary>Human-written content.</summary>
		HumanWritten,
		/// <summary>Modified from original wiki content.</summary>
		Modified,
		/// <summary>Imported from wiki (unchanged).</summary>
		Imported,
		/// <summary>Needs review before upload.</summary>
		NeedsReview,
		/// <summary>Reviewed and approved for upload.</summary>
		Reviewed
	}

	/// <summary>
	/// Represents a change marker in the document.
	/// </summary>
	public record ChangeMarker {
		public ChangeType Type { get; init; }
		public string Status { get; init; } = "";
		public DateTime Timestamp { get; init; }
		public string Description { get; init; } = "";
		public int StartLine { get; init; }
		public int EndLine { get; init; }

		/// <summary>
		/// Whether this content requires human review before upload.
		/// </summary>
		public bool RequiresReview => Type is ChangeType.AiGenerated or ChangeType.Modified or ChangeType.NeedsReview;
	}

	// Pattern: <!-- @CHANGE:type:status:timestamp:description -->
	// Note: timestamp is in ISO8601 format which contains colons (e.g., 2024-01-15T10:30:00Z)
	// We use a more specific pattern to capture the timestamp correctly
	private static readonly Regex MarkerRegex = GenerateMarkerRegex();

	[GeneratedRegex(@"<!--\s*@CHANGE:(\w+):(\w*):([\dT:\-\.Z+]+):([^-]*)\s*-->", RegexOptions.Compiled)]
	private static partial Regex GenerateMarkerRegex();

	/// <summary>
	/// Creates a change marker comment.
	/// </summary>
	public static string CreateMarker(ChangeType type, string description, string status = "") {
		var timestamp = DateTime.UtcNow.ToString("o");
		return $"<!-- @CHANGE:{type}:{status}:{timestamp}:{description} -->";
	}

	/// <summary>
	/// Creates a section start marker.
	/// </summary>
	public static string CreateSectionStart(ChangeType type, string description) {
		return $"<!-- @CHANGE_START:{type}:{DateTime.UtcNow:o}:{description} -->";
	}

	/// <summary>
	/// Creates a section end marker.
	/// </summary>
	public static string CreateSectionEnd() {
		return "<!-- @CHANGE_END -->";
	}

	/// <summary>
	/// Creates a full AI-generated content warning block.
	/// </summary>
	public static string CreateAiGeneratedBlock(string content, string description) {
		var sb = new StringBuilder();
		sb.AppendLine(CreateSectionStart(ChangeType.AiGenerated, description));
		sb.AppendLine("<!-- ⚠️ AI-GENERATED CONTENT - Review before uploading to wikis that prohibit AI content ⚠️ -->");
		sb.AppendLine(content);
		sb.AppendLine(CreateSectionEnd());
		return sb.ToString();
	}

	/// <summary>
	/// Creates a reviewed content marker.
	/// </summary>
	public static string CreateReviewedMarker(string reviewedBy, string notes = "") {
		return $"<!-- @REVIEWED:{reviewedBy}:{DateTime.UtcNow:o}:{notes} -->";
	}

	/// <summary>
	/// Parses all change markers from a document.
	/// </summary>
	public static IReadOnlyList<ChangeMarker> ParseMarkers(string content) {
		var markers = new List<ChangeMarker>();
		var lines = content.Split('\n');

		for (int i = 0; i < lines.Length; i++) {
			var match = MarkerRegex.Match(lines[i]);
			if (match.Success) {
				if (Enum.TryParse<ChangeType>(match.Groups[1].Value, true, out var type)) {
					DateTime.TryParse(match.Groups[3].Value, out var timestamp);

					markers.Add(new ChangeMarker {
						Type = type,
						Status = match.Groups[2].Value,
						Timestamp = timestamp,
						Description = match.Groups[4].Value.Trim(),
						StartLine = i + 1,
						EndLine = i + 1
					});
				}
			}
		}

		return markers;
	}

	/// <summary>
	/// Checks if a document has any content requiring review.
	/// </summary>
	public static bool HasUnreviewedContent(string content) {
		var markers = ParseMarkers(content);
		return markers.Any(m => m.RequiresReview);
	}

	/// <summary>
	/// Gets a summary of changes in the document.
	/// </summary>
	public static ChangeSummary GetChangeSummary(string content) {
		var markers = ParseMarkers(content);

		return new ChangeSummary {
			TotalMarkers = markers.Count,
			AiGeneratedSections = markers.Count(m => m.Type == ChangeType.AiGenerated),
			ModifiedSections = markers.Count(m => m.Type == ChangeType.Modified),
			ReviewedSections = markers.Count(m => m.Type == ChangeType.Reviewed),
			NeedsReviewCount = markers.Count(m => m.RequiresReview),
			Markers = markers
		};
	}

	/// <summary>
	/// Removes all change tracking markers from content (for clean export).
	/// </summary>
	public static string StripMarkers(string content) {
		// Remove @CHANGE markers (handled by MarkerRegex)
		var result = MarkerRegex.Replace(content, "");

		// Remove @CHANGE_START/END markers - use non-greedy matching
		result = Regex.Replace(result, @"<!--\s*@CHANGE_START:.*?-->", "", RegexOptions.Singleline);
		result = Regex.Replace(result, @"<!--\s*@CHANGE_END\s*-->", "");
		result = Regex.Replace(result, @"<!--\s*@REVIEWED:.*?-->", "", RegexOptions.Singleline);

		// Remove AI warning comments - use non-greedy matching
		result = Regex.Replace(result, @"<!--\s*⚠️ AI-GENERATED CONTENT.*?-->", "", RegexOptions.Singleline);

		// Clean up multiple blank lines
		result = Regex.Replace(result, @"\n{3,}", "\n\n");

		return result.Trim();
	}

	/// <summary>
	/// Wraps content with appropriate change markers based on source.
	/// </summary>
	public static string WrapContent(string content, ChangeType type, string description) {
		return type switch {
			ChangeType.AiGenerated => CreateAiGeneratedBlock(content, description),
			_ => $"{CreateMarker(type, description)}\n{content}"
		};
	}

	/// <summary>
	/// Marks a document as fully reviewed and ready for upload.
	/// Removes AI-generated warnings but keeps audit trail.
	/// </summary>
	public static string MarkAsReviewed(string content, string reviewedBy, string notes = "") {
		// First strip existing markers
		var clean = StripMarkers(content);

		// Add reviewed marker at top
		var sb = new StringBuilder();
		sb.AppendLine(CreateReviewedMarker(reviewedBy, notes));
		sb.AppendLine(clean);

		return sb.ToString();
	}
}

/// <summary>
/// Summary of changes in a document.
/// </summary>
public record ChangeSummary {
	public int TotalMarkers { get; init; }
	public int AiGeneratedSections { get; init; }
	public int ModifiedSections { get; init; }
	public int ReviewedSections { get; init; }
	public int NeedsReviewCount { get; init; }
	public IReadOnlyList<ChangeTracker.ChangeMarker> Markers { get; init; } = [];

	/// <summary>
	/// Whether the document is safe to upload (all content reviewed).
	/// </summary>
	public bool SafeToUpload => NeedsReviewCount == 0;

	/// <summary>
	/// Human-readable summary.
	/// </summary>
	public string GetSummaryText() {
		if (TotalMarkers == 0) {
			return "No change markers found. Content origin unknown.";
		}

		var parts = new List<string>();

		if (AiGeneratedSections > 0)
			parts.Add($"⚠️ {AiGeneratedSections} AI-generated section(s) - MUST REVIEW");

		if (ModifiedSections > 0)
			parts.Add($"📝 {ModifiedSections} modified section(s)");

		if (ReviewedSections > 0)
			parts.Add($"✅ {ReviewedSections} reviewed section(s)");

		if (SafeToUpload)
			parts.Add("✓ Safe to upload");
		else
			parts.Add($"⛔ {NeedsReviewCount} section(s) need review before upload");

		return string.Join(" | ", parts);
	}
}
