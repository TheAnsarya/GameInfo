using GameInfoTools.Wiki;

namespace GameInfoTools.Tests;

public class ChangeTrackerTests {
	[Fact]
	public void CreateMarker_CreatesValidMarkerFormat() {
		var marker = ChangeTracker.CreateMarker(ChangeTracker.ChangeType.AiGenerated, "Test description");

		Assert.StartsWith("<!-- @CHANGE:AiGenerated:", marker);
		Assert.Contains("Test description", marker);
		Assert.EndsWith("-->", marker);
	}

	[Fact]
	public void CreateMarker_WithStatus_IncludesStatus() {
		var marker = ChangeTracker.CreateMarker(ChangeTracker.ChangeType.Modified, "Description", "pending");

		Assert.Contains(":pending:", marker);
	}

	[Fact]
	public void CreateSectionStart_CreatesStartMarker() {
		var marker = ChangeTracker.CreateSectionStart(ChangeTracker.ChangeType.AiGenerated, "Section desc");

		Assert.StartsWith("<!-- @CHANGE_START:AiGenerated:", marker);
		Assert.Contains("Section desc", marker);
	}

	[Fact]
	public void CreateSectionEnd_CreatesEndMarker() {
		var marker = ChangeTracker.CreateSectionEnd();

		Assert.Equal("<!-- @CHANGE_END -->", marker);
	}

	[Fact]
	public void CreateAiGeneratedBlock_IncludesWarnings() {
		var content = "Some content";
		var block = ChangeTracker.CreateAiGeneratedBlock(content, "Test block");

		Assert.Contains("@CHANGE_START:AiGenerated", block);
		Assert.Contains("AI-GENERATED CONTENT", block);
		Assert.Contains("Review before uploading", block);
		Assert.Contains(content, block);
		Assert.Contains("@CHANGE_END", block);
	}

	[Fact]
	public void CreateReviewedMarker_IncludesReviewer() {
		var marker = ChangeTracker.CreateReviewedMarker("TestUser", "Looks good");

		Assert.Contains("@REVIEWED:TestUser:", marker);
		Assert.Contains("Looks good", marker);
	}

	[Fact]
	public void ParseMarkers_ParsesValidMarkers() {
		var content = """
			Some text
			<!-- @CHANGE:AiGenerated:pending:2024-01-15T10:30:00Z:Test marker -->
			More text
			<!-- @CHANGE:Modified::2024-01-16T12:00:00Z:Another marker -->
			""";

		var markers = ChangeTracker.ParseMarkers(content);

		Assert.Equal(2, markers.Count);
		Assert.Equal(ChangeTracker.ChangeType.AiGenerated, markers[0].Type);
		Assert.Equal("pending", markers[0].Status);
		Assert.Equal("Test marker", markers[0].Description);
		Assert.Equal(ChangeTracker.ChangeType.Modified, markers[1].Type);
	}

	[Fact]
	public void ParseMarkers_EmptyContent_ReturnsEmpty() {
		var markers = ChangeTracker.ParseMarkers("");

		Assert.Empty(markers);
	}

	[Fact]
	public void ParseMarkers_NoMarkers_ReturnsEmpty() {
		var content = "Just some plain text\nWith multiple lines\nBut no markers";

		var markers = ChangeTracker.ParseMarkers(content);

		Assert.Empty(markers);
	}

	[Fact]
	public void HasUnreviewedContent_WithAiContent_ReturnsTrue() {
		var content = """
			<!-- @CHANGE:AiGenerated::2024-01-15T10:30:00Z:AI content -->
			Some AI generated content
			""";

		Assert.True(ChangeTracker.HasUnreviewedContent(content));
	}

	[Fact]
	public void HasUnreviewedContent_WithReviewedOnly_ReturnsFalse() {
		var content = """
			<!-- @CHANGE:Reviewed::2024-01-15T10:30:00Z:Reviewed content -->
			Human reviewed content
			""";

		Assert.False(ChangeTracker.HasUnreviewedContent(content));
	}

