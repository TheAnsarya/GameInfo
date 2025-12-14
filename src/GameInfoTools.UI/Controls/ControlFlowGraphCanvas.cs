using System.Collections.ObjectModel;
using Avalonia;
using Avalonia.Controls;
using Avalonia.Input;
using Avalonia.Media;

namespace GameInfoTools.UI.Controls;

/// <summary>
/// Event args for node selection in the control flow graph.
/// </summary>
public class CfgNodeSelectedEventArgs : EventArgs {
	/// <summary>
	/// The unique ID of the selected node.
	/// </summary>
	public string NodeId { get; }

	/// <summary>
	/// The start address of the block.
	/// </summary>
	public int StartAddress { get; }

	public CfgNodeSelectedEventArgs(string nodeId, int startAddress) {
		NodeId = nodeId;
		StartAddress = startAddress;
	}
}

/// <summary>
/// Represents a node (basic block) in the control flow graph.
/// </summary>
public record CfgNode(
	string Id,
	string Label,
	int StartAddress,
	int EndAddress,
	CfgNodeType NodeType,
	string Preview
);

/// <summary>
/// Represents an edge (control flow) between two nodes.
/// </summary>
public record CfgEdge(
	string FromId,
	string ToId,
	CfgEdgeType EdgeType
);

/// <summary>
/// Type of node in the control flow graph.
/// </summary>
public enum CfgNodeType {
	/// <summary>Entry point of the function/routine.</summary>
	Entry,
	/// <summary>Exit point (RTS, RTI, etc.).</summary>
	Exit,
	/// <summary>Regular basic block.</summary>
	Normal,
	/// <summary>Loop header (target of back edge).</summary>
	LoopHeader,
	/// <summary>Conditional branch.</summary>
	Conditional
}

/// <summary>
/// Type of edge in the control flow graph.
/// </summary>
public enum CfgEdgeType {
	/// <summary>Normal sequential flow.</summary>
	Sequential,
	/// <summary>Unconditional jump.</summary>
	Unconditional,
	/// <summary>Conditional branch taken.</summary>
	ConditionalTrue,
	/// <summary>Conditional branch not taken (fall-through).</summary>
	ConditionalFalse,
	/// <summary>Back edge (loop).</summary>
	BackEdge,
	/// <summary>Function call edge.</summary>
	Call
}

/// <summary>
/// Layout position for a node.
/// </summary>
internal record NodeLayout(
	double X,
	double Y,
	double Width,
	double Height
);

/// <summary>
/// A custom control that renders a control flow graph with nodes and edges.
/// </summary>
public class ControlFlowGraphCanvas : Control {
	private const int DefaultNodeWidth = 140;
	private const int DefaultNodeHeight = 50;
	private const int NodePaddingX = 30;
	private const int NodePaddingY = 40;
	private const int ArrowSize = 8;

	private readonly Dictionary<string, NodeLayout> _nodeLayouts = [];
	private string? _hoveredNodeId;
	private string? _selectedNodeId;
	private Point _panOffset = new(0, 0);
	private double _zoom = 1.0;

	#region Styled Properties

	/// <summary>
	/// The nodes (basic blocks) to display.
	/// </summary>
	public static readonly StyledProperty<ObservableCollection<CfgNode>?> NodesProperty =
		AvaloniaProperty.Register<ControlFlowGraphCanvas, ObservableCollection<CfgNode>?>(nameof(Nodes));

	/// <summary>
	/// The edges (control flow) to display.
	/// </summary>
	public static readonly StyledProperty<ObservableCollection<CfgEdge>?> EdgesProperty =
		AvaloniaProperty.Register<ControlFlowGraphCanvas, ObservableCollection<CfgEdge>?>(nameof(Edges));

	/// <summary>
	/// Selected node ID.
	/// </summary>
	public static readonly StyledProperty<string?> SelectedNodeIdProperty =
		AvaloniaProperty.Register<ControlFlowGraphCanvas, string?>(nameof(SelectedNodeId));

	/// <summary>
	/// Gets or sets the graph nodes.
	/// </summary>
	public ObservableCollection<CfgNode>? Nodes {
		get => GetValue(NodesProperty);
		set => SetValue(NodesProperty, value);
	}

	/// <summary>
	/// Gets or sets the graph edges.
	/// </summary>
	public ObservableCollection<CfgEdge>? Edges {
		get => GetValue(EdgesProperty);
		set => SetValue(EdgesProperty, value);
	}

