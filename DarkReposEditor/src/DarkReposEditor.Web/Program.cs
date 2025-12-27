using DarkReposEditor.Core.Interfaces;
using DarkReposEditor.Core.Services;
using DarkReposEditor.Data;
using DarkReposEditor.Web.Components;
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

// Add controllers for API
builder.Services.AddControllers();

// Add SignalR for real-time updates
builder.Services.AddSignalR();

// Add CORS
builder.Services.AddCors(options =>
{
	options.AddDefaultPolicy(policy =>
	{
		policy.AllowAnyOrigin()
			.AllowAnyMethod()
			.AllowAnyHeader();
	});
});

var app = builder.Build();

// Configure the HTTP request pipeline
if (app.Environment.IsDevelopment())
{
	app.UseWebAssemblyDebugging();
}
else
{
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
	.AddAdditionalAssemblies(typeof(DarkReposEditor.Shared._Imports).Assembly);

// Initialize database
using (var scope = app.Services.CreateScope())
{
	var db = scope.ServiceProvider.GetRequiredService<EditorDbContext>();
	db.Database.EnsureCreated();
}

app.Run();
