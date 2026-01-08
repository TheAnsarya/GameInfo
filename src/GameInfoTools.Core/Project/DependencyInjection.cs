using GameInfoTools.Core.Project.Assemblers;
using GameInfoTools.Core.Project.Extractors;
using Microsoft.Extensions.DependencyInjection;

namespace GameInfoTools.Core.Project;

/// <summary>
/// Extension methods for registering project services in DI containers.
/// </summary>
public static class ProjectServiceCollectionExtensions {
	/// <summary>
	/// Adds project services to the service collection.
	/// </summary>
	public static IServiceCollection AddProjectServices(this IServiceCollection services) {
		// Register registries as singletons
		services.AddSingleton<IAssetExtractorRegistry, AssetExtractorRegistry>();
		services.AddSingleton<IAssemblerRegistry, AssemblerRegistry>();
		services.AddSingleton<IBuildVerifier, BuildVerifier>();

		// Register main project service
		services.AddSingleton<IProjectService, ProjectService>();

		// Register asset extractors
		services.AddSingleton<IAssetExtractor, DragonWarrior4Extractor>();
		services.AddSingleton<IAssetExtractor, FfmqExtractor>();

		// Register assemblers
		services.AddSingleton<IAssembler, Ca65Assembler>();
		services.AddSingleton<IAssembler, OphisAssembler>();

		return services;
	}

	/// <summary>
	/// Configures the project services after registration.
	/// Call this after building the service provider.
	/// </summary>
	public static IServiceProvider ConfigureProjectServices(this IServiceProvider serviceProvider) {
		// Register all extractors with the registry
		var extractorRegistry = serviceProvider.GetRequiredService<IAssetExtractorRegistry>();
		foreach (var extractor in serviceProvider.GetServices<IAssetExtractor>()) {
			extractorRegistry.Register(extractor);
		}

		// Register all assemblers with the registry
		var assemblerRegistry = serviceProvider.GetRequiredService<IAssemblerRegistry>();
		foreach (var assembler in serviceProvider.GetServices<IAssembler>()) {
			assemblerRegistry.Register(assembler);
		}

		return serviceProvider;
	}

	/// <summary>
	/// Adds project services with a custom configuration action.
	/// </summary>
	public static IServiceCollection AddProjectServices(
		this IServiceCollection services,
		Action<ProjectServiceOptions> configure
	) {
		var options = new ProjectServiceOptions();
		configure(options);

		services.AddProjectServices();

		// Apply options
		if (options.AdditionalExtractors.Count > 0) {
			foreach (var extractorType in options.AdditionalExtractors) {
				services.AddSingleton(typeof(IAssetExtractor), extractorType);
			}
		}

		if (options.AdditionalAssemblers.Count > 0) {
			foreach (var assemblerType in options.AdditionalAssemblers) {
				services.AddSingleton(typeof(IAssembler), assemblerType);
			}
		}

		return services;
	}
}

/// <summary>
/// Options for configuring project services.
/// </summary>
public class ProjectServiceOptions {
	/// <summary>
	/// Additional asset extractor types to register.
	/// </summary>
	public List<Type> AdditionalExtractors { get; } = [];

	/// <summary>
	/// Additional assembler types to register.
	/// </summary>
	public List<Type> AdditionalAssemblers { get; } = [];

	/// <summary>
	/// Default assembler to use when not specified.
	/// </summary>
	public string DefaultAssembler { get; set; } = "ca65";

	/// <summary>
	/// Directory for temporary project files.
	/// </summary>
	public string? TempDirectory { get; set; }

	/// <summary>
	/// Adds an extractor type.
	/// </summary>
	public ProjectServiceOptions AddExtractor<T>() where T : class, IAssetExtractor {
		AdditionalExtractors.Add(typeof(T));
		return this;
	}

	/// <summary>
	/// Adds an assembler type.
	/// </summary>
	public ProjectServiceOptions AddAssembler<T>() where T : class, IAssembler {
		AdditionalAssemblers.Add(typeof(T));
		return this;
	}
}