	/// <summary>
	/// Gets or sets the selected node ID.
	/// </summary>
	public string? SelectedNodeId {
		get => GetValue(SelectedNodeIdProperty);
		set => SetValue(SelectedNodeIdProperty, value);
	}

	#endregion

	#region Colors

	private static readonly Color EntryNodeColor = Color.FromRgb(0x4C, 0xAF, 0x50);     // Green
	private static readonly Color ExitNodeColor = Color.FromRgb(0xF4, 0x43, 0x36);      // Red
	private static readonly Color NormalNodeColor = Color.FromRgb(0x21, 0x96, 0xF3);    // Blue
	private static readonly Color LoopHeaderColor = Color.FromRgb(0x9C, 0x27, 0xB0);    // Purple
	private static readonly Color ConditionalColor = Color.FromRgb(0xFF, 0xC1, 0x07);   // Yellow/Amber

	private static readonly Color SelectedNodeBorderColor = Color.FromRgb(0xFF, 0xFF, 0xFF);
	private static readonly Color HoveredNodeBorderColor = Color.FromRgb(0x90, 0xCA, 0xF9);

	private static readonly Color EdgeSequentialColor = Color.FromRgb(0x90, 0x90, 0x90);
	private static readonly Color EdgeUnconditionalColor = Color.FromRgb(0x42, 0xA5, 0xF5);
	private static readonly Color EdgeTrueColor = Color.FromRgb(0x4C, 0xAF, 0x50);
	private static readonly Color EdgeFalseColor = Color.FromRgb(0xF4, 0x43, 0x36);
	private static readonly Color EdgeBackColor = Color.FromRgb(0x9C, 0x27, 0xB0);
	private static readonly Color EdgeCallColor = Color.FromRgb(0xFF, 0x98, 0x00);

	private static readonly Color BackgroundColor = Color.FromRgb(0x1E, 0x1E, 0x1E);
	private static readonly Color TextColor = Color.FromRgb(0xE0, 0xE0, 0xE0);

	#endregion

	/// <summary>
	/// Event raised when a node is selected.
	/// </summary>
	public event EventHandler<CfgNodeSelectedEventArgs>? NodeSelected;

	/// <summary>
	/// Event raised when a node is double-clicked.
	/// </summary>
	public event EventHandler<CfgNodeSelectedEventArgs>? NodeDoubleClicked;

	static ControlFlowGraphCanvas() {
		AffectsRender<ControlFlowGraphCanvas>(NodesProperty, EdgesProperty, SelectedNodeIdProperty);
		AffectsMeasure<ControlFlowGraphCanvas>(NodesProperty, EdgesProperty);
	}

	public ControlFlowGraphCanvas() {
		// Enable mouse interactions
		PointerPressed += OnPointerPressed;
		PointerMoved += OnPointerMoved;
		PointerWheelChanged += OnPointerWheelChanged;
		DoubleTapped += OnDoubleTapped;
	}

	#region Layout

	protected override Size MeasureOverride(Size availableSize) {
		var nodes = Nodes;
		if (nodes is null || nodes.Count == 0)
			return new Size(100, 100);

		// Calculate layout positions
		CalculateLayout();

		// Find bounds
		double maxX = 0, maxY = 0;
		foreach (var layout in _nodeLayouts.Values) {
			maxX = Math.Max(maxX, layout.X + layout.Width + NodePaddingX);
			maxY = Math.Max(maxY, layout.Y + layout.Height + NodePaddingY);
		}

		return new Size(Math.Max(100, maxX), Math.Max(100, maxY));
	}

