using DarkRepos.Editor.Core.Interfaces;
using DarkRepos.Editor.Core.Services;
using DarkRepos.Editor.Core.Services.Games;
using DarkRepos.Editor.Data;
using DarkRepos.Editor.Web.Components;
using Microsoft.EntityFrameworkCore;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container
builder.Services.AddRazorComponents()
	.AddInteractiveServerComponents()
	.AddInteractiveWebAssemblyComponents();

// Add database context
builder.Services.AddDbContext<EditorDbContext>(options =>
	options.UseSqlite(builder.Configuration.GetConnectionString("Default") ?? "Data Source=editor.db"));

// Add core services
builder.Services.AddScoped<IRomService, RomService>();
builder.Services.AddScoped<IHexEditorService, HexEditorService>();
builder.Services.AddScoped<IChrEditorService, ChrEditorService>();
builder.Services.AddScoped<IDisassemblerService, DisassemblerService>();
builder.Services.AddScoped<ITextEditorService, TextEditorService>();
builder.Services.AddScoped<IMapEditorService, MapEditorService>();
builder.Services.AddScoped<IDataEditorService, DataEditorService>();
builder.Services.AddScoped<IScriptEditorService, ScriptEditorService>();

// Add game-specific editors
builder.Services.AddScoped<IDQ3rEditorService, DQ3rEditorService>();

// Add controllers for API
builder.Services.AddControllers();

// Add SignalR for real-time updates
builder.Services.AddSignalR();

// Add CORS
builder.Services.AddCors(options => options.AddDefaultPolicy(policy => policy.AllowAnyOrigin()
			.AllowAnyMethod()
			.AllowAnyHeader()));

var app = builder.Build();

// Configure the HTTP request pipeline
if (app.Environment.IsDevelopment()) {
	app.UseWebAssemblyDebugging();
} else {
	app.UseExceptionHandler("/Error", createScopeForErrors: true);
	app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();
app.UseAntiforgery();

app.UseCors();

app.MapControllers();

app.MapRazorComponents<App>()
	.AddInteractiveServerRenderMode()
	.AddInteractiveWebAssemblyRenderMode()
	.AddAdditionalAssemblies(typeof(DarkRepos.Editor.Shared._Imports).Assembly);

// Initialize database
using (var scope = app.Services.CreateScope()) {
	var db = scope.ServiceProvider.GetRequiredService<EditorDbContext>();
	db.Database.EnsureCreated();
}

app.Run();