	[Fact]
	public void HasUnreviewedContent_WithModified_ReturnsTrue() {
		var content = """
			<!-- @CHANGE:Modified::2024-01-15T10:30:00Z:Modified section -->
			Modified content
			""";

		Assert.True(ChangeTracker.HasUnreviewedContent(content));
	}

	[Fact]
	public void HasUnreviewedContent_NoMarkers_ReturnsFalse() {
		var content = "Plain content with no markers";

		Assert.False(ChangeTracker.HasUnreviewedContent(content));
	}

	[Fact]
	public void GetChangeSummary_CountsMarkersCorrectly() {
		var content = """
			<!-- @CHANGE:AiGenerated::2024-01-15T10:30:00Z:AI 1 -->
			<!-- @CHANGE:AiGenerated::2024-01-15T10:31:00Z:AI 2 -->
			<!-- @CHANGE:Modified::2024-01-15T10:32:00Z:Mod 1 -->
			<!-- @CHANGE:Reviewed::2024-01-15T10:33:00Z:Rev 1 -->
			""";

		var summary = ChangeTracker.GetChangeSummary(content);

		Assert.Equal(4, summary.TotalMarkers);
		Assert.Equal(2, summary.AiGeneratedSections);
		Assert.Equal(1, summary.ModifiedSections);
		Assert.Equal(1, summary.ReviewedSections);
		Assert.Equal(3, summary.NeedsReviewCount); // AI + Modified need review
		Assert.False(summary.SafeToUpload);
	}

	[Fact]
	public void GetChangeSummary_SafeToUpload_WhenAllReviewed() {
		var content = """
			<!-- @CHANGE:Reviewed::2024-01-15T10:33:00Z:Rev 1 -->
			<!-- @CHANGE:HumanWritten::2024-01-15T10:34:00Z:Human -->
			""";

		var summary = ChangeTracker.GetChangeSummary(content);

		Assert.True(summary.SafeToUpload);
		Assert.Equal(0, summary.NeedsReviewCount);
	}

	[Fact]
	public void StripMarkers_RemovesAllMarkers() {
		var content = """
			<!-- @CHANGE:AiGenerated::2024-01-15T10:30:00Z:Test -->
			Content line 1
			<!-- @CHANGE_START:Modified:2024-01-15T10:30:00Z:Section -->
			Content line 2
			<!-- @CHANGE_END -->
			<!-- @REVIEWED:TestUser:2024-01-15T10:30:00Z:Notes -->
			Content line 3
			""";

		var stripped = ChangeTracker.StripMarkers(content);

		Assert.DoesNotContain("@CHANGE", stripped);
		Assert.DoesNotContain("@REVIEWED", stripped);
		Assert.Contains("Content line 1", stripped);
		Assert.Contains("Content line 2", stripped);
		Assert.Contains("Content line 3", stripped);
	}

	[Fact]
	public void StripMarkers_RemovesAiWarnings() {
		var content = """
			<!-- ⚠️ AI-GENERATED CONTENT - Review before uploading to wikis that prohibit AI content ⚠️ -->
			Actual content here
			""";

		var stripped = ChangeTracker.StripMarkers(content);

		Assert.DoesNotContain("AI-GENERATED", stripped);
		Assert.Contains("Actual content here", stripped);
	}

	[Fact]
	public void WrapContent_AiGenerated_CreatesFullBlock() {
		var content = "Test content";
		var wrapped = ChangeTracker.WrapContent(content, ChangeTracker.ChangeType.AiGenerated, "Test wrap");

		Assert.Contains("@CHANGE_START:AiGenerated", wrapped);
		Assert.Contains("AI-GENERATED CONTENT", wrapped);
		Assert.Contains("Test content", wrapped);
		Assert.Contains("@CHANGE_END", wrapped);
	}

