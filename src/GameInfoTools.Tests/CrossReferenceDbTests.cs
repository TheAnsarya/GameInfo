using GameInfoTools.Analysis;

namespace GameInfoTools.Tests;

/// <summary>
/// Unit tests for CrossReferenceDb including reference tracking,
/// lookup operations, and cross-reference analysis functionality.
/// </summary>
public class CrossReferenceDbTests {
	[Fact]
	public void Constructor_CreatesInstance() {
		var db = new CrossReferenceDb();
		Assert.NotNull(db);
	}

	[Fact]
	public void AddRef_AddsReference() {
		var db = new CrossReferenceDb();
		db.AddRef(0x8000, 0x9000, CrossReferenceDb.RefType.Call);

		var refs = db.GetRefsTo(0x9000).ToList();

		Assert.Single(refs);
		Assert.Equal(0x8000, refs[0].SourceAddress);
		Assert.Equal(0x9000, refs[0].TargetAddress);
		Assert.Equal(CrossReferenceDb.RefType.Call, refs[0].Type);
	}

	[Fact]
	public void GetRefsFrom_ReturnsCorrectReferences() {
		var db = new CrossReferenceDb();
		db.AddRef(0x8000, 0x9000, CrossReferenceDb.RefType.Call);
		db.AddRef(0x8000, 0xA000, CrossReferenceDb.RefType.Jump);

		var refs = db.GetRefsFrom(0x8000).ToList();

		Assert.Equal(2, refs.Count);
	}

	[Fact]
	public void GetRefsTo_EmptyForUnknownAddress() {
		var db = new CrossReferenceDb();

		var refs = db.GetRefsTo(0xFFFF).ToList();

		Assert.Empty(refs);
	}

	[Fact]
	public void GetCallersOf_ReturnsDistinctSources() {
		var db = new CrossReferenceDb();
		db.AddRef(0x8000, 0x9000, CrossReferenceDb.RefType.Call);
		db.AddRef(0x8100, 0x9000, CrossReferenceDb.RefType.Call);
		db.AddRef(0x8000, 0x9000, CrossReferenceDb.RefType.Jump); // Same source, different type

		var callers = db.GetCallersOf(0x9000).ToList();

		Assert.Equal(2, callers.Count); // Only 2 distinct sources
		Assert.Contains(0x8000, callers);
		Assert.Contains(0x8100, callers);
	}

	[Fact]
	public void CrossRef_HasCorrectProperties() {
		var xref = new CrossReferenceDb.CrossRef(0x8000, 0x9000, CrossReferenceDb.RefType.Call, "Test comment");

		Assert.Equal(0x8000, xref.SourceAddress);
		Assert.Equal(0x9000, xref.TargetAddress);
		Assert.Equal(CrossReferenceDb.RefType.Call, xref.Type);
		Assert.Equal("Test comment", xref.Comment);
	}

	[Fact]
	public void RefType_HasExpectedValues() {
		Assert.True(Enum.IsDefined(typeof(CrossReferenceDb.RefType), "Jump"));
		Assert.True(Enum.IsDefined(typeof(CrossReferenceDb.RefType), "Call"));
		Assert.True(Enum.IsDefined(typeof(CrossReferenceDb.RefType), "Branch"));
		Assert.True(Enum.IsDefined(typeof(CrossReferenceDb.RefType), "DataRead"));
		Assert.True(Enum.IsDefined(typeof(CrossReferenceDb.RefType), "DataWrite"));
		Assert.True(Enum.IsDefined(typeof(CrossReferenceDb.RefType), "Indirect"));
		Assert.True(Enum.IsDefined(typeof(CrossReferenceDb.RefType), "Pointer"));
	}

	[Fact]
	public void AddRef_WithComment_PreservesComment() {
		var db = new CrossReferenceDb();
		db.AddRef(0x8000, 0x9000, CrossReferenceDb.RefType.Call, "Game main loop");

		var refs = db.GetRefsTo(0x9000).ToList();

		Assert.Equal("Game main loop", refs[0].Comment);
	}

