# Data Crystal Integration

GameInfoTools includes integration with [Data Crystal](https://datacrystal.tcrf.net/), a MediaWiki-based wiki for ROM hacking documentation.

## ⚠️ CRITICAL: AI Content Policy

**Data Crystal strictly forbids AI-generated articles.**

This tool is designed to help you:
- Generate wikitext **templates** and **starting points**
- Track changes between local files and wiki pages
- Review and edit content before uploading
- Pull updates from the wiki to stay in sync

**This tool will NOT:**
- Automatically upload any content
- Upload content that hasn't been manually reviewed and edited
- Bypass the review workflow

### Review Workflow

All content must go through a mandatory review process before it can be uploaded:

1. **Generate** - Create wikitext using the Wiki Editor or other tools
2. **Review** - Open in the Data Crystal panel and mark for review
3. **Edit** - Make manual changes to personalize and verify accuracy
4. **Approve** - Explicitly approve the content for upload
5. **Upload** - Only then can the content be pushed to the wiki

Content marked as AI-generated (via embedded markers) cannot be uploaded until the AI markers are removed and the content is approved.

## Features

### Connection Management

- Connect to Data Crystal using your wiki credentials
- Credentials are stored securely and can be saved between sessions
- Connection status is clearly displayed

### File Tracking

Track local `.wikitext` files and sync them with wiki pages:
- **In Sync** (Green) - Local file matches wiki page
- **Local Modified** (Blue) - Local changes not yet uploaded
- **Remote Modified** (Orange) - Wiki has newer changes
- **Conflict** (Red) - Both local and remote have changes
- **Local Only** (Gray) - File exists locally but not on wiki
- **Needs Review** (Yellow) - Content requires review before upload

### Sync Operations

- **Pull from Wiki** - Download the latest version from Data Crystal
- **Push to Wiki** - Upload reviewed content to Data Crystal (requires approval)
- **Compare** - View differences between local and remote versions

### Review Panel

For each tracked file, you can:
- View the current sync status
- Add review notes
- Mark content as reviewed/approved
- Mark content as needing changes

## Setup

1. Open the **Data Crystal** tool from the sidebar
2. Enter the wiki URL: `https://datacrystal.tcrf.net`
3. Enter your username and password
4. Click **Connect**
5. Select your working folder containing `.wikitext` files

## Best Practices

1. **Always review generated content** - Never upload without thorough review
2. **Make meaningful edits** - Add your own research and findings
3. **Cite sources** - Include references to your analysis
4. **Test accuracy** - Verify data tables and addresses are correct
5. **Follow wiki guidelines** - Match the style of existing articles

## Technical Details

### Sync State Storage

Sync state is stored in `.wikisync/sync-state.json` in your working folder. This file tracks:
- Local file hashes
- Remote page revisions
- Review status for each file
- AI-generated content markers

### Change Markers

The change tracker can embed markers in wikitext to track:
- Sections that were AI-generated
- Modified regions
- Timestamps of changes

These markers are HTML comments and won't appear in rendered wiki pages:
```
<!-- GAMEINFO:AI_GENERATED -->
<!-- GAMEINFO:CHANGE:START:2024-01-15T10:30:00 -->
... content ...
<!-- GAMEINFO:CHANGE:END -->
```

### API Endpoints

The integration uses the MediaWiki API:
- Login: `action=login` / `action=clientlogin`
- Page content: `action=query&prop=revisions`
- Page edit: `action=edit`
- Search: `action=query&list=search`

## Troubleshooting

### "Content not approved for upload"

This error appears when trying to upload content that hasn't been reviewed. To fix:
1. Select the file in the tracked files list
2. Review the content carefully
3. Make any necessary edits to the local file
4. Click "Approve for Upload" in the review panel
5. Try uploading again

### "AI-generated content detected"

The file contains AI-generated content markers. To fix:
1. Open the `.wikitext` file in a text editor
2. Find and remove `<!-- GAMEINFO:AI_GENERATED -->` comments
3. Thoroughly review and edit the content
4. Approve for upload in the Data Crystal panel

### Connection Failed

- Verify the wiki URL is correct
- Check your username and password
- Ensure you have an account on Data Crystal
- Check your network connection
