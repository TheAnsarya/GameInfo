using DarkRepos.Core.Data;
using DarkRepos.Core.Services;
using DarkRepos.Web.Client.Pages;
using DarkRepos.Web.Components;
using Microsoft.EntityFrameworkCore;
using Serilog;
using Serilog.Events;

// Configure Serilog
Log.Logger = new LoggerConfiguration()
	.MinimumLevel.Information()
	.MinimumLevel.Override("Microsoft", LogEventLevel.Warning)
	.MinimumLevel.Override("Microsoft.AspNetCore", LogEventLevel.Warning)
	.MinimumLevel.Override("Microsoft.EntityFrameworkCore", LogEventLevel.Warning)
	.Enrich.FromLogContext()
	.WriteTo.Console(outputTemplate: "[{Timestamp:HH:mm:ss} {Level:u3}] {Message:lj}{NewLine}{Exception}")
	.WriteTo.File(
		path: "logs/darkrepos-.log",
		rollingInterval: RollingInterval.Day,
		retainedFileCountLimit: 7,
		outputTemplate: "{Timestamp:yyyy-MM-dd HH:mm:ss.fff zzz} [{Level:u3}] {Message:lj}{NewLine}{Exception}")
	.CreateLogger();

try
{
	Log.Information("Starting Dark Repos web application");

	var builder = WebApplication.CreateBuilder(args);

	// Use Serilog for logging
	builder.Host.UseSerilog();

	// Add services to the container.
	builder.Services.AddRazorComponents()
		.AddInteractiveServerComponents()
		.AddInteractiveWebAssemblyComponents();

	// Configure SQLite database
	var connectionString = builder.Configuration.GetConnectionString("DefaultConnection")
		?? "Data Source=darkrepos.db";

	builder.Services.AddDbContext<DarkReposDbContext>(options =>
		options.UseSqlite(connectionString));

	// Register application services (with caching decorator)
	builder.Services.AddScoped<ContentService>();
	builder.Services.AddScoped<IContentService>(sp => {
		var inner = sp.GetRequiredService<ContentService>();
		var cache = sp.GetRequiredService<IContentCacheService>();
		return new CachedContentService(inner, cache);
	});
	builder.Services.AddScoped<ISearchService, SearchService>();
	builder.Services.AddScoped<DatabaseSeeder>();

	// Register Phase 2 content pipeline services
	builder.Services.AddSingleton<IMarkdownService, MarkdownService>();
	builder.Services.AddSingleton<IGameMetadataService, GameMetadataService>();
	builder.Services.AddSingleton<IWikiLinkService, WikiLinkService>();
	builder.Services.AddSingleton<IContentCacheService, ContentCacheService>();
	builder.Services.AddSingleton<IGameInfoImportService, GameInfoImportService>();

	var app = builder.Build();

	// Ensure database is created, FTS5 index is set up, and seed data is loaded
	using (var scope = app.Services.CreateScope())
	{
		var context = scope.ServiceProvider.GetRequiredService<DarkReposDbContext>();
		await context.Database.EnsureCreatedAsync();
		await context.EnsureFts5IndexAsync();

		// Seed sample data in development
		if (app.Environment.IsDevelopment())
		{
			var seeder = scope.ServiceProvider.GetRequiredService<DatabaseSeeder>();
			await seeder.SeedAsync();
			Log.Information("Database seeded with sample data");
		}

		Log.Information("Database initialized successfully");
	}

	// Configure the HTTP request pipeline.
	if (app.Environment.IsDevelopment())
	{
		app.UseWebAssemblyDebugging();
	}
	else
	{
		app.UseExceptionHandler("/Error", createScopeForErrors: true);
		// The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
		app.UseHsts();
	}

	// Add Serilog request logging
	app.UseSerilogRequestLogging(options =>
	{
		options.MessageTemplate = "HTTP {RequestMethod} {RequestPath} responded {StatusCode} in {Elapsed:0.0000} ms";
	});

	app.UseStatusCodePagesWithReExecute("/not-found", createScopeForStatusCodePages: true);
	app.UseHttpsRedirection();

	app.UseAntiforgery();

	app.MapStaticAssets();
	app.MapRazorComponents<App>()
		.AddInteractiveServerRenderMode()
		.AddInteractiveWebAssemblyRenderMode()
		.AddAdditionalAssemblies(typeof(DarkRepos.Web.Client._Imports).Assembly);

	Log.Information("Dark Repos web application started");
	app.Run();
}
catch (Exception ex)
{
	Log.Fatal(ex, "Application terminated unexpectedly");
}
finally
{
	Log.CloseAndFlush();
}
