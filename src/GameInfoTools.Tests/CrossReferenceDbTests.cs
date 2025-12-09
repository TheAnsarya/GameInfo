using GameInfoTools.Analysis;

namespace GameInfoTools.Tests;

public class CrossReferenceDbTests
{
	[Fact]
	public void Constructor_CreatesInstance()
	{
		var db = new CrossReferenceDb();
		Assert.NotNull(db);
	}

	[Fact]
	public void AddRef_AddsReference()
	{
		var db = new CrossReferenceDb();
		db.AddRef(0x8000, 0x9000, CrossReferenceDb.RefType.Call);

		var refs = db.GetRefsTo(0x9000).ToList();

		Assert.Single(refs);
		Assert.Equal(0x8000, refs[0].SourceAddress);
		Assert.Equal(0x9000, refs[0].TargetAddress);
		Assert.Equal(CrossReferenceDb.RefType.Call, refs[0].Type);
	}

	[Fact]
	public void GetRefsFrom_ReturnsCorrectReferences()
	{
		var db = new CrossReferenceDb();
		db.AddRef(0x8000, 0x9000, CrossReferenceDb.RefType.Call);
		db.AddRef(0x8000, 0xA000, CrossReferenceDb.RefType.Jump);

		var refs = db.GetRefsFrom(0x8000).ToList();

		Assert.Equal(2, refs.Count);
	}

	[Fact]
	public void GetRefsTo_EmptyForUnknownAddress()
	{
		var db = new CrossReferenceDb();

		var refs = db.GetRefsTo(0xFFFF).ToList();

		Assert.Empty(refs);
	}

	[Fact]
	public void GetCallersOf_ReturnsDistinctSources()
	{
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
	public void CrossRef_HasCorrectProperties()
	{
		var xref = new CrossReferenceDb.CrossRef(0x8000, 0x9000, CrossReferenceDb.RefType.Call, "Test comment");

		Assert.Equal(0x8000, xref.SourceAddress);
		Assert.Equal(0x9000, xref.TargetAddress);
		Assert.Equal(CrossReferenceDb.RefType.Call, xref.Type);
		Assert.Equal("Test comment", xref.Comment);
	}

	[Fact]
	public void RefType_HasExpectedValues()
	{
		Assert.True(Enum.IsDefined(typeof(CrossReferenceDb.RefType), "Jump"));
		Assert.True(Enum.IsDefined(typeof(CrossReferenceDb.RefType), "Call"));
		Assert.True(Enum.IsDefined(typeof(CrossReferenceDb.RefType), "Branch"));
		Assert.True(Enum.IsDefined(typeof(CrossReferenceDb.RefType), "DataRead"));
		Assert.True(Enum.IsDefined(typeof(CrossReferenceDb.RefType), "DataWrite"));
		Assert.True(Enum.IsDefined(typeof(CrossReferenceDb.RefType), "Indirect"));
		Assert.True(Enum.IsDefined(typeof(CrossReferenceDb.RefType), "Pointer"));
	}

	[Fact]
	public void AddRef_WithComment_PreservesComment()
	{
		var db = new CrossReferenceDb();
		db.AddRef(0x8000, 0x9000, CrossReferenceDb.RefType.Call, "Game main loop");

		var refs = db.GetRefsTo(0x9000).ToList();

		Assert.Equal("Game main loop", refs[0].Comment);
	}

	[Fact]
	public void MultipleRefs_ToSameAddress_AllPreserved()
	{
		var db = new CrossReferenceDb();
		db.AddRef(0x8000, 0x9000, CrossReferenceDb.RefType.Call);
		db.AddRef(0x8100, 0x9000, CrossReferenceDb.RefType.Jump);
		db.AddRef(0x8200, 0x9000, CrossReferenceDb.RefType.Branch);

		var refs = db.GetRefsTo(0x9000).ToList();

		Assert.Equal(3, refs.Count);
	}
}
