using DarkRepos.Core.Models;
using Microsoft.EntityFrameworkCore;

namespace DarkRepos.Core.Data;

/// <summary>
/// Entity Framework Core database context for Dark Repos.
/// Manages the SQLite database for content storage and FTS5 search index.
/// </summary>
public class DarkReposDbContext : DbContext {
	public DarkReposDbContext(DbContextOptions<DarkReposDbContext> options)
		: base(options) {
	}

	/// <summary>
	/// Game catalog entries stored in the database.
	/// </summary>
	public DbSet<GameEntity> Games { get; set; } = null!;

	/// <summary>
	/// Tool entries stored in the database.
	/// </summary>
	public DbSet<ToolEntity> Tools { get; set; } = null!;

	/// <summary>
	/// Search index entries for FTS5 full-text search.
	/// </summary>
	public DbSet<SearchIndexEntry> SearchIndex { get; set; } = null!;

	protected override void OnModelCreating(ModelBuilder modelBuilder) {
		base.OnModelCreating(modelBuilder);

		// Game entity configuration
		modelBuilder.Entity<GameEntity>(entity => {
			entity.ToTable("Games");
			entity.HasKey(e => e.Id);
			entity.Property(e => e.Slug).IsRequired().HasMaxLength(100);
			entity.Property(e => e.Title).IsRequired().HasMaxLength(200);
			entity.Property(e => e.Platform).IsRequired().HasMaxLength(20);
			entity.Property(e => e.JapaneseTitle).HasMaxLength(200);
			entity.Property(e => e.Developer).HasMaxLength(100);
			entity.Property(e => e.Publisher).HasMaxLength(100);
			entity.Property(e => e.Genre).HasMaxLength(50);
			entity.Property(e => e.Description).HasMaxLength(2000);
			entity.Property(e => e.CoverImage).HasMaxLength(500);
			entity.Property(e => e.Series).HasMaxLength(100);
			entity.Property(e => e.AlternateTitlesJson).HasColumnName("AlternateTitles");
			entity.Property(e => e.DocumentationPathsJson).HasColumnName("DocumentationPaths");
			entity.Property(e => e.RelatedToolsJson).HasColumnName("RelatedTools");
			entity.Property(e => e.TagsJson).HasColumnName("Tags");
			entity.HasIndex(e => e.Slug).IsUnique();
			entity.HasIndex(e => e.Platform);
			entity.HasIndex(e => e.Series);
		});

		// Tool entity configuration
		modelBuilder.Entity<ToolEntity>(entity => {
			entity.ToTable("Tools");
			entity.HasKey(e => e.Id);
			entity.Property(e => e.Slug).IsRequired().HasMaxLength(100);
			entity.Property(e => e.Name).IsRequired().HasMaxLength(200);
			entity.Property(e => e.Description).IsRequired().HasMaxLength(2000);
			entity.Property(e => e.Category).IsRequired().HasMaxLength(50);
			entity.Property(e => e.Version).HasMaxLength(50);
			entity.Property(e => e.Author).HasMaxLength(100);
			entity.Property(e => e.RepositoryUrl).HasMaxLength(500);
			entity.Property(e => e.DownloadUrl).HasMaxLength(500);
			entity.Property(e => e.DocumentationPath).HasMaxLength(500);
			entity.Property(e => e.SupportedPlatformsJson).HasColumnName("SupportedPlatforms");
			entity.Property(e => e.TagsJson).HasColumnName("Tags");
			entity.HasIndex(e => e.Slug).IsUnique();
			entity.HasIndex(e => e.Category);
		});

		// Search index configuration (FTS5 virtual table)
		modelBuilder.Entity<SearchIndexEntry>(entity => {
			entity.ToTable("SearchIndex");
			entity.HasKey(e => e.Id);
			entity.Property(e => e.DocumentId).IsRequired().HasMaxLength(100);
			entity.Property(e => e.DocumentType).IsRequired().HasMaxLength(20);
			entity.Property(e => e.Title).IsRequired().HasMaxLength(200);
			entity.Property(e => e.Description).HasMaxLength(2000);
			entity.Property(e => e.Content);
			entity.Property(e => e.Url).IsRequired().HasMaxLength(500);
			entity.Property(e => e.Platform).HasMaxLength(20);
			entity.Property(e => e.Category).HasMaxLength(50);
			entity.Property(e => e.Tags).HasMaxLength(500);
			entity.HasIndex(e => e.DocumentId).IsUnique();
			entity.HasIndex(e => e.DocumentType);
			entity.HasIndex(e => e.Platform);
			entity.HasIndex(e => e.Category);
		});
	}