	private void CalculateLayout() {
		_nodeLayouts.Clear();
		var nodes = Nodes;
		if (nodes is null || nodes.Count == 0) return;

		// Use hierarchical layout: arrange by depth from entry
		var edges = Edges ?? [];
		var nodeMap = nodes.ToDictionary(n => n.Id);

		// Build adjacency list
		var outgoing = new Dictionary<string, List<string>>();
		var incoming = new Dictionary<string, List<string>>();
		foreach (var node in nodes) {
			outgoing[node.Id] = [];
			incoming[node.Id] = [];
		}

		foreach (var edge in edges) {
			if (outgoing.ContainsKey(edge.FromId) && incoming.ContainsKey(edge.ToId)) {
				outgoing[edge.FromId].Add(edge.ToId);
				incoming[edge.ToId].Add(edge.FromId);
			}
		}

		// Find entry nodes (no incoming edges or Entry type)
		var entryNodes = nodes
			.Where(n => n.NodeType == CfgNodeType.Entry || !incoming[n.Id].Any())
			.Select(n => n.Id)
			.ToList();

		if (entryNodes.Count == 0 && nodes.Count > 0) {
			entryNodes.Add(nodes[0].Id);
		}

		// Calculate depth (layer) for each node using BFS
		var depth = new Dictionary<string, int>();
		var queue = new Queue<string>();

		foreach (var entry in entryNodes) {
			depth[entry] = 0;
			queue.Enqueue(entry);
		}

		while (queue.Count > 0) {
			var current = queue.Dequeue();
			var currentDepth = depth[current];

			foreach (var next in outgoing[current]) {
				if (!depth.ContainsKey(next) || depth[next] < currentDepth + 1) {
					// Only update if it creates a deeper placement (avoids back-edges causing issues)
					if (!depth.ContainsKey(next)) {
						depth[next] = currentDepth + 1;
						queue.Enqueue(next);
					}
				}
			}
		}

		// Assign depth to any remaining unvisited nodes
		foreach (var node in nodes) {
			if (!depth.ContainsKey(node.Id)) {
				depth[node.Id] = 0;
			}
		}

		// Group by layer
		var layers = new Dictionary<int, List<string>>();
		foreach (var (nodeId, nodeDepth) in depth) {
			if (!layers.ContainsKey(nodeDepth))
				layers[nodeDepth] = [];
			layers[nodeDepth].Add(nodeId);
		}

		// Position nodes
		foreach (var (layerIndex, layerNodes) in layers.OrderBy(l => l.Key)) {
			var y = NodePaddingY + (layerIndex * (DefaultNodeHeight + NodePaddingY));
			var layerWidth = layerNodes.Count * (DefaultNodeWidth + NodePaddingX);
			var startX = NodePaddingX;

			for (int i = 0; i < layerNodes.Count; i++) {
				var x = startX + (i * (DefaultNodeWidth + NodePaddingX));
				_nodeLayouts[layerNodes[i]] = new NodeLayout(x, y, DefaultNodeWidth, DefaultNodeHeight);
			}
		}
	}

	#endregion

	#region Rendering

	public override void Render(DrawingContext context) {
		base.Render(context);

		// Draw background
		context.FillRectangle(new SolidColorBrush(BackgroundColor), new Rect(0, 0, Bounds.Width, Bounds.Height));

		var nodes = Nodes;
		var edges = Edges;

		if (nodes is null || nodes.Count == 0) {
			// Draw empty state message
			var formattedText = new FormattedText(
				"No control flow graph data",
				System.Globalization.CultureInfo.CurrentCulture,
				FlowDirection.LeftToRight,
				new Typeface("Segoe UI"),
				14,
				new SolidColorBrush(TextColor));
			var textPos = new Point(
				(Bounds.Width - formattedText.Width) / 2,
				(Bounds.Height - formattedText.Height) / 2);
			context.DrawText(formattedText, textPos);
			return;
		}

		// Apply transform for pan/zoom
		using (context.PushTransform(Matrix.CreateTranslation(_panOffset.X, _panOffset.Y)))
		using (context.PushTransform(Matrix.CreateScale(_zoom, _zoom))) {
			// Draw edges first (behind nodes)
			if (edges is not null) {
				DrawEdges(context, nodes.ToDictionary(n => n.Id), edges);
			}

			// Draw nodes
			DrawNodes(context, nodes);
		}
	}

