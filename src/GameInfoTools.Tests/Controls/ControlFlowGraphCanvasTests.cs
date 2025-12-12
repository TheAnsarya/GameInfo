using System.Collections.ObjectModel;
using GameInfoTools.UI.Controls;

namespace GameInfoTools.Tests.Controls;

/// <summary>
/// Tests for ControlFlowGraphCanvas control.
/// </summary>
public class ControlFlowGraphCanvasTests {
	#region Node Creation Tests

	[Fact]
	public void CfgNode_Create_SetsAllProperties() {
		var node = new CfgNode(
			Id: "block_0",
			Label: "Entry",
			StartAddress: 0x8000,
			EndAddress: 0x8010,
			NodeType: CfgNodeType.Entry,
			Preview: "LDA #$00"
		);

		Assert.Equal("block_0", node.Id);
		Assert.Equal("Entry", node.Label);
		Assert.Equal(0x8000, node.StartAddress);
		Assert.Equal(0x8010, node.EndAddress);
		Assert.Equal(CfgNodeType.Entry, node.NodeType);
		Assert.Equal("LDA #$00", node.Preview);
	}

	[Fact]
	public void CfgEdge_Create_SetsAllProperties() {
		var edge = new CfgEdge(
			FromId: "block_0",
			ToId: "block_1",
			EdgeType: CfgEdgeType.Sequential
		);

		Assert.Equal("block_0", edge.FromId);
		Assert.Equal("block_1", edge.ToId);
		Assert.Equal(CfgEdgeType.Sequential, edge.EdgeType);
	}

	#endregion

	#region Node Type Tests

	[Theory]
	[InlineData(CfgNodeType.Entry)]
	[InlineData(CfgNodeType.Exit)]
	[InlineData(CfgNodeType.Normal)]
	[InlineData(CfgNodeType.LoopHeader)]
	[InlineData(CfgNodeType.Conditional)]
	public void CfgNode_AllNodeTypes_AreValid(CfgNodeType nodeType) {
		var node = new CfgNode("test", "Test", 0, 0, nodeType, "");
		Assert.Equal(nodeType, node.NodeType);
	}

	#endregion

	#region Edge Type Tests

	[Theory]
	[InlineData(CfgEdgeType.Sequential)]
	[InlineData(CfgEdgeType.Unconditional)]
	[InlineData(CfgEdgeType.ConditionalTrue)]
	[InlineData(CfgEdgeType.ConditionalFalse)]
	[InlineData(CfgEdgeType.BackEdge)]
	[InlineData(CfgEdgeType.Call)]
	public void CfgEdge_AllEdgeTypes_AreValid(CfgEdgeType edgeType) {
		var edge = new CfgEdge("from", "to", edgeType);
		Assert.Equal(edgeType, edge.EdgeType);
	}

	#endregion

	#region Canvas Basic Tests

	[Fact]
	public void Canvas_InitialState_HasNoNodes() {
		var canvas = new ControlFlowGraphCanvas();

		Assert.Null(canvas.Nodes);
		Assert.Null(canvas.Edges);
		Assert.Null(canvas.SelectedNodeId);
	}

	[Fact]
	public void Canvas_SetNodes_ReturnsNodes() {
		var canvas = new ControlFlowGraphCanvas();
		var nodes = new ObservableCollection<CfgNode>
		{
			new CfgNode("n1", "Block 1", 0x8000, 0x8010, CfgNodeType.Entry, "LDA"),
			new CfgNode("n2", "Block 2", 0x8010, 0x8020, CfgNodeType.Exit, "RTS")
		};

		canvas.Nodes = nodes;

		Assert.Equal(2, canvas.Nodes.Count);
	}

	[Fact]
	public void Canvas_SetEdges_ReturnsEdges() {
		var canvas = new ControlFlowGraphCanvas();
		var edges = new ObservableCollection<CfgEdge>
		{
			new CfgEdge("n1", "n2", CfgEdgeType.Sequential)
		};

		canvas.Edges = edges;

		Assert.Single(canvas.Edges);
	}

	[Fact]
	public void Canvas_SetSelectedNodeId_SelectsNode() {
		var canvas = new ControlFlowGraphCanvas();
		canvas.SelectedNodeId = "test_node";

		Assert.Equal("test_node", canvas.SelectedNodeId);
	}

