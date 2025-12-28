#!/usr/bin/env python3
"""
DQ3 ROM Analysis - GitHub Issues Generator
Comprehensive project management tool for tracking ROM analysis progress
"""

import os
import json
import datetime
from typing import Dict, List, Any

class GitHubIssueGenerator:
	def __init__(self, project_root: str):
		self.project_root = project_root
		self.issues_dir = os.path.join(project_root, "project_management", "github_issues")
		self.kanban_dir = os.path.join(project_root, "project_management", "kanban")
		self.reports_dir = os.path.join(project_root, "reports")

		# Ensure output directories exist
		os.makedirs(self.issues_dir, exist_ok=True)
		os.makedirs(self.kanban_dir, exist_ok=True)
		os.makedirs(self.reports_dir, exist_ok=True)

		self.issues = []
		self.issue_counter = 1

	def create_comprehensive_issues(self):
		"""Create comprehensive GitHub issues covering all aspects of ROM analysis"""

		print("🚀 Creating comprehensive GitHub issues for Dragon Quest III ROM analysis...")

		# Core Disassembly Issues
		self.create_core_disassembly_issues()

		# System-Specific Analysis Issues
		self.create_system_analysis_issues()

		# Documentation and Organization Issues
		self.create_documentation_issues()

		# Quality Assurance and Testing Issues
		self.create_quality_assurance_issues()

		# Advanced Analysis Issues
		self.create_advanced_analysis_issues()

		# Project Management Issues
		self.create_project_management_issues()

		# Generate kanban board
		self.generate_kanban_board()

		# Generate summary report
		self.generate_issues_report()

		print(f"✅ Generated {len(self.issues)} comprehensive GitHub issues")
		return len(self.issues)

	def create_core_disassembly_issues(self):
		"""Create issues for core ROM disassembly work"""

		# Complete ROM Coverage Issue
		self.add_issue(
			title="🔍 Complete ROM Coverage Analysis",
			labels=["enhancement", "disassembly", "high-priority"],
			milestone="Phase 1: Core Disassembly",
			priority="critical",
			description="""
## Objective
Achieve 100% ROM coverage with comprehensive disassembly of all code sections.

## Current Status
- ✅ 96.48% coverage achieved (972,104/1,006,632 bytes)
- ✅ 125,779 lines of assembly generated
- 🔄 34,528 bytes remaining for complete coverage

## Tasks
- [ ] Analyze remaining uncovered regions (34,528 bytes)
- [ ] Identify embedded data vs executable code
- [ ] Document all unidentified code patterns
- [ ] Implement advanced heuristics for code detection
- [ ] Verify all interrupt vectors and jump targets
- [ ] Cross-reference with known SNES game patterns

## Acceptance Criteria
- [ ] 100% ROM coverage documented
- [ ] All code regions properly classified
- [ ] Complete cross-reference table generated
- [ ] Comprehensive annotations for all functions

## Files Involved
- `src/ultimate/dq3_ultimate.asm`
- `tools/analysis/maximum_coverage_analyzer.py`
- `tools/analysis/ultimate_disassembler.py`

## Dependencies
- Requires completion of graphics/data analysis
- Should coordinate with documentation generation
			""",
			assignee="rom-analysis-team",
			estimated_hours=40
		)

		# Memory Banking Analysis
		self.add_issue(
			title="🏦 Complete Memory Banking System Analysis",
			labels=["enhancement", "memory-mapping", "architecture"],
			milestone="Phase 1: Core Disassembly",
			priority="high",
			description="""
## Objective
Comprehensive analysis of 65816 memory banking and address mapping.

## Current Progress
- ✅ Basic banking structure identified
- ✅ Bank switching routines documented
- 🔄 Need complete bank usage mapping

## Tasks
- [ ] Document all 256 possible banks (0x00-0xff)
- [ ] Identify bank switching patterns
- [ ] Map bank usage for different game modes
- [ ] Analyze Fast ROM vs Slow ROM usage
- [ ] Document direct page usage patterns
- [ ] Create memory layout visualization

## Technical Details
- 24-bit addressing with 16-bit bank registers
- FastROM mapping to 0x808000-0xffffff
- SlowROM mapping to 0x008000-0x7fffff
- Bank 0x7e/0x7f for WRAM usage

## Deliverables
- Complete bank usage documentation
- Memory layout diagrams
- Bank switching function catalog
			""",
			assignee="architecture-team",
			estimated_hours=25
		)

		# Function Classification
		self.add_issue(
			title="⚙️ Advanced Function Classification System",
			labels=["enhancement", "analysis", "automation"],
			milestone="Phase 2: Analysis Enhancement",
			priority="high",
			description="""
## Objective
Implement advanced function classification beyond basic patterns.

## Current Classification
- ✅ 200+ functions identified
- ✅ Basic pattern matching implemented
- 🔄 Need semantic analysis

## Enhanced Classification Targets
- [ ] Game loop functions
- [ ] Event handlers
- [ ] Data processing routines
- [ ] Graphics/rendering functions
- [ ] Audio/music functions
- [ ] UI/menu functions
- [ ] Battle system functions
- [ ] Map/field functions

## Technical Approach
- Control flow graph analysis
- Data access pattern analysis
- Call frequency analysis
- Parameter passing convention analysis

## Output Format
- Function catalog with detailed metadata
- Call graph visualization
- Performance profiling data
			""",
			assignee="analysis-team",
			estimated_hours=30
		)

	def create_system_analysis_issues(self):
		"""Create issues for specific game system analysis"""

		# Battle System Complete Analysis
		self.add_issue(
			title="⚔️ Complete Battle System Disassembly",
			labels=["battle-system", "gameplay", "critical"],
			milestone="Phase 2: System Analysis",
			priority="high",
			description="""
## Objective
Complete disassembly and documentation of Dragon Quest III battle system.

## System Components
- [ ] Turn order calculation
- [ ] Damage formula implementation
- [ ] Magic spell effects
- [ ] Status effect processing
- [ ] AI behavior patterns
- [ ] Experience/gold calculation
- [ ] Item usage in battle
- [ ] Escape mechanics

## Technical Analysis Required
- [ ] Random number generation for battle
- [ ] Critical hit calculation
- [ ] Elemental resistance system
- [ ] Monster AI decision trees
- [ ] Battle animation triggers

## Documentation Deliverables
- Complete battle flow documentation
- Formula reference guide
- AI behavior patterns
- Data structure specifications

## Related Data Tables
- Monster stats and AI
- Weapon/armor statistics
- Spell damage formulas
- Experience tables
			""",
			assignee="gameplay-team",
			estimated_hours=45
		)

		# Audio System Analysis
		self.add_issue(
			title="🎵 Complete Audio System Disassembly",
			labels=["audio", "spc700", "hardware"],
			milestone="Phase 2: System Analysis",
			priority="medium",
			description="""
## Objective
Full analysis of SNES audio system and SPC700 driver implementation.

## Audio Components
- [ ] SPC700 driver code analysis
- [ ] Music data format documentation
- [ ] Sound effect trigger system
- [ ] Audio streaming implementation
- [ ] Hardware register usage

## Current Assets Identified
- ✅ 2,600+ graphics assets converted
- ✅ Basic audio data extracted
- 🔄 Need complete driver analysis

## Technical Challenges
- SPC700 assembly different from 65816
- Audio data compression analysis
- Real-time audio processing
- Hardware timing requirements

## Deliverables
- SPC700 driver documentation
- Audio format specifications
- Hardware usage guide
- Audio asset catalog
			""",
			assignee="audio-team",
			estimated_hours=35
		)

		# Graphics Engine Analysis
		self.add_issue(
			title="🖼️ Graphics Engine Complete Analysis",
			labels=["graphics", "ppu", "rendering"],
			milestone="Phase 2: System Analysis",
			priority="high",
			description="""
## Objective
Comprehensive analysis of SNES PPU usage and graphics rendering.

## Graphics Subsystems
- [ ] Sprite management system
- [ ] Background layer handling
- [ ] Palette management
- [ ] Graphics decompression
- [ ] Animation system
- [ ] Special effects

## Current Progress
- ✅ 2,600+ graphics assets converted to PNG
- ✅ Basic tile extraction completed
- 🔄 Need rendering pipeline analysis

## PPU Features to Document
- Mode 7 usage for world map
- Sprite multiplexing techniques
- Background scrolling implementation
- Transparency/window effects
- Palette cycling for animation

## Technical Documentation Needed
- Graphics format specifications
- Compression algorithm details
- PPU register usage patterns
- Performance optimization techniques
			""",
			assignee="graphics-team",
			estimated_hours=40
		)

		# Map and Field System
		self.add_issue(
			title="🗺️ Map and Field System Analysis",
			labels=["maps", "world", "navigation"],
			milestone="Phase 2: System Analysis",
			priority="medium",
			description="""
## Objective
Complete analysis of overworld, towns, and dungeon systems.

## Map System Components
- [ ] World map data structure
- [ ] Town/dungeon layout format
- [ ] Collision detection system
- [ ] NPC placement and behavior
- [ ] Event trigger system
- [ ] Treasure chest mechanics

## Navigation Features
- [ ] Party movement system
- [ ] Vehicle mechanics (ship, etc.)
- [ ] Zoom transitions
- [ ] Area loading/unloading
- [ ] Map connection points

## Data Analysis Required
- Map compression algorithms
- Tileset organization
- Event scripting system
- Save game integration

## Documentation Targets
- Map format specifications
- Event system documentation
- Collision system analysis
- Performance optimization details
			""",
			assignee="world-team",
			estimated_hours=35
		)

		# Menu and UI System
		self.add_issue(
			title="🏪 Menu and UI System Analysis",
			labels=["ui", "menus", "interface"],
			milestone="Phase 2: System Analysis",
			priority="medium",
			description="""
## Objective
Complete analysis of all menu systems and user interface elements.

## Menu Systems to Analyze
- [ ] Main game menus (items, status, etc.)
- [ ] Battle interface
- [ ] Shop systems
- [ ] Save/load interface
- [ ] Character creation/naming
- [ ] Settings and configuration

## UI Elements
- [ ] Text rendering system
- [ ] Dialog box implementation
- [ ] Button and input handling
- [ ] Menu navigation logic
- [ ] Cursor and selection management

## Technical Components
- Font data and rendering
- Text compression/encoding
- Menu layout algorithms
- Input processing pipeline
- Screen transition effects

## Documentation Goals
- UI system architecture
- Input handling specifications
- Text system documentation
- Menu behavior patterns
			""",
			assignee="interface-team",
			estimated_hours=30
		)

	def create_documentation_issues(self):
		"""Create issues for documentation and organization"""

		# Master Documentation System
		self.add_issue(
			title="📚 Master Documentation System",
			labels=["documentation", "organization", "critical"],
			milestone="Phase 3: Documentation",
			priority="critical",
			description="""
## Objective
Create comprehensive, professional documentation for the entire project.

## Current Documentation Status
- ✅ 666+ files documented with 145,805 words
- ✅ 218,707 estimated tokens generated
- ✅ Automated documentation pipeline
- 🔄 Need organization and quality improvements

## Documentation Standards Required
- [ ] Consistent formatting across all documents
- [ ] Professional technical writing standards
- [ ] Comprehensive cross-referencing
- [ ] API documentation for all tools
- [ ] Installation and usage guides
- [ ] Contributing guidelines

## Documentation Categories
- [ ] Technical specifications
- [ ] API references
- [ ] User guides
- [ ] Developer documentation
- [ ] Analysis reports
- [ ] Progress tracking

## Quality Assurance
- [ ] Documentation review process
- [ ] Automated quality checks
- [ ] Consistency validation
- [ ] Link verification
			""",
			assignee="documentation-team",
			estimated_hours=50
		)

		# Code Formatting Standards
		self.add_issue(
			title="🎨 Code Formatting and Standards Enforcement",
			labels=["formatting", "standards", "automation"],
			milestone="Phase 3: Quality Assurance",
			priority="high",
			description="""
## Objective
Enforce professional code formatting and development standards.

## Current Formatting Status
- ✅ 425,439 hex values converted to lowercase
- ✅ Automated hex formatting tool implemented
- ✅ 1,445 files processed successfully
- 🔄 Need broader formatting standards

## Formatting Standards to Implement
- [ ] Python code formatting (black/flake8)
- [ ] Assembly code formatting consistency
- [ ] JSON/data file formatting
- [ ] Markdown documentation formatting
- [ ] Git commit message standards

## Automation Requirements
- [ ] Pre-commit hooks for formatting
- [ ] CI/CD pipeline integration
- [ ] Automated format checking
- [ ] Style guide enforcement

## Quality Metrics
- [ ] Code complexity analysis
- [ ] Documentation coverage metrics
- [ ] Formatting compliance reporting
- [ ] Technical debt tracking
			""",
			assignee="quality-team",
			estimated_hours=25
		)

		# Cross-Reference Generation
		self.add_issue(
			title="🔗 Complete Cross-Reference System",
			labels=["cross-reference", "navigation", "tooling"],
			milestone="Phase 3: Documentation",
			priority="medium",
			description="""
## Objective
Generate comprehensive cross-reference system for all code and data.

## Cross-Reference Categories
- [ ] Function call graphs
- [ ] Data structure usage
- [ ] Memory address references
- [ ] File dependencies
- [ ] Documentation links
- [ ] Asset references

## Technical Implementation
- [ ] Automated reference extraction
- [ ] Graph visualization generation
- [ ] Interactive navigation tools
- [ ] Search functionality
- [ ] Dependency analysis

## Output Formats
- [ ] HTML with interactive navigation
- [ ] Graph visualization (DOT/SVG)
- [ ] JSON data for external tools
- [ ] Markdown reference tables

## Integration Requirements
- [ ] IDE integration support
- [ ] Web browser compatibility
- [ ] Command-line tools
- [ ] API access for external tools
			""",
			assignee="tooling-team",
			estimated_hours=35
		)

	def create_quality_assurance_issues(self):
		"""Create issues for testing and quality assurance"""

		# Comprehensive Testing Suite
		self.add_issue(
			title="🧪 Comprehensive Testing and Validation Suite",
			labels=["testing", "validation", "critical"],
			milestone="Phase 3: Quality Assurance",
			priority="critical",
			description="""
## Objective
Implement comprehensive testing for all analysis tools and generated code.

## Testing Categories Required
- [ ] Unit tests for all Python tools
- [ ] Integration tests for analysis pipeline
- [ ] Validation tests for assembly output
- [ ] Performance regression tests
- [ ] Data integrity verification

## Current Testing Status
- 🔄 No formal testing framework implemented
- 🔄 Manual validation only
- 🔄 Need automated test suite

## Testing Infrastructure
- [ ] PyTest framework setup
- [ ] Continuous integration pipeline
- [ ] Test data management
- [ ] Coverage reporting
- [ ] Performance benchmarking

## Validation Requirements
- [ ] Assembly output correctness
- [ ] Data extraction accuracy
- [ ] Graphics conversion quality
- [ ] Documentation completeness
- [ ] Tool reliability

## Quality Metrics
- [ ] Code coverage targets (>90%)
- [ ] Performance benchmarks
- [ ] Error rate tracking
- [ ] Documentation coverage
			""",
			assignee="qa-team",
			estimated_hours=40
		)

		# Build System Validation
		self.add_issue(
			title="🔨 Build System and Assembly Validation",
			labels=["build", "assembly", "validation"],
			milestone="Phase 3: Quality Assurance",
			priority="high",
			description="""
## Objective
Ensure all generated assembly can be built and produces correct ROM.

## Build Validation Requirements
- [ ] Assembly syntax validation
- [ ] Label/symbol resolution testing
- [ ] Memory layout verification
- [ ] ROM output validation
- [ ] Checksum verification

## Current Build Status
- ✅ 125,779 lines of assembly generated
- 🔄 No build verification implemented
- 🔄 Need comprehensive build testing

## Build Infrastructure Needed
- [ ] 65816 assembler integration (ca65/wla-dx)
- [ ] Automated build pipeline
- [ ] ROM comparison tools
- [ ] Binary diff analysis
- [ ] Regression testing

## Validation Targets
- [ ] Bit-perfect ROM reconstruction
- [ ] Functional verification
- [ ] Performance analysis
- [ ] Memory usage validation

## Error Handling
- [ ] Build error reporting
- [ ] Automated issue detection
- [ ] Recovery procedures
- [ ] Error classification
			""",
			assignee="build-team",
			estimated_hours=30
		)

	def create_advanced_analysis_issues(self):
		"""Create issues for advanced analysis techniques"""

		# AI-Powered Analysis
		self.add_issue(
			title="🤖 AI-Powered Code Analysis Enhancement",
			labels=["ai", "analysis", "enhancement", "experimental"],
			milestone="Phase 4: Advanced Analysis",
			priority="low",
			description="""
## Objective
Implement AI/ML techniques for advanced code analysis and pattern recognition.

## AI Analysis Targets
- [ ] Function purpose prediction
- [ ] Code pattern clustering
- [ ] Automatic naming generation
- [ ] Similarity analysis
- [ ] Anomaly detection

## Machine Learning Applications
- [ ] Code classification models
- [ ] Pattern recognition networks
- [ ] Natural language processing for naming
- [ ] Graph neural networks for call analysis
- [ ] Unsupervised learning for discovery

## Technical Requirements
- [ ] Training data preparation
- [ ] Model architecture design
- [ ] Evaluation metrics
- [ ] Integration with existing tools
- [ ] Performance optimization

## Experimental Features
- [ ] Automated documentation generation
- [ ] Code quality assessment
- [ ] Refactoring suggestions
- [ ] Bug pattern detection

## Research Areas
- [ ] Domain-specific language models
- [ ] Assembly code embeddings
- [ ] Graph-based analysis
- [ ] Transfer learning applications
			""",
			assignee="research-team",
			estimated_hours=60
		)

		# Performance Analysis
		self.add_issue(
			title="📊 Performance Analysis and Optimization",
			labels=["performance", "analysis", "optimization"],
			milestone="Phase 4: Advanced Analysis",
			priority="medium",
			description="""
## Objective
Comprehensive performance analysis of original game code and analysis tools.

## Performance Analysis Categories
- [ ] CPU cycle analysis
- [ ] Memory access patterns
- [ ] I/O timing analysis
- [ ] Graphics performance
- [ ] Audio latency analysis

## Game Performance Metrics
- [ ] Frame rate analysis
- [ ] Loading time profiling
- [ ] Memory usage optimization
- [ ] Battle system performance
- [ ] Menu responsiveness

## Tool Performance Optimization
- [ ] Analysis pipeline profiling
- [ ] Memory usage optimization
- [ ] Parallel processing implementation
- [ ] Caching strategies
- [ ] Algorithm optimization

## Benchmarking Suite
- [ ] Performance regression testing
- [ ] Comparative analysis tools
- [ ] Bottleneck identification
- [ ] Optimization tracking

## Deliverables
- Performance analysis reports
- Optimization recommendations
- Benchmarking tools
- Performance monitoring
			""",
			assignee="performance-team",
			estimated_hours=35
		)

		# Comparative Analysis
		self.add_issue(
			title="🔄 Comparative Analysis with Other SNES RPGs",
			labels=["comparative", "research", "analysis"],
			milestone="Phase 4: Advanced Analysis",
			priority="low",
			description="""
## Objective
Compare Dragon Quest III implementation with other SNES RPGs for insights.

## Comparison Targets
- [ ] Final Fantasy series (IV, V, VI)
- [ ] Chrono Trigger
- [ ] Secret of Mana
- [ ] Other Enix/Dragon Quest games
- [ ] General SNES RPG patterns

## Analysis Categories
- [ ] Memory management strategies
- [ ] Graphics rendering techniques
- [ ] Audio implementation approaches
- [ ] Battle system architectures
- [ ] Save system implementations

## Technical Comparisons
- [ ] Code organization patterns
- [ ] Performance optimization techniques
- [ ] Hardware utilization strategies
- [ ] Data compression methods
- [ ] User interface designs

## Research Methodology
- [ ] Standardized analysis framework
- [ ] Quantitative comparison metrics
- [ ] Qualitative assessment criteria
- [ ] Industry best practices documentation

## Expected Insights
- [ ] Industry standard practices
- [ ] Unique implementation choices
- [ ] Performance trade-offs
- [ ] Innovation identification
			""",
			assignee="research-team",
			estimated_hours=50
		)

	def create_project_management_issues(self):
		"""Create issues for project management and coordination"""

		# Project Automation
		self.add_issue(
			title="🤖 Complete Project Automation Pipeline",
			labels=["automation", "ci-cd", "workflow"],
			milestone="Phase 4: Project Management",
			priority="high",
			description="""
## Objective
Implement comprehensive automation for all project workflows.

## Automation Categories
- [ ] Code analysis automation
- [ ] Documentation generation
- [ ] Testing and validation
- [ ] Build and deployment
- [ ] Quality assurance checks

## Current Automation Status
- ✅ Hex formatting automation
- ✅ Documentation generation automation
- ✅ Git workflow automation
- 🔄 Need complete CI/CD pipeline

## CI/CD Requirements
- [ ] GitHub Actions workflow setup
- [ ] Automated testing pipeline
- [ ] Code quality checks
- [ ] Documentation updates
- [ ] Release automation

## Workflow Automation
- [ ] Issue tracking automation
- [ ] Progress reporting
- [ ] Milestone tracking
- [ ] Team coordination tools
- [ ] Notification systems

## Monitoring and Alerts
- [ ] Build status monitoring
- [ ] Quality metric tracking
- [ ] Performance monitoring
- [ ] Error detection and alerting
			""",
			assignee="devops-team",
			estimated_hours=45
		)

		# Team Coordination
		self.add_issue(
			title="👥 Team Coordination and Workflow Management",
			labels=["team", "workflow", "coordination"],
			milestone="Phase 4: Project Management",
			priority="medium",
			description="""
## Objective
Establish efficient team coordination and workflow management systems.

## Coordination Requirements
- [ ] Clear role definitions and responsibilities
- [ ] Task assignment and tracking
- [ ] Progress reporting mechanisms
- [ ] Communication protocols
- [ ] Code review processes

## Workflow Management
- [ ] Kanban board optimization
- [ ] Sprint planning processes
- [ ] Milestone tracking
- [ ] Dependency management
- [ ] Risk assessment and mitigation

## Communication Tools
- [ ] Regular status updates
- [ ] Technical discussion forums
- [ ] Decision documentation
- [ ] Knowledge sharing sessions
- [ ] Code review guidelines

## Quality Assurance
- [ ] Peer review processes
- [ ] Quality gate definitions
- [ ] Continuous improvement
- [ ] Best practices documentation
- [ ] Training and onboarding

## Metrics and KPIs
- [ ] Velocity tracking
- [ ] Quality metrics
- [ ] Team productivity
- [ ] Technical debt monitoring
			""",
			assignee="project-manager",
			estimated_hours=20
		)

		# Release Planning
		self.add_issue(
			title="🚀 Release Planning and Version Management",
			labels=["release", "versioning", "planning"],
			milestone="Phase 4: Project Management",
			priority="medium",
			description="""
## Objective
Establish comprehensive release planning and version management.

## Release Categories
- [ ] Major milestone releases
- [ ] Feature releases
- [ ] Bug fix releases
- [ ] Documentation updates
- [ ] Tool releases

## Version Management
- [ ] Semantic versioning implementation
- [ ] Release branch strategy
- [ ] Hotfix procedures
- [ ] Rollback mechanisms
- [ ] Compatibility tracking

## Release Planning Process
- [ ] Feature roadmap development
- [ ] Release timeline planning
- [ ] Risk assessment
- [ ] Quality gate definitions
- [ ] Stakeholder communication

## Release Automation
- [ ] Automated release builds
- [ ] Version tagging
- [ ] Changelog generation
- [ ] Asset packaging
- [ ] Distribution automation

## Post-Release Activities
- [ ] Release monitoring
- [ ] Feedback collection
- [ ] Issue tracking
- [ ] Performance monitoring
- [ ] User support
			""",
			assignee="release-manager",
			estimated_hours=25
		)

	def add_issue(self, title: str, labels: List[str], milestone: str, priority: str,
					description: str, assignee: str = "", estimated_hours: int = 0):
		"""Add a new issue to the collection"""

		issue = {
			"number": self.issue_counter,
			"title": title,
			"description": description,
			"labels": labels,
			"milestone": milestone,
			"priority": priority,
			"assignee": assignee,
			"estimated_hours": estimated_hours,
			"created_at": datetime.datetime.now().isoformat(),
			"status": "backlog",
			"epic": self.determine_epic(labels),
			"acceptance_criteria": self.extract_acceptance_criteria(description),
			"technical_complexity": self.assess_complexity(estimated_hours),
			"dependencies": self.extract_dependencies(description)
		}

		self.issues.append(issue)
		self.save_individual_issue(issue)
		self.issue_counter += 1

	def determine_epic(self, labels: List[str]) -> str:
		"""Determine epic based on labels"""
		epic_mapping = {
			"disassembly": "Core ROM Analysis",
			"documentation": "Documentation & Organization",
			"testing": "Quality Assurance",
			"automation": "Project Infrastructure",
			"analysis": "Advanced Analysis",
			"graphics": "Graphics System Analysis",
			"audio": "Audio System Analysis",
			"battle-system": "Gameplay Systems",
			"performance": "Performance & Optimization"
		}

		for label in labels:
			if label in epic_mapping:
				return epic_mapping[label]

		return "General"

	def extract_acceptance_criteria(self, description: str) -> List[str]:
		"""Extract acceptance criteria from issue description"""
		criteria = []
		lines = description.split('\n')
		in_acceptance_section = False

		for line in lines:
			line = line.strip()
			if "Acceptance Criteria" in line:
				in_acceptance_section = True
				continue
			elif line.startswith("##") and in_acceptance_section:
				break
			elif in_acceptance_section and line.startswith("- [ ]"):
				criteria.append(line[6:])	# Remove "- [ ] "

		return criteria

	def assess_complexity(self, estimated_hours: int) -> str:
		"""Assess technical complexity based on estimated hours"""
		if estimated_hours <= 10:
			return "Low"
		elif estimated_hours <= 25:
			return "Medium"
		elif estimated_hours <= 40:
			return "High"
		else:
			return "Very High"

	def extract_dependencies(self, description: str) -> List[str]:
		"""Extract dependencies from issue description"""
		dependencies = []
		lines = description.split('\n')

		for line in lines:
			line = line.strip()
			if "Dependencies" in line or "Requires" in line:
				if "completion of" in line.lower():
					dependencies.append(line)

		return dependencies

	def save_individual_issue(self, issue: Dict[str, Any]):
		"""Save individual issue to markdown file"""
		filename = f"issue_{issue['number']:03d}_{issue['title'].replace(' ', '_').replace(':', '').replace('/', '_').lower()}.md"
		filepath = os.path.join(self.issues_dir, filename)

		with open(filepath, 'w', encoding='utf-8') as f:
			f.write(f"# {issue['title']}\n\n")
			f.write(f"**Issue Number:** #{issue['number']}\n")
			f.write(f"**Priority:** {issue['priority']}\n")
			f.write(f"**Epic:** {issue['epic']}\n")
			f.write(f"**Milestone:** {issue['milestone']}\n")
			f.write(f"**Labels:** {', '.join(issue['labels'])}\n")
			f.write(f"**Assignee:** {issue['assignee']}\n")
			f.write(f"**Estimated Hours:** {issue['estimated_hours']}\n")
			f.write(f"**Complexity:** {issue['technical_complexity']}\n")
			f.write(f"**Created:** {issue['created_at']}\n")
			f.write(f"**Status:** {issue['status']}\n\n")

			f.write("## Description\n\n")
			f.write(issue['description'])
			f.write("\n\n")

			if issue['acceptance_criteria']:
				f.write("## Acceptance Criteria\n\n")
				for criteria in issue['acceptance_criteria']:
					f.write(f"- [ ] {criteria}\n")
				f.write("\n")

			if issue['dependencies']:
				f.write("## Dependencies\n\n")
				for dep in issue['dependencies']:
					f.write(f"- {dep}\n")
				f.write("\n")

	def generate_kanban_board(self):
		"""Generate kanban board representation"""

		print("📋 Generating kanban board...")

		# Group issues by status and priority
		kanban = {
			"backlog": {"critical": [], "high": [], "medium": [], "low": []},
			"todo": {"critical": [], "high": [], "medium": [], "low": []},
			"in_progress": {"critical": [], "high": [], "medium": [], "low": []},
			"review": {"critical": [], "high": [], "medium": [], "low": []},
			"done": {"critical": [], "high": [], "medium": [], "low": []}
		}

		for issue in self.issues:
			status = issue["status"]
			priority = issue["priority"]
			if status in kanban and priority in kanban[status]:
				kanban[status][priority].append(issue)

		# Generate kanban HTML
		kanban_html = self.generate_kanban_html(kanban)
		html_path = os.path.join(self.kanban_dir, "project_kanban.html")
		with open(html_path, 'w', encoding='utf-8') as f:
			f.write(kanban_html)

		# Generate kanban JSON
		kanban_path = os.path.join(self.kanban_dir, "kanban_data.json")
		with open(kanban_path, 'w', encoding='utf-8') as f:
			json.dump(kanban, f, indent=2, default=str)

		# Generate kanban markdown summary
		self.generate_kanban_markdown(kanban)

	def generate_kanban_html(self, kanban: Dict) -> str:
		"""Generate HTML kanban board"""

		html = """<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>DQ3 ROM Analysis - Project Kanban</title>
	<style>
		body { font-family: Arial, sans-serif; margin: 0; padding: 20px; background: #f5f5f5; }
		.kanban-board { display: flex; gap: 20px; overflow-x: auto; }
		.column { background: white; border-radius: 8px; padding: 15px; min-width: 300px; box-shadow: 0 2px 4px rgba(0,0,0,0.1); }
		.column h2 { margin-top: 0; text-align: center; border-bottom: 2px solid #ddd; padding-bottom: 10px; }
		.priority-section { margin-bottom: 20px; }
		.priority-header { font-weight: bold; color: #666; margin-bottom: 10px; }
		.issue-card { background: #f9f9f9; border-left: 4px solid #ccc; margin-bottom: 10px; padding: 10px; border-radius: 4px; }
		.issue-title { font-weight: bold; margin-bottom: 5px; }
		.issue-meta { font-size: 0.8em; color: #666; }
		.critical { border-left-color: #e74c3c; }
		.high { border-left-color: #f39c12; }
		.medium { border-left-color: #3498db; }
		.low { border-left-color: #95a5a6; }
		.stats { background: white; padding: 15px; margin-bottom: 20px; border-radius: 8px; box-shadow: 0 2px 4px rgba(0,0,0,0.1); }
	</style>
</head>
<body>
	<h1>🎮 Dragon Quest III ROM Analysis - Project Kanban Board</h1>

	<div class="stats">
		<h3>📊 Project Statistics</h3>
		<p><strong>Total Issues:</strong> """ + str(len(self.issues)) + """</p>
		<p><strong>Total Estimated Hours:</strong> """ + str(sum(issue['estimated_hours'] for issue in self.issues)) + """</p>
		<p><strong>Generated:</strong> """ + datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S") + """</p>
	</div>

	<div class="kanban-board">