	private void DrawEdges(DrawingContext context, Dictionary<string, CfgNode> nodeMap, IEnumerable<CfgEdge> edges) {
		foreach (var edge in edges) {
			if (!_nodeLayouts.TryGetValue(edge.FromId, out var fromLayout) ||
				!_nodeLayouts.TryGetValue(edge.ToId, out var toLayout)) {
				continue;
			}

			var color = GetEdgeColor(edge.EdgeType);
			var pen = new Pen(new SolidColorBrush(color), 2);

			// Calculate edge start/end points
			var fromCenter = new Point(fromLayout.X + (fromLayout.Width / 2), fromLayout.Y + (fromLayout.Height / 2));
			var toCenter = new Point(toLayout.X + (toLayout.Width / 2), toLayout.Y + (toLayout.Height / 2));

			Point startPoint, endPoint;

			// Determine connection points based on relative positions
			if (Math.Abs(toLayout.Y - fromLayout.Y) > Math.Abs(toLayout.X - fromLayout.X)) {
				// Vertical connection
				if (toLayout.Y > fromLayout.Y) {
					startPoint = new Point(fromCenter.X, fromLayout.Y + fromLayout.Height);
					endPoint = new Point(toCenter.X, toLayout.Y);
				} else {
					startPoint = new Point(fromCenter.X, fromLayout.Y);
					endPoint = new Point(toCenter.X, toLayout.Y + toLayout.Height);
				}
			} else {
				// Horizontal connection
				if (toLayout.X > fromLayout.X) {
					startPoint = new Point(fromLayout.X + fromLayout.Width, fromCenter.Y);
					endPoint = new Point(toLayout.X, toCenter.Y);
				} else {
					startPoint = new Point(fromLayout.X, fromCenter.Y);
					endPoint = new Point(toLayout.X + toLayout.Width, toCenter.Y);
				}
			}

			// Draw edge line
			if (edge.EdgeType == CfgEdgeType.BackEdge) {
				// Draw back edge with curve
				DrawCurvedEdge(context, pen, startPoint, endPoint, true);
			} else {
				// Simple straight line with arrow
				context.DrawLine(pen, startPoint, endPoint);
				DrawArrowHead(context, pen, startPoint, endPoint);
			}
		}
	}

	private void DrawCurvedEdge(DrawingContext context, Pen pen, Point start, Point end, bool curveRight) {
		var geometry = new StreamGeometry();
		using (var ctx = geometry.Open()) {
			ctx.BeginFigure(start, false);

			// Create a bezier curve for back edges
			var controlOffset = curveRight ? 60 : -60;
			var control1 = new Point(start.X + controlOffset, start.Y);
			var control2 = new Point(end.X + controlOffset, end.Y);

			ctx.CubicBezierTo(control1, control2, end);
		}

		context.DrawGeometry(null, pen, geometry);
		DrawArrowHead(context, pen, new Point(end.X + (curveRight ? 30 : -30), end.Y), end);
	}

	private void DrawArrowHead(DrawingContext context, Pen pen, Point from, Point to) {
		var direction = new Vector(to.X - from.X, to.Y - from.Y);
		var length = Math.Sqrt((direction.X * direction.X) + (direction.Y * direction.Y));
		if (length < 1) return;

		direction = new Vector(direction.X / length, direction.Y / length);
		var perpendicular = new Vector(-direction.Y, direction.X);

		var arrowPoint1 = new Point(
			to.X - (direction.X * ArrowSize) + (perpendicular.X * ArrowSize / 2),
			to.Y - (direction.Y * ArrowSize) + (perpendicular.Y * ArrowSize / 2));
		var arrowPoint2 = new Point(
			to.X - (direction.X * ArrowSize) - (perpendicular.X * ArrowSize / 2),
			to.Y - (direction.Y * ArrowSize) - (perpendicular.Y * ArrowSize / 2));

		var geometry = new StreamGeometry();
		using (var ctx = geometry.Open()) {
			ctx.BeginFigure(to, true);
			ctx.LineTo(arrowPoint1);
			ctx.LineTo(arrowPoint2);
			ctx.EndFigure(true);
		}

		context.DrawGeometry(pen.Brush, pen, geometry);
	}