	#endregion

	#region Event Tests

	[Fact]
	public void CfgNodeSelectedEventArgs_Create_SetsProperties() {
		var args = new CfgNodeSelectedEventArgs("node1", 0x8000);

		Assert.Equal("node1", args.NodeId);
		Assert.Equal(0x8000, args.StartAddress);
	}

	[Fact]
	public void Canvas_NodeSelectedEvent_CanSubscribe() {
		var canvas = new ControlFlowGraphCanvas();
		bool eventFired = false;

		canvas.NodeSelected += (sender, e) => eventFired = true;

		// Can't easily trigger the event without simulating mouse click
		// Just verify subscription doesn't throw
		Assert.False(eventFired);
	}

	[Fact]
	public void Canvas_NodeDoubleClickedEvent_CanSubscribe() {
		var canvas = new ControlFlowGraphCanvas();
		bool eventFired = false;

		canvas.NodeDoubleClicked += (sender, e) => eventFired = true;

		// Can't easily trigger the event without simulating mouse click
		// Just verify subscription doesn't throw
		Assert.False(eventFired);
	}

	#endregion

	#region Graph Structure Tests

	[Fact]
	public void Canvas_LinearGraph_CreatesValidStructure() {
		var canvas = new ControlFlowGraphCanvas();
		canvas.Nodes = new ObservableCollection<CfgNode>
		{
			new CfgNode("entry", "Entry", 0x8000, 0x8005, CfgNodeType.Entry, "SEI"),
			new CfgNode("body", "Body", 0x8006, 0x8020, CfgNodeType.Normal, "LDA"),
			new CfgNode("exit", "Exit", 0x8021, 0x8022, CfgNodeType.Exit, "RTS")
		};
		canvas.Edges = new ObservableCollection<CfgEdge>
		{
			new CfgEdge("entry", "body", CfgEdgeType.Sequential),
			new CfgEdge("body", "exit", CfgEdgeType.Sequential)
		};

		Assert.Equal(3, canvas.Nodes.Count);
		Assert.Equal(2, canvas.Edges.Count);
	}

	[Fact]
	public void Canvas_BranchGraph_CreatesValidStructure() {
		var canvas = new ControlFlowGraphCanvas();
		canvas.Nodes = new ObservableCollection<CfgNode>
		{
			new CfgNode("entry", "Entry", 0x8000, 0x8003, CfgNodeType.Entry, "LDA"),
			new CfgNode("branch", "Branch", 0x8004, 0x8008, CfgNodeType.Conditional, "BEQ"),
			new CfgNode("true", "True Path", 0x8009, 0x8010, CfgNodeType.Normal, "INC"),
			new CfgNode("false", "False Path", 0x8020, 0x8030, CfgNodeType.Normal, "DEC"),
			new CfgNode("exit", "Exit", 0x8031, 0x8032, CfgNodeType.Exit, "RTS")
		};
		canvas.Edges = new ObservableCollection<CfgEdge>
		{
			new CfgEdge("entry", "branch", CfgEdgeType.Sequential),
			new CfgEdge("branch", "true", CfgEdgeType.ConditionalTrue),
			new CfgEdge("branch", "false", CfgEdgeType.ConditionalFalse),
			new CfgEdge("true", "exit", CfgEdgeType.Sequential),
			new CfgEdge("false", "exit", CfgEdgeType.Sequential)
		};

		Assert.Equal(5, canvas.Nodes.Count);
		Assert.Equal(5, canvas.Edges.Count);
	}

	[Fact]
	public void Canvas_LoopGraph_CreatesValidStructure() {
		var canvas = new ControlFlowGraphCanvas();
		canvas.Nodes = new ObservableCollection<CfgNode>
		{
			new CfgNode("entry", "Entry", 0x8000, 0x8003, CfgNodeType.Entry, "LDX"),
			new CfgNode("loop", "Loop Header", 0x8004, 0x8010, CfgNodeType.LoopHeader, "DEX"),
			new CfgNode("exit", "Exit", 0x8011, 0x8012, CfgNodeType.Exit, "RTS")
		};
		canvas.Edges = new ObservableCollection<CfgEdge>
		{
			new CfgEdge("entry", "loop", CfgEdgeType.Sequential),
			new CfgEdge("loop", "loop", CfgEdgeType.BackEdge),
			new CfgEdge("loop", "exit", CfgEdgeType.ConditionalTrue)
		};

		Assert.Equal(3, canvas.Nodes.Count);
		Assert.Equal(3, canvas.Edges.Count);

		// Verify back edge exists
		Assert.Contains(canvas.Edges, e => e.EdgeType == CfgEdgeType.BackEdge);
	}

