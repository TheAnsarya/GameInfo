using System.Text;
using GameInfoTools.Analysis;
using Xunit;

namespace GameInfoTools.Tests;

/// <summary>
/// Comprehensive tests for cross-reference database functionality.
/// </summary>
public class CrossReferenceAdvancedTests
{
	#region Reference Management Tests

	[Fact]
	public void AddRef_Jump_StoredCorrectly()
	{
		var db = new CrossReferenceDb();

		db.AddRef(0x8000, 0x8100, CrossReferenceDb.RefType.Jump);

		var refsTo = db.GetRefsTo(0x8100).ToList();
		Assert.Single(refsTo);
		Assert.Equal(0x8000, refsTo[0].SourceAddress);
		Assert.Equal(CrossReferenceDb.RefType.Jump, refsTo[0].Type);
	}

	[Fact]
	public void AddRef_Call_StoredCorrectly()
	{
		var db = new CrossReferenceDb();

		db.AddRef(0x8050, 0x9000, CrossReferenceDb.RefType.Call, "Main loop call");

		var refsTo = db.GetRefsTo(0x9000).ToList();
		Assert.Single(refsTo);
		Assert.Equal(CrossReferenceDb.RefType.Call, refsTo[0].Type);
		Assert.Equal("Main loop call", refsTo[0].Comment);
	}

	[Fact]
	public void AddRef_MultipleToSameTarget_AllStored()
	{
		var db = new CrossReferenceDb();

		db.AddRef(0x8000, 0x9000, CrossReferenceDb.RefType.Call);
		db.AddRef(0x8100, 0x9000, CrossReferenceDb.RefType.Call);
		db.AddRef(0x8200, 0x9000, CrossReferenceDb.RefType.Jump);

		var refsTo = db.GetRefsTo(0x9000).ToList();
		Assert.Equal(3, refsTo.Count);
	}

	[Fact]
	public void AddRef_MultipleFromSameSource_AllStored()
	{
		var db = new CrossReferenceDb();

		db.AddRef(0x8000, 0x9000, CrossReferenceDb.RefType.Call);
		db.AddRef(0x8000, 0x9100, CrossReferenceDb.RefType.Call);
		db.AddRef(0x8000, 0x9200, CrossReferenceDb.RefType.DataRead);

		var refsFrom = db.GetRefsFrom(0x8000).ToList();
		Assert.Equal(3, refsFrom.Count);
	}

	[Fact]
	public void GetRefsTo_NoRefs_ReturnsEmpty()
	{
		var db = new CrossReferenceDb();

		var refs = db.GetRefsTo(0x8000);

		Assert.Empty(refs);
	}

	[Fact]
	public void GetRefsFrom_NoRefs_ReturnsEmpty()
	{
		var db = new CrossReferenceDb();

		var refs = db.GetRefsFrom(0x8000);

		Assert.Empty(refs);
	}

	#endregion

	#region Callers and Callees Tests

	[Fact]
	public void GetCallersOf_ReturnsDistinctSources()
	{
		var db = new CrossReferenceDb();

		db.AddRef(0x8000, 0x9000, CrossReferenceDb.RefType.Call);
		db.AddRef(0x8000, 0x9000, CrossReferenceDb.RefType.Jump); // Same source, different type
		db.AddRef(0x8100, 0x9000, CrossReferenceDb.RefType.Call);

		var callers = db.GetCallersOf(0x9000).ToList();

		Assert.Equal(2, callers.Count); // 0x8000 and 0x8100
		Assert.Contains(0x8000, callers);
		Assert.Contains(0x8100, callers);
	}

	[Fact]
	public void GetCalleesOf_ReturnsDistinctTargets()
	{
		var db = new CrossReferenceDb();

		db.AddRef(0x8000, 0x9000, CrossReferenceDb.RefType.Call);
		db.AddRef(0x8000, 0x9000, CrossReferenceDb.RefType.Jump);
		db.AddRef(0x8000, 0x9100, CrossReferenceDb.RefType.Call);

		var callees = db.GetCalleesOf(0x8000).ToList();

		Assert.Equal(2, callees.Count);
		Assert.Contains(0x9000, callees);
		Assert.Contains(0x9100, callees);
	}