	[Fact]
	public void WrapContent_OtherTypes_AddsSimpleMarker() {
		var content = "Test content";
		var wrapped = ChangeTracker.WrapContent(content, ChangeTracker.ChangeType.HumanWritten, "Human written");

		Assert.Contains("@CHANGE:HumanWritten", wrapped);
		Assert.Contains("Test content", wrapped);
		Assert.DoesNotContain("@CHANGE_START", wrapped);
	}

	[Fact]
	public void MarkAsReviewed_StripsMarkersAndAddsReviewMarker() {
		var content = """
			<!-- @CHANGE:AiGenerated::2024-01-15T10:30:00Z:Test -->
			<!-- ⚠️ AI-GENERATED CONTENT - MUST BE MANUALLY REVIEWED BEFORE UPLOADING TO DATA CRYSTAL ⚠️ -->
			Original content
			""";

		var reviewed = ChangeTracker.MarkAsReviewed(content, "ReviewerName", "Approved");

		Assert.Contains("@REVIEWED:ReviewerName", reviewed);
		Assert.Contains("Approved", reviewed);
		Assert.Contains("Original content", reviewed);
		Assert.DoesNotContain("AI-GENERATED", reviewed);
		Assert.DoesNotContain("@CHANGE:AiGenerated", reviewed);
	}

	[Fact]
	public void ChangeMarker_RequiresReview_ForAiGenerated() {
		var marker = new ChangeTracker.ChangeMarker {
			Type = ChangeTracker.ChangeType.AiGenerated,
			Timestamp = DateTime.UtcNow
		};

		Assert.True(marker.RequiresReview);
	}

	[Fact]
	public void ChangeMarker_RequiresReview_ForModified() {
		var marker = new ChangeTracker.ChangeMarker {
			Type = ChangeTracker.ChangeType.Modified,
			Timestamp = DateTime.UtcNow
		};

		Assert.True(marker.RequiresReview);
	}

	[Fact]
	public void ChangeMarker_RequiresReview_ForNeedsReview() {
		var marker = new ChangeTracker.ChangeMarker {
			Type = ChangeTracker.ChangeType.NeedsReview,
			Timestamp = DateTime.UtcNow
		};

		Assert.True(marker.RequiresReview);
	}

	[Fact]
	public void ChangeMarker_DoesNotRequireReview_ForReviewed() {
		var marker = new ChangeTracker.ChangeMarker {
			Type = ChangeTracker.ChangeType.Reviewed,
			Timestamp = DateTime.UtcNow
		};

		Assert.False(marker.RequiresReview);
	}

	[Fact]
	public void ChangeMarker_DoesNotRequireReview_ForHumanWritten() {
		var marker = new ChangeTracker.ChangeMarker {
			Type = ChangeTracker.ChangeType.HumanWritten,
			Timestamp = DateTime.UtcNow
		};

		Assert.False(marker.RequiresReview);
	}

	[Fact]
	public void ChangeSummary_GetSummaryText_IncludesAiWarning() {
		var summary = new ChangeSummary {
			TotalMarkers = 1,
			AiGeneratedSections = 1,
			NeedsReviewCount = 1,
			Markers = []
		};

		var text = summary.GetSummaryText();

		Assert.Contains("AI-generated", text);
		Assert.Contains("MUST REVIEW", text);
	}

	[Fact]
	public void ChangeSummary_GetSummaryText_NoMarkers_ShowsUnknown() {
		var summary = new ChangeSummary {
			TotalMarkers = 0,
			Markers = []
		};

		var text = summary.GetSummaryText();

		Assert.Contains("No change markers", text);
		Assert.Contains("unknown", text.ToLower());
	}

	[Fact]
	public void ChangeSummary_GetSummaryText_SafeToUpload_ShowsCheckmark() {
		var summary = new ChangeSummary {
			TotalMarkers = 1,
			ReviewedSections = 1,
			NeedsReviewCount = 0,
			Markers = []
		};

		var text = summary.GetSummaryText();

		Assert.Contains("Safe to upload", text);
	}
}