	private void DrawNodes(DrawingContext context, IEnumerable<CfgNode> nodes) {
		var typeface = new Typeface("Consolas");

		foreach (var node in nodes) {
			if (!_nodeLayouts.TryGetValue(node.Id, out var layout)) continue;

			var rect = new Rect(layout.X, layout.Y, layout.Width, layout.Height);

			// Determine fill color
			var fillColor = GetNodeColor(node.NodeType);
			var fillBrush = new SolidColorBrush(fillColor);

			// Determine border
			Pen borderPen;
			if (_selectedNodeId == node.Id) {
				borderPen = new Pen(new SolidColorBrush(SelectedNodeBorderColor), 3);
			} else {
				borderPen = _hoveredNodeId == node.Id
					? new Pen(new SolidColorBrush(HoveredNodeBorderColor), 2)
					: new Pen(new SolidColorBrush(Color.FromRgb(0x40, 0x40, 0x40)), 1);
			}

			// Draw node rectangle with rounded corners
			var roundedRect = new RoundedRect(rect, 6);
			context.DrawRectangle(fillBrush, borderPen, roundedRect);

			// Draw label text
			var labelText = new FormattedText(
				node.Label,
				System.Globalization.CultureInfo.CurrentCulture,
				FlowDirection.LeftToRight,
				typeface,
				11,
				new SolidColorBrush(TextColor));
			labelText.MaxTextWidth = layout.Width - 10;
			labelText.MaxTextHeight = 16;

			var labelPos = new Point(layout.X + 5, layout.Y + 5);
			context.DrawText(labelText, labelPos);

			// Draw address range
			var addressText = new FormattedText(
				$"${node.StartAddress:X4}-${node.EndAddress:X4}",
				System.Globalization.CultureInfo.CurrentCulture,
				FlowDirection.LeftToRight,
				typeface,
				9,
				new SolidColorBrush(Color.FromArgb(0xA0, 0xE0, 0xE0, 0xE0)));
			addressText.MaxTextWidth = layout.Width - 10;

			var addressPos = new Point(layout.X + 5, layout.Y + 22);
			context.DrawText(addressText, addressPos);

			// Draw preview (first instruction)
			if (!string.IsNullOrEmpty(node.Preview)) {
				var previewText = new FormattedText(
					node.Preview.Length > 20 ? node.Preview[..20] + "..." : node.Preview,
					System.Globalization.CultureInfo.CurrentCulture,
					FlowDirection.LeftToRight,
					typeface,
					9,
					new SolidColorBrush(Color.FromArgb(0x80, 0xE0, 0xE0, 0xE0)));
				previewText.MaxTextWidth = layout.Width - 10;

				var previewPos = new Point(layout.X + 5, layout.Y + 35);
				context.DrawText(previewText, previewPos);
			}
		}
	}

	private static Color GetNodeColor(CfgNodeType nodeType) => nodeType switch {
		CfgNodeType.Entry => EntryNodeColor,
		CfgNodeType.Exit => ExitNodeColor,
		CfgNodeType.LoopHeader => LoopHeaderColor,
		CfgNodeType.Conditional => ConditionalColor,
		_ => NormalNodeColor
	};

	private static Color GetEdgeColor(CfgEdgeType edgeType) => edgeType switch {
		CfgEdgeType.Unconditional => EdgeUnconditionalColor,
		CfgEdgeType.ConditionalTrue => EdgeTrueColor,
		CfgEdgeType.ConditionalFalse => EdgeFalseColor,
		CfgEdgeType.BackEdge => EdgeBackColor,
		CfgEdgeType.Call => EdgeCallColor,
		_ => EdgeSequentialColor
	};

	#endregion

	#region Input Handling

	private void OnPointerPressed(object? sender, PointerPressedEventArgs e) {
		var point = e.GetPosition(this);
		var transformedPoint = TransformPoint(point);

		var hitNode = HitTestNode(transformedPoint);
		if (hitNode is not null) {
			_selectedNodeId = hitNode.Id;
			SelectedNodeId = hitNode.Id;
			NodeSelected?.Invoke(this, new CfgNodeSelectedEventArgs(hitNode.Id, hitNode.StartAddress));
			InvalidateVisual();
		}

		e.Handled = true;
	}

	private void OnDoubleTapped(object? sender, TappedEventArgs e) {
		if (e.Source != this) return;

		var point = e.GetPosition(this);
		var transformedPoint = TransformPoint(point);

		var hitNode = HitTestNode(transformedPoint);
		if (hitNode is not null) {
			NodeDoubleClicked?.Invoke(this, new CfgNodeSelectedEventArgs(hitNode.Id, hitNode.StartAddress));
		}
	}

	private void OnPointerMoved(object? sender, PointerEventArgs e) {
		var point = e.GetPosition(this);
		var transformedPoint = TransformPoint(point);

		var hitNode = HitTestNode(transformedPoint);
		var newHoveredId = hitNode?.Id;

		if (_hoveredNodeId != newHoveredId) {
			_hoveredNodeId = newHoveredId;
			InvalidateVisual();

			// Set tooltip
			if (hitNode is not null) {
				ToolTip.SetTip(this, $"{hitNode.Label}\n${hitNode.StartAddress:X4}-${hitNode.EndAddress:X4}\n{hitNode.Preview}");
			} else {
				ToolTip.SetTip(this, null);
			}
		}
	}

