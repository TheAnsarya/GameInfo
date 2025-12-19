# DarkRepos Wiki Setup Plan

This document outlines the plan for setting up and deploying the DarkRepos Games Wiki at `games.darkrepos.com`.

## Overview

**URL:** https://games.darkrepos.com
**Platform:** MediaWiki
**Purpose:** ROM hacking documentation, disassemblies, game data, AI-assisted content

## Phase 1: Infrastructure Setup

### 1.1 Server Provisioning

- [ ] Choose hosting provider (VPS, cloud, or self-hosted)
- [ ] Set up web server (Nginx/Apache)
- [ ] Configure SSL certificate (Let's Encrypt)
- [ ] Set up domain DNS for games.darkrepos.com

### 1.2 MediaWiki Installation

- [ ] Install PHP 8.x and required extensions
- [ ] Install MySQL/MariaDB database
- [ ] Download and install MediaWiki (latest stable)
- [ ] Configure `LocalSettings.php`
- [ ] Set up proper file permissions

### 1.3 MediaWiki Configuration

```php
// LocalSettings.php key settings
$wgSitename = "DarkRepos Games Wiki";
$wgMetaNamespace = "DarkRepos";
$wgServer = "https://games.darkrepos.com";
$wgScriptPath = "/w";
$wgArticlePath = "/wiki/$1";

// Enable API for GameInfoTools
$wgEnableAPI = true;
$wgEnableWriteAPI = true;

// Allow account creation
$wgGroupPermissions['*']['createaccount'] = true;

// Bot permissions
$wgGroupPermissions['bot']['bot'] = true;
$wgGroupPermissions['bot']['autoconfirmed'] = true;
```

## Phase 2: Wiki Configuration

### 2.1 Extensions to Install

- [ ] **VisualEditor** - Rich text editing
- [ ] **Cite** - Citation support
- [ ] **ParserFunctions** - Template logic
- [ ] **Scribunto** - Lua scripting for templates
- [ ] **SyntaxHighlight_GeSHi** - Code syntax highlighting
- [ ] **CategoryTree** - Hierarchical categories
- [ ] **WikiEditor** - Enhanced source editor

### 2.2 Custom Templates

- [ ] Create `{{ROM Map}}` template
- [ ] Create `{{RAM Map}}` template
- [ ] Create `{{Data Table}}` template
- [ ] Create `{{Infobox Game}}` template
- [ ] Create `{{TBL}}` template for text tables
- [ ] Create `{{Hex}}` template for formatting

### 2.3 Category Structure

```
Category:Games
├── Category:NES Games
│   ├── Category:Dragon Warrior Series (NES)
│   └── Category:Final Fantasy Series (NES)
├── Category:SNES Games
│   ├── Category:Dragon Quest Series (SNES)
│   └── Category:Final Fantasy Series (SNES)
├── Category:Game Boy Games
└── Category:GBA Games

Category:Documentation
├── Category:ROM Maps
├── Category:RAM Maps
├── Category:Data Structures
├── Category:Disassemblies
└── Category:Text Tables
```

### 2.4 Namespaces

- [ ] Create `Data:` namespace for structured data
- [ ] Create `Disasm:` namespace for disassembly pages
- [ ] Create `Template:` for reusable templates

## Phase 3: GameInfoTools Integration

### 3.1 Wiki Sync Utilities

Create C# utilities for wiki management:

```csharp
// WikiUploader - Batch upload tool
public class WikiUploader {
    public async Task UploadDirectory(string path);
    public async Task UploadFile(string file);
    public async Task SyncWithRemote(string path);
}

// WikiGenerator - Generate wiki content from data
public class WikiGenerator {
    public string GenerateRomMap(RomInfo rom);
    public string GenerateRamMap(SymbolTable symbols);
    public string GenerateDataTable(DataTable table);
}

// WikiValidator - Validate wikitext
public class WikiValidator {
    public ValidationResult Validate(string wikitext);
    public string FixCommonIssues(string wikitext);
}
```

### 3.2 Command Line Tools

```bash
# Upload wiki content
git wiki upload ./wiki-content/ --target darkrepos

# Sync with wiki
git wiki sync ./wiki-content/ --pull --push

# Generate ROM map
git wiki generate rom-map game.nes --output wiki/

# Validate wikitext
git wiki validate ./wiki-content/
```

### 3.3 Automated Workflows

- [ ] GitHub Action for wiki sync on merge
- [ ] Scheduled sync for updated disassemblies
- [ ] Auto-generate pages from JSON data files

## Phase 4: Content Migration

### 4.1 Existing Content Sources
- [ ] GameInfo repository Wiki/ folders
- [ ] dragon-warrior-4-info documentation
- [ ] ffmq-info documentation
- [ ] Existing Data Crystal content (with review)

### 4.2 Migration Process
1. Export existing wikitext files
2. Update templates to new format
3. Validate and fix formatting
4. Batch upload to DarkRepos
5. Verify links and categories

### 4.3 Initial Content
- [ ] Dragon Warrior IV (NES) - ROM Map, RAM Map
- [ ] Dragon Quest III (SNES) - ROM Map, RAM Map
- [ ] Final Fantasy Mystic Quest - ROM Map, Data Structures
- [ ] Text encoding tables (TBL files)

## Phase 5: Maintenance & Automation

### 5.1 Backup Strategy
- [ ] Daily database backups
- [ ] Weekly full backups
- [ ] Offsite backup storage
- [ ] Automated backup verification

### 5.2 Monitoring
- [ ] Uptime monitoring
- [ ] Error logging
- [ ] Performance metrics
- [ ] Security scanning

### 5.3 CI/CD Integration

```yaml
# .github/workflows/wiki-sync.yml
name: Wiki Sync
on:
  push:
    paths:
      - '**/Wiki/**'
jobs:
  sync:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Sync Wiki Content
        run: dotnet run --project tools/wiki-sync -- upload
        env:
          WIKI_BOT_PASSWORD: ${{ secrets.WIKI_BOT_PASSWORD }}
```

## Phase 6: Community Features

### 6.1 User Management
- [ ] Registration approval workflow
- [ ] User groups (Editors, Trusted, Admins)
- [ ] Bot accounts for automation

### 6.2 Quality Control
- [ ] Recent changes patrol
- [ ] Spam protection (CAPTCHA, abuse filter)
- [ ] Content guidelines page
- [ ] Style guide

### 6.3 Communication
- [ ] Discord integration
- [ ] IRC/Matrix channel
- [ ] Discussion pages enabled

## Technical Specifications

### Server Requirements
- **OS:** Ubuntu 22.04 LTS or similar
- **RAM:** 4GB minimum, 8GB recommended
- **Storage:** 50GB+ SSD
- **PHP:** 8.1+
- **MySQL:** 8.0+ or MariaDB 10.6+

### MediaWiki Version
- Latest stable (1.41.x as of 2024)
- Keep updated for security patches

### API Endpoints

```text
Base URL: https://games.darkrepos.com/w/api.php

Actions used by GameInfoTools:
- action=login
- action=query&prop=revisions
- action=edit
- action=parse
- action=tokens
```

## Timeline

| Phase | Duration | Target |
|-------|----------|--------|
| Phase 1: Infrastructure | 1 week | Server ready |
| Phase 2: Wiki Config | 1 week | Wiki operational |
| Phase 3: Integration | 2 weeks | Tools connected |
| Phase 4: Migration | 2 weeks | Content uploaded |
| Phase 5: Maintenance | Ongoing | Automated |
| Phase 6: Community | 1 week | Public ready |

**Total: ~7-8 weeks to full deployment**

## Resources

- [MediaWiki Installation Guide](https://www.mediawiki.org/wiki/Manual:Installation_guide)
- [MediaWiki API Documentation](https://www.mediawiki.org/wiki/API:Main_page)
- [GameInfoTools Wiki Library](../src/GameInfoTools.Wiki/)

## Notes

- AI-generated content is explicitly allowed
- Focus on accuracy and completeness
- Link to disassembly repositories
- Support both NES/SNES and other platforms
