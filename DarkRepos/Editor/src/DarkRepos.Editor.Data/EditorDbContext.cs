using DarkRepos.Editor.Core.Models;
using Microsoft.EntityFrameworkCore;

namespace DarkRepos.Editor.Data;

/// <summary>
/// Entity Framework database context for the Dark Repos Editor.
/// </summary>
public class EditorDbContext : DbContext
{
	public EditorDbContext(DbContextOptions<EditorDbContext> options)
		: base(options)
	{
	}

	/// <summary>
	/// ROM files stored in the database.
	/// </summary>
	public DbSet<Rom> Roms => Set<Rom>();

	/// <summary>
	/// Editing projects.
	/// </summary>
	public DbSet<Project> Projects => Set<Project>();

	/// <summary>
	/// Labels/symbols for addresses.
	/// </summary>
	public DbSet<Label> Labels => Set<Label>();

	protected override void OnModelCreating(ModelBuilder modelBuilder)
	{
		base.OnModelCreating(modelBuilder);

		// ROM configuration
		modelBuilder.Entity<Rom>(entity =>
		{
			entity.HasKey(e => e.Id);
			entity.Property(e => e.Name).IsRequired().HasMaxLength(256);
			entity.Property(e => e.FileName).IsRequired().HasMaxLength(512);
			entity.Property(e => e.Sha256).IsRequired().HasMaxLength(64);
			entity.Property(e => e.Crc32).HasMaxLength(8);
			entity.Property(e => e.InternalTitle).HasMaxLength(64);
			entity.HasIndex(e => e.Sha256).IsUnique();
		});

		// Project configuration
		modelBuilder.Entity<Project>(entity =>
		{
			entity.HasKey(e => e.Id);
			entity.Property(e => e.Name).IsRequired().HasMaxLength(256);
			entity.Property(e => e.Description).HasMaxLength(2000);
			entity.Property(e => e.ProjectPath).HasMaxLength(1024);
			entity.HasOne(e => e.Rom)
				.WithMany()
				.HasForeignKey(e => e.RomId)
				.OnDelete(DeleteBehavior.Cascade);
		});

		// Label configuration
		modelBuilder.Entity<Label>(entity =>
		{
			entity.HasKey(e => e.Id);
			entity.Property(e => e.Name).IsRequired().HasMaxLength(128);
			entity.Property(e => e.Comment).HasMaxLength(1000);
			entity.HasIndex(e => new { e.ProjectId, e.Address, e.Bank });
		});
	}
}
