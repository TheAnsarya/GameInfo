# Dark Repos Editor - Development Roadmap

## Project Timeline

**Estimated Duration:** 16-20 weeks  
**Start Date:** January 2026  
**Target Release:** May 2026

---

## Phase 0: Project Foundation (Week 1-2)

### Goals
- Establish project structure and development environment
- Set up CI/CD pipelines
- Create base architecture

### Deliverables

| Task | Priority | Estimate |
|------|----------|----------|
| Create solution structure | 🔴 Critical | 2 days |
| Configure build pipeline (GitHub Actions) | 🔴 Critical | 1 day |
| Set up development environment docs | 🟡 High | 1 day |
| Create shared DTOs and models | 🔴 Critical | 2 days |
| Implement core service host | 🔴 Critical | 3 days |
| Set up EF Core with SQLite | 🔴 Critical | 2 days |
| Create basic Blazor shell | 🔴 Critical | 2 days |
| Implement configuration system | 🟡 High | 1 day |

### Milestones
- [ ] Solution builds successfully
- [ ] Service starts and serves static files
- [ ] Database migrations work
- [ ] Basic "Hello World" Blazor page loads

---

## Phase 1: Core Infrastructure (Week 3-5)

### Goals
- Implement core API infrastructure
- Create shared component library
- Establish design system

### Deliverables

| Task | Priority | Estimate |
|------|----------|----------|
| Design system and CSS variables | 🔴 Critical | 3 days |
| Shared UI component library | 🔴 Critical | 5 days |
| REST API infrastructure | 🔴 Critical | 3 days |
| SignalR hub setup | 🟡 High | 2 days |
| File system service | 🔴 Critical | 2 days |
| Project management API | 🔴 Critical | 3 days |
| Error handling and logging | 🟡 High | 2 days |
| Unit test infrastructure | 🟡 High | 2 days |

### Shared Components to Build

| Component | Description |
|-----------|-------------|
| `Button` | Themed buttons with variants |
| `Input` | Text inputs with validation |
| `Select` | Dropdown selection |
| `Modal` | Dialog overlays |
| `Toast` | Notification toasts |
| `Tabs` | Tabbed content |
| `Toolbar` | Editor toolbars |
| `StatusBar` | Editor status bars |
| `TreeView` | File/symbol trees |
| `DataGrid` | Tabular data display |
| `ColorPicker` | Palette color selection |
| `Canvas` | Drawing surface for editors |

### Milestones
- [ ] Design system documented with examples
- [ ] 15+ shared components built
- [ ] API returns project list
- [ ] SignalR connection established

---

## Phase 2: Core Editors - Part 1 (Week 6-8)

### Goals
- Implement foundational editors
- Integrate with GameInfoTools libraries

### Editor: Hex Editor

| Feature | Priority | Estimate |
|---------|----------|----------|
| Hex view with scrolling | 🔴 Critical | 3 days |
| ASCII view side-by-side | 🔴 Critical | 1 day |
| Byte editing | 🔴 Critical | 2 days |
| Selection and highlighting | 🔴 Critical | 2 days |
| Search (hex/text) | 🟡 High | 2 days |
| Go to address | 🟡 High | 1 day |
| Bookmarks | 🟢 Medium | 1 day |
| Undo/Redo | 🟡 High | 2 days |
| Copy/Paste | 🟡 High | 1 day |
| Data inspector panel | 🟢 Medium | 2 days |

### Editor: ROM Info

| Feature | Priority | Estimate |
|---------|----------|----------|
| Header display | 🔴 Critical | 1 day |
| Checksum verification | 🔴 Critical | 1 day |
| Platform detection | 🔴 Critical | 1 day |
| Mapper/MBC info | 🟡 High | 1 day |
| Export info | 🟢 Medium | 0.5 day |

### Editor: Text Extractor

| Feature | Priority | Estimate |
|---------|----------|----------|
| TBL file loading | 🔴 Critical | 1 day |
| String extraction | 🔴 Critical | 2 days |
| Pointer table support | 🟡 High | 2 days |
| Search strings | 🟡 High | 1 day |
| Export to file | 🟡 High | 1 day |
| DTE encoding support | 🟢 Medium | 1 day |

### Milestones
- [ ] Hex editor functional with basic editing
- [ ] ROM info displays correctly
- [ ] Text extraction works with TBL files
- [ ] 50+ unit tests passing

---

## Phase 3: Core Editors - Part 2 (Week 9-11)

### Goals
- Implement graphics editors
- Add map editing capabilities

### Editor: CHR Editor

| Feature | Priority | Estimate |
|---------|----------|----------|
| NES CHR display | 🔴 Critical | 2 days |
| SNES tile display | 🔴 Critical | 2 days |
| Palette selection | 🔴 Critical | 1 day |
| Tile editing (pixel) | 🔴 Critical | 3 days |
| Copy/Paste tiles | 🟡 High | 1 day |
| Tile flipping/rotation | 🟡 High | 1 day |
| Export to PNG | 🟡 High | 1 day |
| Import from PNG | 🟡 High | 2 days |
| Sprite sheet view | 🟢 Medium | 2 days |
| Animation preview | 🟢 Medium | 2 days |