	#endregion

	#region Label and Comment Tests

	[Fact]
	public void SetLabel_NewLabel_Stored()
	{
		var db = new CrossReferenceDb();

		db.SetLabel(0x8000, "MainLoop");

		Assert.Equal("MainLoop", db.GetLabel(0x8000));
	}

	[Fact]
	public void SetLabel_OverwriteLabel_Updated()
	{
		var db = new CrossReferenceDb();

		db.SetLabel(0x8000, "OldLabel");
		db.SetLabel(0x8000, "NewLabel");

		Assert.Equal("NewLabel", db.GetLabel(0x8000));
	}

	[Fact]
	public void GetLabel_NoLabel_ReturnsNull()
	{
		var db = new CrossReferenceDb();

		Assert.Null(db.GetLabel(0x8000));
	}

	[Fact]
	public void SetComment_NewComment_Stored()
	{
		var db = new CrossReferenceDb();

		db.SetComment(0x8000, "This is the entry point");

		Assert.Equal("This is the entry point", db.GetComment(0x8000));
	}

	[Fact]
	public void SetComment_OverwriteComment_Updated()
	{
		var db = new CrossReferenceDb();

		db.SetComment(0x8000, "Old comment");
		db.SetComment(0x8000, "New comment");

		Assert.Equal("New comment", db.GetComment(0x8000));
	}

	[Fact]
	public void GetComment_NoComment_ReturnsNull()
	{
		var db = new CrossReferenceDb();

		Assert.Null(db.GetComment(0x8000));
	}

	#endregion

	#region BuildFromRom Tests

	[Fact]
	public void BuildFromRom_JmpAbsolute_CreatesJumpRef()
	{
		var db = new CrossReferenceDb();
		// JMP $9000 = 4C 00 90
		var data = new byte[] { 0x4c, 0x00, 0x90 };

		db.BuildFromRom(data, 0, data.Length, 0x8000);

		var refs = db.GetRefsTo(0x9000).ToList();
		Assert.Single(refs);
		Assert.Equal(CrossReferenceDb.RefType.Jump, refs[0].Type);
		Assert.Equal(0x8000, refs[0].SourceAddress);
	}

	[Fact]
	public void BuildFromRom_JsrAbsolute_CreatesCallRef()
	{
		var db = new CrossReferenceDb();
		// JSR $9000 = 20 00 90
		var data = new byte[] { 0x20, 0x00, 0x90 };

		db.BuildFromRom(data, 0, data.Length, 0x8000);

		var refs = db.GetRefsTo(0x9000).ToList();
		Assert.Single(refs);
		Assert.Equal(CrossReferenceDb.RefType.Call, refs[0].Type);
	}

	[Fact]
	public void BuildFromRom_LdaAbsolute_CreatesDataReadRef()
	{
		var db = new CrossReferenceDb();
		// LDA $0400 = AD 00 04
		var data = new byte[] { 0xad, 0x00, 0x04 };

		db.BuildFromRom(data, 0, data.Length, 0x8000);

		var refs = db.GetRefsTo(0x0400).ToList();
		Assert.Single(refs);
		Assert.Equal(CrossReferenceDb.RefType.DataRead, refs[0].Type);
	}

	[Fact]
	public void BuildFromRom_StaAbsolute_CreatesDataWriteRef()
	{
		var db = new CrossReferenceDb();
		// STA $0400 = 8D 00 04
		var data = new byte[] { 0x8d, 0x00, 0x04 };

		db.BuildFromRom(data, 0, data.Length, 0x8000);

		var refs = db.GetRefsTo(0x0400).ToList();
		Assert.Single(refs);
		Assert.Equal(CrossReferenceDb.RefType.DataWrite, refs[0].Type);
	}

	[Fact]
	public void BuildFromRom_JmpIndirect_CreatesIndirectRef()
	{
		var db = new CrossReferenceDb();
		// JMP ($FFFE) = 6C FE FF
		var data = new byte[] { 0x6c, 0xfe, 0xff };

		db.BuildFromRom(data, 0, data.Length, 0x8000);

		var refs = db.GetRefsTo(0xfffe).ToList();
		Assert.Single(refs);
		Assert.Equal(CrossReferenceDb.RefType.Indirect, refs[0].Type);
	}