	[Fact]
	public void MultipleRefs_ToSameAddress_AllPreserved() {
		var db = new CrossReferenceDb();
		db.AddRef(0x8000, 0x9000, CrossReferenceDb.RefType.Call);
		db.AddRef(0x8100, 0x9000, CrossReferenceDb.RefType.Jump);
		db.AddRef(0x8200, 0x9000, CrossReferenceDb.RefType.Branch);

		var refs = db.GetRefsTo(0x9000).ToList();

		Assert.Equal(3, refs.Count);
	}
}

/// <summary>
/// Unit tests for CrossReferenceBuilder which analyzes code
/// and automatically builds cross-references.
/// </summary>
public class CrossReferenceBuilderTests {
	[Fact]
	public void Constructor_CreatesInstance() {
		var builder = new CrossReferenceBuilder();
		Assert.NotNull(builder);
		Assert.NotNull(builder.Database);
	}

	[Fact]
	public void ProcessCode_JsrInstruction_AddsCallReference() {
		var rom = new byte[] {
			0x20, 0x10, 0x80, // JSR $8010
			0x60              // RTS
		};

		var builder = new CrossReferenceBuilder();
		builder.ProcessCode(rom, 0x8000);

		var refs = builder.GetReferencesFrom(0x8000).ToList();

		Assert.Single(refs);
		Assert.Equal(0x8010, refs[0].Target);
		Assert.Equal(CrossReferenceDb.RefType.Call, refs[0].Type);
	}

	[Fact]
	public void ProcessCode_JmpInstruction_AddsJumpReference() {
		var rom = new byte[] {
			0x4c, 0x20, 0x80, // JMP $8020
		};

		var builder = new CrossReferenceBuilder();
		builder.ProcessCode(rom, 0x8000);

		var refs = builder.GetReferencesFrom(0x8000).ToList();

		Assert.Single(refs);
		Assert.Equal(0x8020, refs[0].Target);
		Assert.Equal(CrossReferenceDb.RefType.Jump, refs[0].Type);
	}

	[Fact]
	public void ProcessCode_BranchInstruction_AddsBranchReference() {
		var rom = new byte[] {
			0xd0, 0x05, // BNE +5 (relative branch)
			0xea,       // NOP
			0xea,       // NOP
			0xea,       // NOP
			0xea,       // NOP
			0xea,       // NOP
			0x60        // RTS
		};

		var builder = new CrossReferenceBuilder();
		builder.ProcessCode(rom, 0x8000);

		var refs = builder.GetReferencesFrom(0x8000).ToList();

		Assert.Single(refs);
		Assert.Equal(CrossReferenceDb.RefType.Branch, refs[0].Type);
		// BNE from $8000, +2 for instruction length, +5 for offset = $8007
		Assert.Equal(0x8007, refs[0].Target);
	}

	[Fact]
	public void GetReferencesTo_ReturnsIncomingReferences() {
		var rom = new byte[] {
			0x20, 0x10, 0x80, // JSR $8010
			0x4c, 0x10, 0x80, // JMP $8010
		};

		var builder = new CrossReferenceBuilder();
		builder.ProcessCode(rom, 0x8000);

		var refs = builder.GetReferencesTo(0x8010).ToList();

		Assert.Equal(2, refs.Count);
	}

	[Fact]
	public void ProcessCode_MultipleInstructions_AnalyzesAll() {
		var rom = new byte[] {
			0x20, 0x20, 0x80, // JSR $8020
			0xa9, 0x42,       // LDA #$42
			0x4c, 0x30, 0x80, // JMP $8030
		};

		var builder = new CrossReferenceBuilder();
		builder.ProcessCode(rom, 0x8000);

		var refs = builder.GetReferencesFrom(0x8000).ToList();
		Assert.Single(refs);
		Assert.Equal(0x8020, refs[0].Target);

		// JSR is 3 bytes, LDA is 2 bytes, so JMP is at $8005
		var jumpRefs = builder.GetReferencesFrom(0x8005).ToList();
		Assert.Single(jumpRefs);
		Assert.Equal(0x8030, jumpRefs[0].Target);
	}
}