### Editor: Palette Editor

| Feature | Priority | Estimate |
|---------|----------|----------|
| NES palette display | 🔴 Critical | 1 day |
| SNES palette display | 🔴 Critical | 1 day |
| GB/GBC palette display | 🟡 High | 1 day |
| Color editing | 🔴 Critical | 2 days |
| Palette import/export | 🟡 High | 1 day |
| Preset palettes | 🟢 Medium | 1 day |

### Editor: Map Editor

| Feature | Priority | Estimate |
|---------|----------|----------|
| Tilemap display | 🔴 Critical | 3 days |
| Tile placement | 🔴 Critical | 2 days |
| Tileset panel | 🔴 Critical | 2 days |
| Layer support | 🟡 High | 2 days |
| Selection tools | 🟡 High | 2 days |
| Fill tools | 🟡 High | 1 day |
| Export/Import | 🟢 Medium | 2 days |
| Collision overlay | 🟢 Medium | 2 days |

### Milestones
- [ ] CHR editor displays and edits NES/SNES tiles
- [ ] Palette editor functional
- [ ] Map editor can edit simple tilemaps
- [ ] 100+ unit tests passing

---

## Phase 4: Advanced Editors (Week 12-14)

### Goals
- Implement analysis and scripting tools
- Add disassembly support

### Editor: Disassembler

| Feature | Priority | Estimate |
|---------|----------|----------|
| 6502 disassembly | 🔴 Critical | 2 days |
| 65816 disassembly | 🔴 Critical | 2 days |
| Address display | 🔴 Critical | 1 day |
| Label support | 🟡 High | 2 days |
| Cross-references | 🟡 High | 2 days |
| Navigation | 🟡 High | 1 day |
| Export ASM | 🟡 High | 1 day |
| Comment editing | 🟢 Medium | 1 day |

### Editor: Script Editor

| Feature | Priority | Estimate |
|---------|----------|----------|
| Opcode display | 🔴 Critical | 2 days |
| Syntax highlighting | 🔴 Critical | 2 days |
| Parameter editing | 🟡 High | 2 days |
| Control flow view | 🟡 High | 3 days |
| Script decompilation | 🟢 Medium | 3 days |

### Editor: Data Table Editor

| Feature | Priority | Estimate |
|---------|----------|----------|
| Table definition | 🔴 Critical | 2 days |
| Field types | 🔴 Critical | 2 days |
| Row editing | 🔴 Critical | 2 days |
| Import/Export CSV/JSON | 🟡 High | 2 days |
| Validation | 🟡 High | 1 day |
| Templates (monster/item) | 🟢 Medium | 2 days |

### Editor: CDL Viewer

| Feature | Priority | Estimate |
|---------|----------|----------|
| Coverage visualization | 🔴 Critical | 2 days |
| Heat map | 🟡 High | 2 days |
| Region annotation | 🟡 High | 1 day |
| Export reports | 🟢 Medium | 1 day |

### Milestones
- [ ] Disassembler works for 6502/65816
- [ ] Script editor functional
- [ ] Data tables editable
- [ ] CDL files viewable
- [ ] 150+ unit tests passing

---

## Phase 5: Build Pipeline & Integration (Week 15-16)

### Goals
- Implement build and patching system
- Add project management features

### Build Pipeline

| Feature | Priority | Estimate |
|---------|----------|----------|
| ROM assembly | 🔴 Critical | 3 days |
| IPS patch creation | 🔴 Critical | 2 days |
| BPS patch creation | 🟡 High | 1 day |
| Patch application | 🔴 Critical | 1 day |
| Build configuration | 🟡 High | 2 days |
| Build log output | 🟡 High | 1 day |

### Project Management

| Feature | Priority | Estimate |
|---------|----------|----------|
| Project creation wizard | 🔴 Critical | 2 days |
| File browser | 🔴 Critical | 2 days |
| Recent projects | 🟡 High | 1 day |
| Project settings | 🟡 High | 1 day |
| Export project | 🟢 Medium | 1 day |

### Pointer Scanner

| Feature | Priority | Estimate |
|---------|----------|----------|
| Pointer detection | 🔴 Critical | 2 days |
| Table display | 🔴 Critical | 1 day |
| Navigation to targets | 🟡 High | 1 day |
| Pointer editing | 🟡 High | 1 day |

### Milestones
- [ ] ROMs can be assembled from source
- [ ] IPS/BPS patches can be created and applied
- [ ] Project management fully functional
- [ ] 200+ unit tests passing

---

## Phase 6: Platform Packaging (Week 17-18)

### Goals
- Create native installers
- Implement system integration