"""

		columns = [
			("backlog", "📋 Backlog"),
			("todo", "📝 To Do"),
			("in_progress", "⚡ In Progress"),
			("review", "👀 Review"),
			("done", "✅ Done")
		]

		for status, title in columns:
			html += f'		<div class="column">\n			<h2>{title}</h2>\n'

			for priority in ["critical", "high", "medium", "low"]:
				if kanban[status][priority]:
					priority_emoji = {"critical": "🔥", "high": "⚠️", "medium": "📊", "low": "📝"}
					html += f'			<div class="priority-section">\n'
					html += f'				<div class="priority-header">{priority_emoji.get(priority, "📝")} {priority.title()} Priority</div>\n'

					for issue in kanban[status][priority]:
						html += f'				<div class="issue-card {priority}">\n'
						html += f'					<div class="issue-title">#{issue["number"]} {issue["title"]}</div>\n'
						html += f'					<div class="issue-meta">\n'
						html += f'						Epic: {issue["epic"]} | Hours: {issue["estimated_hours"]} | {issue["assignee"]}\n'
						html += f'					</div>\n'
						html += f'				</div>\n'

					html += f'			</div>\n'

			html += '		</div>\n'

		html += """	</div>
</body>
</html>"""

		return html

	def generate_kanban_markdown(self, kanban: Dict):
		"""Generate markdown summary of kanban board"""

		kanban_md_path = os.path.join(self.kanban_dir, "kanban_summary.md")

		with open(kanban_md_path, 'w', encoding='utf-8') as f:
			f.write("# 🎮 Dragon Quest III ROM Analysis - Kanban Summary\n\n")
			f.write(f"**Generated:** {datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')}\n\n")
			f.write(f"**Total Issues:** {len(self.issues)}\n")
			f.write(f"**Total Estimated Hours:** {sum(issue['estimated_hours'] for issue in self.issues)}\n\n")

			# Epic summary
			epics = {}
			for issue in self.issues:
				epic = issue['epic']
				if epic not in epics:
					epics[epic] = {"count": 0, "hours": 0}
				epics[epic]["count"] += 1
				epics[epic]["hours"] += issue['estimated_hours']

			f.write("## 🏗️ Epics Summary\n\n")
			for epic, data in sorted(epics.items()):
				f.write(f"- **{epic}:** {data['count']} issues, {data['hours']} hours\n")
			f.write("\n")

			# Status breakdown
			f.write("## 📊 Status Breakdown\n\n")
			for status in ["backlog", "todo", "in_progress", "review", "done"]:
				total_in_status = sum(len(kanban[status][priority]) for priority in kanban[status])
				f.write(f"- **{status.replace('_', ' ').title()}:** {total_in_status} issues\n")
			f.write("\n")

			# Priority breakdown
			priority_counts = {"critical": 0, "high": 0, "medium": 0, "low": 0}
			for issue in self.issues:
				priority_counts[issue['priority']] += 1

			f.write("## 🎯 Priority Breakdown\n\n")
			for priority, count in priority_counts.items():
				emoji = {"critical": "🔥", "high": "⚠️", "medium": "📊", "low": "📝"}
				f.write(f"- **{emoji[priority]} {priority.title()}:** {count} issues\n")

	def generate_issues_report(self):
		"""Generate comprehensive issues report"""

		print("📈 Generating comprehensive issues report...")

		report_path = os.path.join(self.reports_dir, "github_issues_report.md")
		json_path = os.path.join(self.reports_dir, "github_issues_report.json")

		# Calculate statistics
		stats = self.calculate_issue_statistics()

		# Generate markdown report
		with open(report_path, 'w', encoding='utf-8') as f:
			f.write("# 🎯 GitHub Issues Generation Report\n\n")
			f.write(f"**Generated:** {datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')}\n\n")

			f.write("## 📊 Summary Statistics\n\n")
			f.write(f"- **Total Issues Created:** {stats['total_issues']}\n")
			f.write(f"- **Total Estimated Hours:** {stats['total_hours']}\n")
			f.write(f"- **Average Hours per Issue:** {stats['avg_hours']:.1f}\n")
			f.write(f"- **Number of Epics:** {stats['epic_count']}\n")
			f.write(f"- **Number of Milestones:** {stats['milestone_count']}\n\n")

			f.write("## 🏗️ Epic Distribution\n\n")
			for epic, data in sorted(stats['epics'].items()):
				f.write(f"- **{epic}:** {data['count']} issues ({data['percentage']:.1f}%), {data['hours']} hours\n")
			f.write("\n")

			f.write("## 📅 Milestone Distribution\n\n")
			for milestone, data in sorted(stats['milestones'].items()):
				f.write(f"- **{milestone}:** {data['count']} issues, {data['hours']} hours\n")
			f.write("\n")

			f.write("## 🎯 Priority Distribution\n\n")
			for priority, data in sorted(stats['priorities'].items()):
				emoji = {"critical": "🔥", "high": "⚠️", "medium": "📊", "low": "📝"}
				f.write(f"- **{emoji.get(priority, '📝')} {priority.title()}:** {data['count']} issues ({data['percentage']:.1f}%)\n")
			f.write("\n")

			f.write("## 🔧 Complexity Distribution\n\n")
			for complexity, count in sorted(stats['complexity'].items()):
				percentage = (count / stats['total_issues']) * 100
				f.write(f"- **{complexity}:** {count} issues ({percentage:.1f}%)\n")
			f.write("\n")

			f.write("## 📋 All Issues\n\n")
			for issue in sorted(self.issues, key=lambda x: x['number']):
				f.write(f"### #{issue['number']} {issue['title']}\n")
				f.write(f"- **Epic:** {issue['epic']}\n")
				f.write(f"- **Priority:** {issue['priority']}\n")
				f.write(f"- **Milestone:** {issue['milestone']}\n")
				f.write(f"- **Hours:** {issue['estimated_hours']}\n")
				f.write(f"- **Labels:** {', '.join(issue['labels'])}\n\n")

		# Generate JSON report
		report_data = {
			"metadata": {
				"generated_at": datetime.datetime.now().isoformat(),
				"tool_version": "1.0.0",
				"total_issues": len(self.issues)
			},
			"statistics": stats,
			"issues": self.issues
		}

		with open(json_path, 'w', encoding='utf-8') as f:
			json.dump(report_data, f, indent=2, default=str)

	def calculate_issue_statistics(self) -> Dict[str, Any]:
		"""Calculate comprehensive statistics about generated issues"""

		stats = {
			"total_issues": len(self.issues),
			"total_hours": sum(issue['estimated_hours'] for issue in self.issues),
			"avg_hours": sum(issue['estimated_hours'] for issue in self.issues) / len(self.issues) if self.issues else 0,
			"epics": {},
			"milestones": {},
			"priorities": {},
			"complexity": {}
		}

		# Epic statistics
		for issue in self.issues:
			epic = issue['epic']
			if epic not in stats['epics']:
				stats['epics'][epic] = {"count": 0, "hours": 0}
			stats['epics'][epic]["count"] += 1
			stats['epics'][epic]["hours"] += issue['estimated_hours']

		# Add percentages to epics
		for epic in stats['epics']:
			stats['epics'][epic]["percentage"] = (stats['epics'][epic]["count"] / stats['total_issues']) * 100

		# Milestone statistics
		for issue in self.issues:
			milestone = issue['milestone']
			if milestone not in stats['milestones']:
				stats['milestones'][milestone] = {"count": 0, "hours": 0}
			stats['milestones'][milestone]["count"] += 1
			stats['milestones'][milestone]["hours"] += issue['estimated_hours']

		# Priority statistics
		for issue in self.issues:
			priority = issue['priority']
			if priority not in stats['priorities']:
				stats['priorities'][priority] = {"count": 0}
			stats['priorities'][priority]["count"] += 1

		# Add percentages to priorities
		for priority in stats['priorities']:
			stats['priorities'][priority]["percentage"] = (stats['priorities'][priority]["count"] / stats['total_issues']) * 100

		# Complexity statistics
		for issue in self.issues:
			complexity = issue['technical_complexity']
			stats['complexity'][complexity] = stats['complexity'].get(complexity, 0) + 1

		stats['epic_count'] = len(stats['epics'])
		stats['milestone_count'] = len(stats['milestones'])

		return stats

def main():
	"""Main execution function"""
	print("🎯 Starting GitHub Issues Generation for Dragon Quest III ROM Analysis")
	print("=" * 80)

	project_root = os.getcwd()
	generator = GitHubIssueGenerator(project_root)

	# Generate comprehensive issues
	issue_count = generator.create_comprehensive_issues()

	print("\n" + "=" * 80)
	print("✅ GitHub Issues Generation Complete!")
	print(f"📊 Generated {issue_count} comprehensive issues")
	print(f"⏱️	Total estimated effort: {sum(issue['estimated_hours'] for issue in generator.issues)} hours")
	print(f"📁 Issues saved to: {generator.issues_dir}")
	print(f"📋 Kanban board: {generator.kanban_dir}/project_kanban.html")
	print(f"📈 Reports saved to: {generator.reports_dir}")

if __name__ == "__main__":
	main()