	[Fact]
	public void BuildFromRom_MultipleInstructions_AllParsed()
	{
		var db = new CrossReferenceDb();
		// JSR $9000, LDA $0400, STA $0500, JMP $8000
		var data = new byte[]
		{
			0x20, 0x00, 0x90,  // JSR $9000
			0xad, 0x00, 0x04,  // LDA $0400
			0x8d, 0x00, 0x05,  // STA $0500
			0x4c, 0x00, 0x80   // JMP $8000
		};

		db.BuildFromRom(data, 0, data.Length, 0x8000);

		Assert.Equal(4, db.RefCount);
		Assert.NotEmpty(db.GetRefsTo(0x9000)); // JSR target
		Assert.NotEmpty(db.GetRefsTo(0x0400)); // LDA target
		Assert.NotEmpty(db.GetRefsTo(0x0500)); // STA target
		Assert.NotEmpty(db.GetRefsTo(0x8000)); // JMP target
	}

	[Fact]
	public void BuildFromRom_WithOffset_UsesCorrectAddresses()
	{
		var db = new CrossReferenceDb();
		var data = new byte[0x20];
		data[0x10] = 0x20; // JSR
		data[0x11] = 0x00;
		data[0x12] = 0x90;

		db.BuildFromRom(data, 0x10, 3, 0xc000);

		var refs = db.GetRefsTo(0x9000).ToList();
		Assert.Single(refs);
		Assert.Equal(0xc000, refs[0].SourceAddress);
	}

	#endregion

	#region Analysis Tests

	[Fact]
	public void FindEntryPoints_NoIncomingRefs_ReturnsAddresses()
	{
		var db = new CrossReferenceDb();

		// 0x8000 calls 0x9000, no refs TO 0x8000
		db.AddRef(0x8000, 0x9000, CrossReferenceDb.RefType.Call);
		// 0x8100 calls 0x9000
		db.AddRef(0x8100, 0x9000, CrossReferenceDb.RefType.Call);

		var entryPoints = db.FindEntryPoints().ToList();

		Assert.Contains(0x8000, entryPoints);
		Assert.Contains(0x8100, entryPoints);
		Assert.DoesNotContain(0x9000, entryPoints);
	}

	[Fact]
	public void FindSubroutines_WithJsrCalls_ReturnsTargets()
	{
		var db = new CrossReferenceDb();

		db.AddRef(0x8000, 0x9000, CrossReferenceDb.RefType.Call);
		db.AddRef(0x8100, 0x9100, CrossReferenceDb.RefType.Jump); // Jump, not call
		db.AddRef(0x8200, 0x9200, CrossReferenceDb.RefType.Call);

		var subroutines = db.FindSubroutines().ToList();

		Assert.Contains(0x9000, subroutines);
		Assert.Contains(0x9200, subroutines);
		Assert.DoesNotContain(0x9100, subroutines); // Jump target, not subroutine
	}

	#endregion

	#region Export Tests

	[Fact]
	public void GenerateReport_WithRefs_IncludesAll()
	{
		var db = new CrossReferenceDb();

		db.AddRef(0x8000, 0x9000, CrossReferenceDb.RefType.Call);
		db.SetLabel(0x9000, "TestSub");

		var report = db.GenerateReport();

		Assert.Contains("$9000", report);
		Assert.Contains("TestSub", report);
		Assert.Contains("Call", report);
		Assert.Contains("$8000", report);
	}

	[Fact]
	public void ExportToJson_WithRefs_ValidJson()
	{
		var db = new CrossReferenceDb();

		db.AddRef(0x8000, 0x9000, CrossReferenceDb.RefType.Call);
		db.SetLabel(0x9000, "TestSub");

		var json = db.ExportToJson();

		Assert.Contains("\"crossReferences\"", json);
		Assert.Contains("\"source\"", json);
		Assert.Contains("\"target\"", json);
		Assert.Contains("\"labels\"", json);
		Assert.Contains("TestSub", json);
	}