	private void OnPointerWheelChanged(object? sender, PointerWheelEventArgs e) {
		var delta = e.Delta.Y > 0 ? 1.1 : 0.9;
		_zoom = Math.Clamp(_zoom * delta, 0.25, 4.0);
		InvalidateVisual();
		e.Handled = true;
	}

	private Point TransformPoint(Point point) {
		// Reverse the pan and zoom transformation
		return new Point(
			(point.X - _panOffset.X) / _zoom,
			(point.Y - _panOffset.Y) / _zoom);
	}

	private CfgNode? HitTestNode(Point point) {
		var nodes = Nodes;
		if (nodes is null) return null;

		foreach (var node in nodes) {
			if (_nodeLayouts.TryGetValue(node.Id, out var layout)) {
				var rect = new Rect(layout.X, layout.Y, layout.Width, layout.Height);
				if (rect.Contains(point)) {
					return node;
				}
			}
		}

		return null;
	}

	#endregion

	#region Public Methods

	/// <summary>
	/// Resets the view to default zoom and pan.
	/// </summary>
	public void ResetView() {
		_zoom = 1.0;
		_panOffset = new Point(0, 0);
		InvalidateVisual();
	}

	/// <summary>
	/// Zooms in on the graph.
	/// </summary>
	public void ZoomIn() {
		_zoom = Math.Min(4.0, _zoom * 1.2);
		InvalidateVisual();
	}

	/// <summary>
	/// Zooms out of the graph.
	/// </summary>
	public void ZoomOut() {
		_zoom = Math.Max(0.25, _zoom / 1.2);
		InvalidateVisual();
	}

	/// <summary>
	/// Fits all nodes in the view.
	/// </summary>
	public void FitToView() {
		if (_nodeLayouts.Count == 0) return;

		var minX = _nodeLayouts.Values.Min(l => l.X);
		var minY = _nodeLayouts.Values.Min(l => l.Y);
		var maxX = _nodeLayouts.Values.Max(l => l.X + l.Width);
		var maxY = _nodeLayouts.Values.Max(l => l.Y + l.Height);

		var graphWidth = maxX - minX + (NodePaddingX * 2);
		var graphHeight = maxY - minY + (NodePaddingY * 2);

		var scaleX = Bounds.Width / graphWidth;
		var scaleY = Bounds.Height / graphHeight;
		_zoom = Math.Min(Math.Min(scaleX, scaleY), 1.0);

		_panOffset = new Point((-minX * _zoom) + NodePaddingX, (-minY * _zoom) + NodePaddingY);
		InvalidateVisual();
	}

	/// <summary>
	/// Focuses on a specific node.
	/// </summary>
	public void FocusNode(string nodeId) {
		if (!_nodeLayouts.TryGetValue(nodeId, out var layout)) return;

		_panOffset = new Point(
			(Bounds.Width / 2) - ((layout.X + (layout.Width / 2)) * _zoom),
			(Bounds.Height / 2) - ((layout.Y + (layout.Height / 2)) * _zoom));

		_selectedNodeId = nodeId;
		SelectedNodeId = nodeId;
		InvalidateVisual();
	}

