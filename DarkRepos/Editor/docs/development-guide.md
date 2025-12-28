# Dark Repos Editor - Development Guide

## Getting Started

### Prerequisites

- .NET 10 SDK
- Node.js 20+ (for JavaScript tooling)
- Visual Studio 2025, VS Code, or Rider
- Git

### Clone and Build

```bash
git clone https://github.com/TheAnsarya/GameInfo.git
cd GameInfo/DarkRepos Editor

# Restore dependencies
dotnet restore

# Build the solution
dotnet build

# Run the application
dotnet run --project src/DarkRepos.Editor.Web
```

### Development Server

```bash
# Run with hot reload
dotnet watch --project src/DarkRepos.Editor.Web
```

The application will be available at `https://localhost:5281` (HTTPS) and `http://localhost:5280` (HTTP).

---

## Project Structure

```
DarkRepos Editor/
├── src/
│   ├── DarkRepos.Editor.Core/         # Core libraries (editors, analysis)
│   ├── DarkRepos.Editor.Data/         # EF Core, database models
│   ├── DarkRepos.Editor.Web/          # Blazor web application
│   │   ├── Components/               # Blazor components
│   │   │   ├── Editors/              # Editor components
│   │   │   ├── Layout/               # Layout components
│   │   │   ├── Pages/                # Page components
│   │   │   └── Shared/               # Shared/reusable components
│   │   ├── Services/                 # Application services
│   │   ├── wwwroot/                  # Static assets
│   │   └── Program.cs                # Entry point
│   ├── DarkRepos.Editor.Desktop/      # Desktop host (MAUI Blazor Hybrid)
│   └── DarkRepos.Editor.Tests/        # Unit and integration tests
├── docs/                             # Documentation
└── README.md
```

---

## Architecture Patterns

### Component Architecture

Components follow a consistent pattern:

```csharp
// MyComponent.razor
@namespace DarkRepos.Editor.Web.Components.Shared
@inherits MyComponentBase

<div class="my-component @CssClass" @attributes="AdditionalAttributes">
	<!-- Component markup -->
</div>

// MyComponent.razor.cs (code-behind)
public class MyComponentBase : ComponentBase
{
	[Parameter]
	public string? CssClass { get; set; }
	
	[Parameter(CaptureUnmatchedValues = true)]
	public Dictionary<string, object>? AdditionalAttributes { get; set; }
}

// MyComponent.razor.css (scoped styles)
.my-component {
	/* Component styles */
}
```

### Service Pattern

Services follow dependency injection patterns:

```csharp
// Interface
public interface IRomService
{
	Task<Rom> GetByIdAsync(Guid id, CancellationToken ct = default);
	Task<IReadOnlyList<Rom>> ListAsync(CancellationToken ct = default);
	Task<Rom> UploadAsync(Stream stream, string fileName, CancellationToken ct = default);
}

// Implementation
public class RomService : IRomService
{
	private readonly IDbContextFactory<EditorDbContext> _contextFactory;
	private readonly ILogger<RomService> _logger;
	
	public RomService(
		IDbContextFactory<EditorDbContext> contextFactory,
		ILogger<RomService> logger)
	{
		_contextFactory = contextFactory;
		_logger = logger;
	}
	
	public async Task<Rom> GetByIdAsync(Guid id, CancellationToken ct = default)
	{
		await using var context = await _contextFactory.CreateDbContextAsync(ct);
		return await context.Roms.FindAsync([id], ct) 
			?? throw new NotFoundException($"ROM {id} not found");
	}
}

// Registration
services.AddScoped<IRomService, RomService>();
```

---

## Editor Implementation Guide

### Creating a New Editor

1. **Create the Editor Component**

```csharp
// Components/Editors/MyEditor.razor
@namespace DarkRepos.Editor.Web.Components.Editors
@inherits MyEditorBase

<div class="editor my-editor" role="application" aria-label="My Editor">
	<EditorToolbar>
		<ToolbarButton Icon="💾" OnClick="SaveAsync" Tooltip="Save" />
		<ToolbarButton Icon="↩️" OnClick="Undo" Tooltip="Undo" Disabled="@(!CanUndo)" />
		<ToolbarButton Icon="↪️" OnClick="Redo" Tooltip="Redo" Disabled="@(!CanRedo)" />
	</EditorToolbar>
	
	<div class="editor-content">
		<!-- Editor content -->
	</div>
	
	<EditorStatusBar>
		<StatusItem>@StatusText</StatusItem>
	</EditorStatusBar>
</div>
```

2. **Create the Code-Behind**