	/// <summary>
	/// Creates the FTS5 virtual table for full-text search.
	/// This must be called after database migration.
	/// </summary>
	public async Task EnsureFts5IndexAsync() {
		// Create FTS5 virtual table for full-text search
		var sql = @"
			CREATE VIRTUAL TABLE IF NOT EXISTS SearchFts USING fts5(
				document_id,
				title,
				description,
				content,
				tags,
				content='SearchIndex',
				content_rowid='Id'
			);

			-- Triggers to keep FTS5 index synchronized with SearchIndex table
			CREATE TRIGGER IF NOT EXISTS SearchIndex_ai AFTER INSERT ON SearchIndex BEGIN
				INSERT INTO SearchFts(rowid, document_id, title, description, content, tags)
				VALUES (new.Id, new.DocumentId, new.Title, new.Description, new.Content, new.Tags);
			END;

			CREATE TRIGGER IF NOT EXISTS SearchIndex_ad AFTER DELETE ON SearchIndex BEGIN
				INSERT INTO SearchFts(SearchFts, rowid, document_id, title, description, content, tags)
				VALUES ('delete', old.Id, old.DocumentId, old.Title, old.Description, old.Content, old.Tags);
			END;

			CREATE TRIGGER IF NOT EXISTS SearchIndex_au AFTER UPDATE ON SearchIndex BEGIN
				INSERT INTO SearchFts(SearchFts, rowid, document_id, title, description, content, tags)
				VALUES ('delete', old.Id, old.DocumentId, old.Title, old.Description, old.Content, old.Tags);
				INSERT INTO SearchFts(rowid, document_id, title, description, content, tags)
				VALUES (new.Id, new.DocumentId, new.Title, new.Description, new.Content, new.Tags);
			END;
		";

		await Database.ExecuteSqlRawAsync(sql);
	}
}

/// <summary>
/// Database entity for Game storage.
/// </summary>
public class GameEntity {
	public int Id { get; set; }
	public required string Slug { get; set; }
	public required string Title { get; set; }
	public required string Platform { get; set; }
	public string? JapaneseTitle { get; set; }
	public string? AlternateTitlesJson { get; set; }
	public string? Developer { get; set; }
	public string? Publisher { get; set; }
	public int? ReleaseYear { get; set; }
	public string? Genre { get; set; }
	public string? Description { get; set; }
	public string? CoverImage { get; set; }
	public string? Series { get; set; }
	public int DocumentationLevel { get; set; }
	public string? TagsJson { get; set; }
	public string? DocumentationPathsJson { get; set; }
	public string? RelatedToolsJson { get; set; }

	// Wiki resources (stored as individual columns)
	public bool HasRomMap { get; set; }
	public bool HasRamMap { get; set; }
	public bool HasDataStructures { get; set; }
	public bool HasSystems { get; set; }
	public bool HasNotes { get; set; }
	public string? WikiBaseUrl { get; set; }

	public DateTimeOffset? LastUpdated { get; set; }
	public DateTimeOffset CreatedAt { get; set; } = DateTimeOffset.UtcNow;
}

/// <summary>
/// Database entity for Tool storage.
/// </summary>
public class ToolEntity {
	public int Id { get; set; }
	public required string Slug { get; set; }
	public required string Name { get; set; }
	public required string Description { get; set; }
	public required string Category { get; set; }
	public string? Version { get; set; }
	public string? Author { get; set; }
	public string? RepositoryUrl { get; set; }
	public string? DownloadUrl { get; set; }
	public string? DocumentationPath { get; set; }
	public string? SupportedPlatformsJson { get; set; }
	public string? TagsJson { get; set; }
	public bool IsInternal { get; set; }
	public DateTimeOffset? LastUpdated { get; set; }
	public DateTimeOffset CreatedAt { get; set; } = DateTimeOffset.UtcNow;
}

/// <summary>
/// Search index entry for FTS5 full-text search.
/// </summary>
public class SearchIndexEntry {
	public int Id { get; set; }
	public required string DocumentId { get; set; }
	public required string DocumentType { get; set; }
	public required string Title { get; set; }
	public string? Description { get; set; }
	public string? Content { get; set; }
	public required string Url { get; set; }
	public string? Platform { get; set; }
	public string? Category { get; set; }
	public string? Tags { get; set; }
	public double Boost { get; set; } = 1.0;
	public DateTimeOffset IndexedAt { get; set; } = DateTimeOffset.UtcNow;
}