	/// <summary>
	/// Exports the control flow graph to DOT (Graphviz) format.
	/// </summary>
	/// <param name="graphName">Name for the graph.</param>
	/// <returns>DOT format string.</returns>
	public string ExportToDot(string graphName = "CFG") {
		var sb = new System.Text.StringBuilder();
		sb.AppendLine($"digraph {graphName} {{");
		sb.AppendLine("    // Graph attributes");
		sb.AppendLine("    rankdir=TB;");
		sb.AppendLine("    node [shape=box, style=filled, fontname=\"Consolas\"];");
		sb.AppendLine("    edge [fontname=\"Consolas\", fontsize=10];");
		sb.AppendLine();

		// Export nodes
		if (Nodes is not null) {
			sb.AppendLine("    // Nodes");
			foreach (var node in Nodes) {
				var color = GetDotNodeColor(node.NodeType);
				var fontColor = GetDotFontColor(node.NodeType);
				var label = $"{node.Label}\\n${node.StartAddress:X4}-${node.EndAddress:X4}";
				if (!string.IsNullOrEmpty(node.Preview)) {
					label += $"\\n{EscapeDotString(node.Preview)}";
				}

				sb.AppendLine($"    \"{node.Id}\" [label=\"{label}\", fillcolor=\"{color}\", fontcolor=\"{fontColor}\"];");
			}

			sb.AppendLine();
		}

		// Export edges
		if (Edges is not null) {
			sb.AppendLine("    // Edges");
			foreach (var edge in Edges) {
				var color = GetDotEdgeColor(edge.EdgeType);
				var style = GetDotEdgeStyle(edge.EdgeType);
				var label = GetDotEdgeLabel(edge.EdgeType);
				var labelAttr = string.IsNullOrEmpty(label) ? "" : $", label=\"{label}\"";
				sb.AppendLine($"    \"{edge.FromId}\" -> \"{edge.ToId}\" [color=\"{color}\", style={style}{labelAttr}];");
			}
		}

		sb.AppendLine("}");
		return sb.ToString();
	}

