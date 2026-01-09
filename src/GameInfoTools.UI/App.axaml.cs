using System.Linq;
using Avalonia;
using Avalonia.Controls.ApplicationLifetimes;
using Avalonia.Data.Core;
using Avalonia.Data.Core.Plugins;
using Avalonia.Markup.Xaml;
using GameInfoTools.Core.Project;
using GameInfoTools.UI.ViewModels;
using GameInfoTools.UI.Views;
using Microsoft.Extensions.DependencyInjection;

namespace GameInfoTools.UI;

public partial class App : Application {
	/// <summary>
	/// Gets the service provider for dependency injection.
	/// </summary>
	public static IServiceProvider Services { get; private set; } = null!;

	public override void Initialize() {
		AvaloniaXamlLoader.Load(this);
	}

	public override void OnFrameworkInitializationCompleted() {
		// Configure dependency injection
		var serviceCollection = new ServiceCollection();
		ConfigureServices(serviceCollection);
		Services = serviceCollection.BuildServiceProvider();
		Services.ConfigureProjectServices();

		if (ApplicationLifetime is IClassicDesktopStyleApplicationLifetime desktop) {
			// Avoid duplicate validations from both Avalonia and the CommunityToolkit.
			// More info: https://docs.avaloniaui.net/docs/guides/development-guides/data-validation#manage-validationplugins
			DisableAvaloniaDataAnnotationValidation();

			var mainWindowVm = Services.GetRequiredService<MainWindowViewModel>();
			desktop.MainWindow = new MainWindow {
				DataContext = mainWindowVm,
			};
		}

		base.OnFrameworkInitializationCompleted();
	}

	private static void ConfigureServices(IServiceCollection services) {
		// Add project services (extractors, assemblers, etc.)
		services.AddProjectServices();

		// Register view models
		services.AddTransient<MainWindowViewModel>();
	}

	private void DisableAvaloniaDataAnnotationValidation() {
		// Get an array of plugins to remove
		var dataValidationPluginsToRemove =
			BindingPlugins.DataValidators.OfType<DataAnnotationsValidationPlugin>().ToArray();

		// remove each entry found
		foreach (var plugin in dataValidationPluginsToRemove) {
			BindingPlugins.DataValidators.Remove(plugin);
		}
	}
}