	#endregion

	#region Public Method Tests

	[Fact]
	public void Canvas_ResetView_DoesNotThrow() {
		var canvas = new ControlFlowGraphCanvas();

		var exception = Record.Exception(() => canvas.ResetView());

		Assert.Null(exception);
	}

	[Fact]
	public void Canvas_ZoomIn_DoesNotThrow() {
		var canvas = new ControlFlowGraphCanvas();

		var exception = Record.Exception(() => canvas.ZoomIn());

		Assert.Null(exception);
	}

	[Fact]
	public void Canvas_ZoomOut_DoesNotThrow() {
		var canvas = new ControlFlowGraphCanvas();

		var exception = Record.Exception(() => canvas.ZoomOut());

		Assert.Null(exception);
	}

	[Fact]
	public void Canvas_FitToView_WithNoNodes_DoesNotThrow() {
		var canvas = new ControlFlowGraphCanvas();

		var exception = Record.Exception(() => canvas.FitToView());

		Assert.Null(exception);
	}

	[Fact]
	public void Canvas_FocusNode_WithNonExistentNode_DoesNotThrow() {
		var canvas = new ControlFlowGraphCanvas();

		var exception = Record.Exception(() => canvas.FocusNode("nonexistent"));

		Assert.Null(exception);
	}

	#endregion

	#region Node Record Equality Tests

	[Fact]
	public void CfgNode_SameValues_AreEqual() {
		var node1 = new CfgNode("id", "Label", 0x8000, 0x8010, CfgNodeType.Entry, "Preview");
		var node2 = new CfgNode("id", "Label", 0x8000, 0x8010, CfgNodeType.Entry, "Preview");

		Assert.Equal(node1, node2);
	}

	[Fact]
	public void CfgNode_DifferentIds_AreNotEqual() {
		var node1 = new CfgNode("id1", "Label", 0x8000, 0x8010, CfgNodeType.Entry, "Preview");
		var node2 = new CfgNode("id2", "Label", 0x8000, 0x8010, CfgNodeType.Entry, "Preview");

		Assert.NotEqual(node1, node2);
	}

	[Fact]
	public void CfgEdge_SameValues_AreEqual() {
		var edge1 = new CfgEdge("from", "to", CfgEdgeType.Sequential);
		var edge2 = new CfgEdge("from", "to", CfgEdgeType.Sequential);

		Assert.Equal(edge1, edge2);
	}

	[Fact]
	public void CfgEdge_DifferentTypes_AreNotEqual() {
		var edge1 = new CfgEdge("from", "to", CfgEdgeType.Sequential);
		var edge2 = new CfgEdge("from", "to", CfgEdgeType.Unconditional);

		Assert.NotEqual(edge1, edge2);
	}

	#endregion

	#region Complex Graph Tests

	[Fact]
	public void Canvas_EmptyGraph_HandlesGracefully() {
		var canvas = new ControlFlowGraphCanvas();
		canvas.Nodes = new ObservableCollection<CfgNode>();
		canvas.Edges = new ObservableCollection<CfgEdge>();

		Assert.Empty(canvas.Nodes);
		Assert.Empty(canvas.Edges);
	}

	[Fact]
	public void Canvas_SingleNode_HandlesCorrectly() {
		var canvas = new ControlFlowGraphCanvas();
		canvas.Nodes = new ObservableCollection<CfgNode>
		{
			new CfgNode("single", "Single Block", 0x8000, 0x8001, CfgNodeType.Normal, "RTS")
		};
		canvas.Edges = new ObservableCollection<CfgEdge>();

		Assert.Single(canvas.Nodes);
		Assert.Empty(canvas.Edges);
	}