```csharp
// Components/Editors/MyEditor.razor.cs
public class MyEditorBase : EditorComponentBase
{
	[Inject]
	protected IMyEditorService EditorService { get; set; } = default!;
	
	[Parameter]
	public Guid RomId { get; set; }
	
	protected string StatusText { get; set; } = "Ready";
	protected bool CanUndo => UndoManager.CanUndo;
	protected bool CanRedo => UndoManager.CanRedo;
	
	protected override async Task OnInitializedAsync()
	{
		await LoadDataAsync();
	}
	
	protected async Task SaveAsync()
	{
		await EditorService.SaveAsync(RomId);
		StatusText = "Saved";
	}
	
	protected void Undo() => UndoManager.Undo();
	protected void Redo() => UndoManager.Redo();
}
```

3. **Create the Service**

```csharp
// Services/IMyEditorService.cs
public interface IMyEditorService
{
	Task<MyEditorData> LoadAsync(Guid romId, CancellationToken ct = default);
	Task SaveAsync(Guid romId, CancellationToken ct = default);
}

// Services/MyEditorService.cs
public class MyEditorService : IMyEditorService
{
	// Implementation
}
```

4. **Add Tests**

```csharp
// Tests/Components/MyEditorTests.cs
public class MyEditorTests : EditorTestContext
{
	[Fact]
	public void MyEditor_Renders_Correctly()
	{
		var cut = RenderComponent<MyEditor>(parameters => parameters
			.Add(p => p.RomId, TestRomId));
		
		cut.Find(".my-editor").Should().NotBeNull();
	}
}
```

---

## Keyboard Shortcuts

All editors support keyboard shortcuts:

```csharp
// Register shortcuts in component
protected override void OnInitialized()
{
	KeyboardShortcuts.Register("Ctrl+S", SaveAsync);
	KeyboardShortcuts.Register("Ctrl+Z", Undo);
	KeyboardShortcuts.Register("Ctrl+Y", Redo);
	KeyboardShortcuts.Register("Ctrl+Shift+Z", Redo);
}

protected override void Dispose(bool disposing)
{
	KeyboardShortcuts.Unregister("Ctrl+S");
	// ... unregister all
	base.Dispose(disposing);
}
```

---

## Accessibility Guidelines

### ARIA Compliance

```razor
<!-- Good: Proper ARIA attributes -->
<button 
	type="button"
	class="toolbar-button"
	@onclick="SaveAsync"
	aria-label="Save document"
	aria-keyshortcuts="Ctrl+S"
	title="Save (Ctrl+S)">
	<span aria-hidden="true">💾</span>
</button>

<!-- Good: Role for custom controls -->
<div 
	role="grid"
	aria-label="Hex data grid"
	aria-rowcount="@RowCount"
	aria-colcount="16"
	tabindex="0"
	@onkeydown="HandleKeyDown">
	<!-- Grid content -->
</div>
```

### Focus Management

```csharp
// Track and manage focus
private ElementReference _focusTarget;

private async Task HandleNavigation()
{
	await _focusTarget.FocusAsync();
}
```

### Screen Reader Announcements

```razor
<!-- Live region for announcements -->
<div aria-live="polite" aria-atomic="true" class="sr-only">
	@LiveAnnouncement
</div>

@code {
	private string LiveAnnouncement { get; set; } = "";
	
	private void Announce(string message)
	{
		LiveAnnouncement = message;
		StateHasChanged();
	}
}
```

---

## Testing

### Unit Tests

```csharp
[Fact]
public void AddressConverter_Converts_Correctly()
{
	var converter = new AddressConverter(MapperType.MMC3);
	
	var result = converter.CpuToFile(0x8000);
	
	result.Should().Be(0x10);
}
```

### Component Tests (bUnit)

```csharp
[Fact]
public void HexEditor_Displays_Data()
{
	// Arrange
	var hexData = new byte[] { 0x4E, 0x45, 0x53, 0x1A };
	Services.AddSingleton<IHexEditorService>(new MockHexEditorService(hexData));
	
	// Act
	var cut = RenderComponent<HexEditor>(parameters => parameters
		.Add(p => p.RomId, Guid.NewGuid()));
	
	// Assert
	cut.Find(".hex-cell").TextContent.Should().Contain("4E");
}
```

### Integration Tests

```csharp
[Fact]
public async Task RomApi_Upload_Returns_RomInfo()
{
	// Arrange
	await using var app = new WebApplicationFactory<Program>();
	var client = app.CreateClient();
	
	var content = new MultipartFormDataContent();
	content.Add(new ByteArrayContent(TestRomData), "file", "test.nes");
	
	// Act
	var response = await client.PostAsync("/api/roms", content);
	
	// Assert
	response.StatusCode.Should().Be(HttpStatusCode.OK);
	var rom = await response.Content.ReadFromJsonAsync<RomDto>();
	rom!.Platform.Should().Be("NES");
}
```