### Windows

| Task | Priority | Estimate |
|------|----------|----------|
| WiX installer | 🔴 Critical | 2 days |
| Windows Service | 🔴 Critical | 2 days |
| System tray icon | 🟡 High | 1 day |
| Auto-start option | 🟡 High | 0.5 day |
| File associations | 🟢 Medium | 0.5 day |

### macOS

| Task | Priority | Estimate |
|------|----------|----------|
| DMG packaging | 🔴 Critical | 2 days |
| LaunchAgent | 🔴 Critical | 1 day |
| Menu bar icon | 🟡 High | 1 day |
| Code signing | 🟡 High | 1 day |
| Notarization | 🟡 High | 1 day |

### Linux

| Task | Priority | Estimate |
|------|----------|----------|
| DEB package | 🔴 Critical | 1 day |
| RPM package | 🔴 Critical | 1 day |
| AppImage | 🟡 High | 1 day |
| systemd service | 🔴 Critical | 1 day |
| Desktop file | 🟡 High | 0.5 day |

### Milestones
- [ ] Windows installer works
- [ ] macOS DMG works
- [ ] Linux packages work
- [ ] Services start on boot

---

## Phase 7: Polish & Documentation (Week 19-20)

### Goals
- Final polish and bug fixes
- Complete documentation
- Prepare for release

### Documentation

| Task | Priority | Estimate |
|------|----------|----------|
| User guide | 🔴 Critical | 3 days |
| API reference | 🟡 High | 2 days |
| Editor tutorials | 🟡 High | 2 days |
| Video tutorials | 🟢 Medium | 2 days |
| Contributing guide | 🟢 Medium | 1 day |

### Testing & QA

| Task | Priority | Estimate |
|------|----------|----------|
| End-to-end tests | 🔴 Critical | 3 days |
| Cross-browser testing | 🔴 Critical | 2 days |
| Performance testing | 🟡 High | 2 days |
| Accessibility audit | 🔴 Critical | 2 days |
| Security review | 🟡 High | 1 day |

### Release Preparation

| Task | Priority | Estimate |
|------|----------|----------|
| Release notes | 🔴 Critical | 1 day |
| Website updates | 🟡 High | 1 day |
| Marketing materials | 🟢 Medium | 1 day |
| Community outreach | 🟢 Medium | 1 day |

### Milestones
- [ ] User documentation complete
- [ ] All tests passing
- [ ] Accessibility compliant
- [ ] v1.0.0 released

---

## Future Phases (Post v1.0)

### Phase 8: Collaboration Features
- Multi-user project editing
- Cloud sync for projects
- Comment/annotation sharing

### Phase 9: Plugin System
- Plugin API finalization
- Plugin marketplace
- Community plugins

### Phase 10: Advanced Features
- Audio editor (music/SFX)
- Save state analysis
- Memory viewer (live emulator connection)
- AI-assisted analysis

### Phase 11: Mobile Support
- PWA optimization
- Touch-friendly editors
- Mobile installers

---

## Risk Assessment

| Risk | Likelihood | Impact | Mitigation |
|------|------------|--------|------------|
| Blazor WASM performance | Medium | High | Use virtualization, lazy loading |
| Cross-platform issues | Medium | Medium | Early testing on all platforms |
| Graphics editor complexity | High | Medium | Start with simple features |
| Scope creep | High | High | Strict phase boundaries |
| Browser compatibility | Low | Medium | Target modern browsers only |

---

## Success Metrics

### v1.0 Release Criteria

- [ ] All 15 editors functional
- [ ] 200+ unit tests passing
- [ ] Cross-platform installers working
- [ ] Documentation complete
- [ ] No critical bugs
- [ ] Accessibility compliant (WCAG 2.1 AA)
- [ ] Performance: <3s initial load, <100ms editor response

### Post-Release Metrics

| Metric | Target |
|--------|--------|
| GitHub Stars | 100+ (6 months) |
| Active Users | 50+ weekly |
| Bug Reports | <10 critical per month |
| Community PRs | 5+ per month |

---

## Resource Requirements

### Development Team

| Role | Count | Notes |
|------|-------|-------|
| Lead Developer | 1 | Full-stack .NET/Blazor |
| Frontend Developer | 1 | Blazor/CSS specialist |
| QA Engineer | 0.5 | Part-time testing |

### Infrastructure

| Resource | Cost | Notes |
|----------|------|-------|
| GitHub Pro | Free | Open source |
| CI/CD | Free | GitHub Actions |
| Code Signing | ~$200/yr | Windows/macOS |
| Domain | ~$12/yr | editor.darkrepos.com |

---

## Appendix: Feature Priority Legend

| Symbol | Priority | Description |
|--------|----------|-------------|
| 🔴 | Critical | Must have for release |
| 🟡 | High | Should have for release |
| 🟢 | Medium | Nice to have |
| ⚪ | Low | Future consideration |