	[Fact]
	public void Canvas_DisconnectedNodes_HandlesCorrectly() {
		var canvas = new ControlFlowGraphCanvas();
		canvas.Nodes = new ObservableCollection<CfgNode>
		{
			new CfgNode("n1", "Block 1", 0x8000, 0x8010, CfgNodeType.Normal, ""),
			new CfgNode("n2", "Block 2", 0x9000, 0x9010, CfgNodeType.Normal, "")
		};
		canvas.Edges = new ObservableCollection<CfgEdge>();

		Assert.Equal(2, canvas.Nodes.Count);
		Assert.Empty(canvas.Edges);
	}

	[Fact]
	public void Canvas_MultipleEntryPoints_HandlesCorrectly() {
		var canvas = new ControlFlowGraphCanvas();
		canvas.Nodes = new ObservableCollection<CfgNode>
		{
			new CfgNode("entry1", "Entry 1", 0x8000, 0x8010, CfgNodeType.Entry, ""),
			new CfgNode("entry2", "Entry 2", 0x9000, 0x9010, CfgNodeType.Entry, ""),
			new CfgNode("common", "Common", 0xa000, 0xa010, CfgNodeType.Normal, "")
		};
		canvas.Edges = new ObservableCollection<CfgEdge>
		{
			new CfgEdge("entry1", "common", CfgEdgeType.Unconditional),
			new CfgEdge("entry2", "common", CfgEdgeType.Unconditional)
		};

		var entryNodes = canvas.Nodes.Where(n => n.NodeType == CfgNodeType.Entry).ToList();
		Assert.Equal(2, entryNodes.Count);
	}

	[Fact]
	public void Canvas_MultipleExitPoints_HandlesCorrectly() {
		var canvas = new ControlFlowGraphCanvas();
		canvas.Nodes = new ObservableCollection<CfgNode>
		{
			new CfgNode("entry", "Entry", 0x8000, 0x8010, CfgNodeType.Entry, ""),
			new CfgNode("exit1", "Exit 1", 0x8011, 0x8012, CfgNodeType.Exit, "RTS"),
			new CfgNode("exit2", "Exit 2", 0x8020, 0x8021, CfgNodeType.Exit, "RTI")
		};
		canvas.Edges = new ObservableCollection<CfgEdge>
		{
			new CfgEdge("entry", "exit1", CfgEdgeType.ConditionalTrue),
			new CfgEdge("entry", "exit2", CfgEdgeType.ConditionalFalse)
		};

		var exitNodes = canvas.Nodes.Where(n => n.NodeType == CfgNodeType.Exit).ToList();
		Assert.Equal(2, exitNodes.Count);
	}

	#endregion

	#region Typical Subroutine Graph Tests

	[Fact]
	public void Canvas_TypicalSubroutine_SetsUpCorrectly() {
		// Models a typical 6502 subroutine:
		// ENTRY: SEI, LDA $00
		// LOOP:  DEX, BNE LOOP
		// EXIT:  RTS

		var canvas = new ControlFlowGraphCanvas();
		canvas.Nodes = new ObservableCollection<CfgNode>
		{
			new CfgNode("entry", "ENTRY", 0xC000, 0xC003, CfgNodeType.Entry, "SEI ; LDA $00"),
			new CfgNode("loop", "LOOP", 0xC004, 0xC006, CfgNodeType.LoopHeader, "DEX ; BNE LOOP"),
			new CfgNode("exit", "EXIT", 0xC007, 0xC007, CfgNodeType.Exit, "RTS")
		};
		canvas.Edges = new ObservableCollection<CfgEdge>
		{
			new CfgEdge("entry", "loop", CfgEdgeType.Sequential),
			new CfgEdge("loop", "loop", CfgEdgeType.BackEdge),
			new CfgEdge("loop", "exit", CfgEdgeType.ConditionalTrue)
		};

		// Verify structure
		Assert.Equal(3, canvas.Nodes.Count);
		Assert.Equal(3, canvas.Edges.Count);

		// Verify we have exactly one of each node type
		Assert.Single(canvas.Nodes.Where(n => n.NodeType == CfgNodeType.Entry));
		Assert.Single(canvas.Nodes.Where(n => n.NodeType == CfgNodeType.LoopHeader));
		Assert.Single(canvas.Nodes.Where(n => n.NodeType == CfgNodeType.Exit));

		// Verify back edge exists
		Assert.Single(canvas.Edges.Where(e => e.EdgeType == CfgEdgeType.BackEdge));
	}

	#endregion
}