### Running Tests

```bash
# Run all tests
dotnet test

# Run with coverage
dotnet test --collect:"XPlat Code Coverage"

# Run specific test class
dotnet test --filter "FullyQualifiedName~HexEditorTests"
```

---

## Database Migrations

### Creating Migrations

```bash
# Add a new migration
dotnet ef migrations add AddProjectsTable \
	--project src/DarkRepos.Editor.Data \
	--startup-project src/DarkRepos.Editor.Web

# Apply migrations
dotnet ef database update \
	--project src/DarkRepos.Editor.Data \
	--startup-project src/DarkRepos.Editor.Web
```

### Migration Best Practices

```csharp
// Good: Idempotent migrations
public partial class AddProjectsTable : Migration
{
	protected override void Up(MigrationBuilder migrationBuilder)
	{
		migrationBuilder.CreateTable(
			name: "Projects",
			columns: table => new
			{
				Id = table.Column<Guid>(nullable: false),
				Name = table.Column<string>(maxLength: 200, nullable: false),
				CreatedAt = table.Column<DateTime>(nullable: false),
				ModifiedAt = table.Column<DateTime>(nullable: false)
			},
			constraints: table =>
			{
				table.PrimaryKey("PK_Projects", x => x.Id);
			});
		
		migrationBuilder.CreateIndex(
			name: "IX_Projects_Name",
			table: "Projects",
			column: "Name");
	}
	
	protected override void Down(MigrationBuilder migrationBuilder)
	{
		migrationBuilder.DropTable(name: "Projects");
	}
}
```

---

## Performance Optimization

### Virtualization for Large Data

```razor
<!-- Use Virtualize for large lists -->
<Virtualize Items="@HexRows" Context="row" ItemSize="24">
	<HexRow Data="@row" />
</Virtualize>
```

### Memory Management

```csharp
// Use Span<T> for binary operations
public void ProcessBytes(ReadOnlySpan<byte> data)
{
	for (int i = 0; i < data.Length; i++)
	{
		// Process without allocations
	}
}

// Pool large arrays
private static readonly ArrayPool<byte> BytePool = ArrayPool<byte>.Shared;

public async Task ProcessLargeDataAsync(Stream stream)
{
	var buffer = BytePool.Rent(65536);
	try
	{
		// Use buffer
	}
	finally
	{
		BytePool.Return(buffer);
	}
}
```

### Caching

```csharp
// Use memory cache for expensive operations
public class DisassemblyCache
{
	private readonly IMemoryCache _cache;
	
	public async Task<DisassemblyResult> GetOrCreateAsync(
		Guid romId, 
		int bankNumber,
		Func<Task<DisassemblyResult>> factory)
	{
		var key = $"disasm:{romId}:{bankNumber}";
		return await _cache.GetOrCreateAsync(key, async entry =>
		{
			entry.SlidingExpiration = TimeSpan.FromMinutes(30);
			return await factory();
		});
	}
}
```

---

## Deployment

### Docker

```dockerfile
FROM mcr.microsoft.com/dotnet/aspnet:10.0 AS base
WORKDIR /app
EXPOSE 5280

FROM mcr.microsoft.com/dotnet/sdk:10.0 AS build
WORKDIR /src
COPY . .
RUN dotnet publish "src/DarkRepos.Editor.Web/DarkRepos.Editor.Web.csproj" \
	-c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=build /app/publish .
ENTRYPOINT ["dotnet", "DarkRepos.Editor.Web.dll"]
```

### Desktop Installer

```bash
# Build Windows installer
dotnet publish src/DarkRepos.Editor.Desktop \
	-c Release \
	-r win-x64 \
	--self-contained \
	-o publish/win-x64

# Build macOS app
dotnet publish src/DarkRepos.Editor.Desktop \
	-c Release \
	-r osx-x64 \
	--self-contained \
	-o publish/osx-x64

# Build Linux AppImage
dotnet publish src/DarkRepos.Editor.Desktop \
	-c Release \
	-r linux-x64 \
	--self-contained \
	-o publish/linux-x64
```

---

## Contributing

### Code Style

- Use tabs for indentation (enforced by `.editorconfig`)
- Use lowercase hex values (`0xff` not `0xFF`)
- Follow C# naming conventions
- Add XML documentation to public APIs

### Pull Request Process

1. Create a feature branch from `main`
2. Write tests for new functionality
3. Ensure all tests pass
4. Update documentation
5. Submit PR with clear description

### Commit Messages

Follow conventional commits:
```
feat: Add sprite animation preview
fix: Correct hex editor scroll position
docs: Update API reference
test: Add CHR editor tests
refactor: Extract common editor logic
```