	/// <summary>
	/// Exports the control flow graph to SVG format.
	/// </summary>
	/// <param name="width">SVG width.</param>
	/// <param name="height">SVG height.</param>
	/// <returns>SVG format string.</returns>
	public string ExportToSvg(int width = 800, int height = 600) {
		// Calculate layout if not already done
		CalculateLayout();

		var sb = new System.Text.StringBuilder();
		sb.AppendLine($"<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
		sb.AppendLine($"<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"{width}\" height=\"{height}\" viewBox=\"0 0 {width} {height}\">");
		sb.AppendLine("  <style>");
		sb.AppendLine("    .node { stroke: #333; stroke-width: 2; }");
		sb.AppendLine("    .entry { fill: #4CAF50; }");
		sb.AppendLine("    .exit { fill: #F44336; }");
		sb.AppendLine("    .normal { fill: #2196F3; }");
		sb.AppendLine("    .loop { fill: #9C27B0; }");
		sb.AppendLine("    .conditional { fill: #FFC107; }");
		sb.AppendLine("    .edge { fill: none; stroke-width: 2; }");
		sb.AppendLine("    .label { font-family: Consolas, monospace; font-size: 10px; fill: white; }");
		sb.AppendLine("    .addr { font-family: Consolas, monospace; font-size: 8px; fill: #AAA; }");
		sb.AppendLine("  </style>");
		sb.AppendLine($"  <rect width=\"{width}\" height=\"{height}\" fill=\"#1E1E1E\"/>");

		// Draw edges first (underneath nodes)
		if (Edges is not null && _nodeLayouts.Count > 0) {
			sb.AppendLine("  <!-- Edges -->");
			foreach (var edge in Edges) {
				if (!_nodeLayouts.TryGetValue(edge.FromId, out var fromLayout) ||
					!_nodeLayouts.TryGetValue(edge.ToId, out var toLayout)) continue;

				var color = GetSvgEdgeColor(edge.EdgeType);
				var fromX = fromLayout.X + (fromLayout.Width / 2);
				var fromY = fromLayout.Y + fromLayout.Height;
				var toX = toLayout.X + (toLayout.Width / 2);
				var toY = toLayout.Y;

				// Draw path with arrow marker
				sb.AppendLine($"  <line x1=\"{fromX}\" y1=\"{fromY}\" x2=\"{toX}\" y2=\"{toY}\" class=\"edge\" stroke=\"{color}\" marker-end=\"url(#arrow-{edge.EdgeType})\"/>");
			}
		}

		// Draw nodes
		if (Nodes is not null) {
			sb.AppendLine("  <!-- Nodes -->");
			foreach (var node in Nodes) {
				if (!_nodeLayouts.TryGetValue(node.Id, out var layout)) continue;

				var nodeClass = node.NodeType switch {
					CfgNodeType.Entry => "entry",
					CfgNodeType.Exit => "exit",
					CfgNodeType.LoopHeader => "loop",
					CfgNodeType.Conditional => "conditional",
					_ => "normal"
				};

				sb.AppendLine($"  <rect x=\"{layout.X}\" y=\"{layout.Y}\" width=\"{layout.Width}\" height=\"{layout.Height}\" rx=\"4\" class=\"node {nodeClass}\"/>");
				sb.AppendLine($"  <text x=\"{layout.X + (layout.Width / 2)}\" y=\"{layout.Y + 15}\" text-anchor=\"middle\" class=\"label\">{EscapeXml(node.Label)}</text>");
				sb.AppendLine($"  <text x=\"{layout.X + (layout.Width / 2)}\" y=\"{layout.Y + 28}\" text-anchor=\"middle\" class=\"addr\">${node.StartAddress:X4}-${node.EndAddress:X4}</text>");
			}
		}

		// Arrow markers
		sb.AppendLine("  <defs>");
		foreach (var edgeType in Enum.GetValues<CfgEdgeType>()) {
			var color = GetSvgEdgeColor(edgeType);
			sb.AppendLine($"    <marker id=\"arrow-{edgeType}\" markerWidth=\"10\" markerHeight=\"10\" refX=\"9\" refY=\"3\" orient=\"auto\">");
			sb.AppendLine($"      <path d=\"M0,0 L0,6 L9,3 z\" fill=\"{color}\"/>");
			sb.AppendLine("    </marker>");
		}

		sb.AppendLine("  </defs>");

		sb.AppendLine("</svg>");
		return sb.ToString();
	}

	/// <summary>
	/// Gets summary statistics about the graph.
	/// </summary>
	public CfgStatistics GetStatistics() {
		int nodeCount = Nodes?.Count ?? 0;
		int edgeCount = Edges?.Count ?? 0;
		int entryCount = Nodes?.Count(n => n.NodeType == CfgNodeType.Entry) ?? 0;
		int exitCount = Nodes?.Count(n => n.NodeType == CfgNodeType.Exit) ?? 0;
		int loopCount = Edges?.Count(e => e.EdgeType == CfgEdgeType.BackEdge) ?? 0;
		int conditionalCount = Nodes?.Count(n => n.NodeType == CfgNodeType.Conditional) ?? 0;

		return new CfgStatistics(nodeCount, edgeCount, entryCount, exitCount, loopCount, conditionalCount);
	}

	#region DOT/SVG Helper Methods

	private static string GetDotNodeColor(CfgNodeType nodeType) => nodeType switch {
		CfgNodeType.Entry => "#4CAF50",
		CfgNodeType.Exit => "#F44336",
		CfgNodeType.LoopHeader => "#9C27B0",
		CfgNodeType.Conditional => "#FFC107",
		_ => "#2196F3"
	};

	private static string GetDotFontColor(CfgNodeType nodeType) => nodeType switch {
		CfgNodeType.Conditional => "black",
		_ => "white"
	};

	private static string GetDotEdgeColor(CfgEdgeType edgeType) => edgeType switch {
		CfgEdgeType.Sequential => "#909090",
		CfgEdgeType.Unconditional => "#42A5F5",
		CfgEdgeType.ConditionalTrue => "#4CAF50",
		CfgEdgeType.ConditionalFalse => "#F44336",
		CfgEdgeType.BackEdge => "#9C27B0",
		CfgEdgeType.Call => "#FF9800",
		_ => "#909090"
	};

	private static string GetSvgEdgeColor(CfgEdgeType edgeType) => GetDotEdgeColor(edgeType);

	private static string GetDotEdgeStyle(CfgEdgeType edgeType) => edgeType switch {
		CfgEdgeType.BackEdge => "dashed",
		CfgEdgeType.Call => "dotted",
		_ => "solid"
	};

	private static string GetDotEdgeLabel(CfgEdgeType edgeType) => edgeType switch {
		CfgEdgeType.ConditionalTrue => "T",
		CfgEdgeType.ConditionalFalse => "F",
		CfgEdgeType.Call => "call",
		_ => ""
	};

	private static string EscapeDotString(string s) =>
		s.Replace("\\", "\\\\").Replace("\"", "\\\"").Replace("\n", "\\n");

	private static string EscapeXml(string s) =>
		s.Replace("&", "&amp;").Replace("<", "&lt;").Replace(">", "&gt;").Replace("\"", "&quot;");

	#endregion

	#endregion
}

/// <summary>
/// Statistics about a control flow graph.
/// </summary>
public record CfgStatistics(
	int NodeCount,
	int EdgeCount,
	int EntryCount,
	int ExitCount,
	int LoopCount,
	int ConditionalCount
);