	[Fact]
	public void ExportToJson_EmptyDb_ValidEmptyJson()
	{
		var db = new CrossReferenceDb();

		var json = db.ExportToJson();

		// JSON format uses \r\n line endings, so empty array is on its own line
		Assert.Contains("\"crossReferences\": [", json);
		Assert.Contains("\"labels\": {", json);
	}

	#endregion

	#region Statistics Tests

	[Fact]
	public void RefCount_TracksAllRefs()
	{
		var db = new CrossReferenceDb();

		db.AddRef(0x8000, 0x9000, CrossReferenceDb.RefType.Call);
		db.AddRef(0x8100, 0x9000, CrossReferenceDb.RefType.Call);
		db.AddRef(0x8000, 0x9100, CrossReferenceDb.RefType.Jump);

		Assert.Equal(3, db.RefCount);
	}

	[Fact]
	public void TargetCount_CountsUniqueTargets()
	{
		var db = new CrossReferenceDb();

		db.AddRef(0x8000, 0x9000, CrossReferenceDb.RefType.Call);
		db.AddRef(0x8100, 0x9000, CrossReferenceDb.RefType.Call);
		db.AddRef(0x8000, 0x9100, CrossReferenceDb.RefType.Jump);

		Assert.Equal(2, db.TargetCount); // 0x9000 and 0x9100
	}

	[Fact]
	public void Clear_RemovesAllData()
	{
		var db = new CrossReferenceDb();

		db.AddRef(0x8000, 0x9000, CrossReferenceDb.RefType.Call);
		db.SetLabel(0x9000, "Test");
		db.SetComment(0x9000, "Comment");

		db.Clear();

		Assert.Equal(0, db.RefCount);
		Assert.Equal(0, db.TargetCount);
		Assert.Null(db.GetLabel(0x9000));
		Assert.Null(db.GetComment(0x9000));
	}

	#endregion

	#region Reference Type Tests

	[Theory]
	[InlineData(CrossReferenceDb.RefType.Jump)]
	[InlineData(CrossReferenceDb.RefType.Call)]
	[InlineData(CrossReferenceDb.RefType.Branch)]
	[InlineData(CrossReferenceDb.RefType.DataRead)]
	[InlineData(CrossReferenceDb.RefType.DataWrite)]
	[InlineData(CrossReferenceDb.RefType.Indirect)]
	[InlineData(CrossReferenceDb.RefType.Pointer)]
	public void AddRef_AllRefTypes_Stored(CrossReferenceDb.RefType refType)
	{
		var db = new CrossReferenceDb();

		db.AddRef(0x8000, 0x9000, refType);

		var refs = db.GetRefsTo(0x9000).ToList();
		Assert.Single(refs);
		Assert.Equal(refType, refs[0].Type);
	}

	#endregion

	#region Complex Scenarios

	[Fact]
	public void BuildCallGraph_MultiLevel_TracksAll()
	{
		var db = new CrossReferenceDb();

		// Main -> SubA -> SubB
		db.AddRef(0x8000, 0x8100, CrossReferenceDb.RefType.Call); // Main calls SubA
		db.AddRef(0x8100, 0x8200, CrossReferenceDb.RefType.Call); // SubA calls SubB
		db.AddRef(0x8100, 0x8300, CrossReferenceDb.RefType.Call); // SubA calls SubC

		// Verify call graph
		var subACalls = db.GetCalleesOf(0x8100).ToList();
		Assert.Equal(2, subACalls.Count);
		Assert.Contains(0x8200, subACalls);
		Assert.Contains(0x8300, subACalls);

		var mainCalls = db.GetCalleesOf(0x8000).ToList();
		Assert.Single(mainCalls);
		Assert.Equal(0x8100, mainCalls[0]);
	}

	[Fact]
	public void RecursiveCalls_Handled()
	{
		var db = new CrossReferenceDb();

		// Self-recursive function
		db.AddRef(0x8000, 0x8000, CrossReferenceDb.RefType.Call);

		var callersOf8000 = db.GetCallersOf(0x8000).ToList();
		var calleesOf8000 = db.GetCalleesOf(0x8000).ToList();

		Assert.Contains(0x8000, callersOf8000);
		Assert.Contains(0x8000, calleesOf8000);
	}

	#endregion
}
