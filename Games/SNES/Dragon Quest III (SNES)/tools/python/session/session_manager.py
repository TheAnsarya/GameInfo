#!/usr/bin/env python3
"""
Dragon Quest III Disassembly Project - Session Management System
================================================================

Comprehensive session tracking, logging, and workflow management for
the DQ3 disassembly project with GitHub integration.
"""

import json
import os
import time
import subprocess
from datetime import datetime
from pathlib import Path
from typing import Dict, List, Any, Optional
from dataclasses import dataclass, asdict


@dataclass
class GitHubIssue:
	"""Represents a GitHub issue for tracking work"""

	title: str
	body: str
	labels: List[str]
	milestone: Optional[str] = None
	assignees: List[str] = None
	project_column: str = "To Do"
	branch_name: str = ""
	issue_number: Optional[int] = None


@dataclass
class SessionEntry:
	"""Single session log entry"""

	timestamp: str
	action: str
	description: str
	files_changed: List[str]
	branch: str
	commit_hash: Optional[str] = None
	issue_references: List[int] = None


class DQ3SessionManager:
	"""Manages session logging, GitHub issues, and workflow automation"""

	def __init__(self, repo_path: str):
		self.repo_path = Path(repo_path)
		self.session_dir = self.repo_path / "logs" / "sessions"
		self.issue_dir = self.repo_path / "logs" / "issues"
		self.session_dir.mkdir(parents=True, exist_ok=True)
		self.issue_dir.mkdir(parents=True, exist_ok=True)

		# Current session tracking
		self.current_session_file = self.session_dir / f"session_{datetime.now().strftime('%Y%m%d_%H%M%S')}.json"
		self.session_entries: List[SessionEntry] = []

		# Issue tracking
		self.pending_issues: List[GitHubIssue] = []
		self.created_issues: Dict[str, int] = {}	# title -> issue_number

		print(f"📋 Session Manager initialized")
		print(f"	 Session log: {self.current_session_file}")
		print(f"	 Repository: {self.repo_path}")

	def log_action(self, action: str, description: str, files_changed: List[str] = None):
		"""Log a session action"""
		if files_changed is None:
			files_changed = []

		# Get current branch
		try:
			result = subprocess.run(
				["git", "branch", "--show-current"], capture_output=True, text=True, cwd=self.repo_path
			)
			current_branch = result.stdout.strip() if result.returncode == 0 else "unknown"
		except:
			current_branch = "unknown"

		entry = SessionEntry(
			timestamp=datetime.now().isoformat(),
			action=action,
			description=description,
			files_changed=files_changed,
			branch=current_branch,
		)

		self.session_entries.append(entry)
		self._save_session()

		print(f"📝 Logged: {action} - {description}")
		if files_changed:
			print(f"	 Files: {', '.join(files_changed)}")

	def create_disassembly_issues(self):
		"""Create comprehensive GitHub issues for disassembly work"""

		# Core disassembly issues
		core_issues = [
			GitHubIssue(
				title="🔧 Complete ROM Header Analysis",
				body="""## Objective
Perform comprehensive analysis of Dragon Quest III ROM header and system initialization.

## Tasks
- [ ] Parse SNES header data (title, region, ROM size)
- [ ] Analyze interrupt vectors (NMI, IRQ, BRK, COP)
- [ ] Document reset sequence and initialization code
- [ ] Map system memory layout
- [ ] Identify ROM type (LoROM/HiROM) and banking

## Acceptance Criteria
- Complete header documentation in markdown
- Assembly listing of initialization code
- Memory map with all system regions documented
- Banking analysis with bank content classification

## Files to Create/Modify
- `analysis/rom_header_analysis.md`
- `disassembly/system_init.asm`
- `documentation/memory_layout.md`
""",
				labels=["disassembly", "analysis", "high-priority", "system"],
				project_column="To Do",
			),
			GitHubIssue(
				title="🎮 Main Game Loop Disassembly",
				body="""## Objective
Disassemble and document the main game loop and core engine systems.

## Tasks
- [ ] Locate main game loop entry point
- [ ] Disassemble frame processing logic
- [ ] Document input handling system
- [ ] Analyze state machine transitions
- [ ] Map VBlank and timing critical code

## Acceptance Criteria
- Complete disassembly of main loop
- Flow chart of game states
- Input system documentation
- Timing analysis and performance notes

## Files to Create/Modify
- `disassembly/main_loop.asm`
- `analysis/game_states.md`
- `documentation/input_system.md`
""",
				labels=["disassembly", "core-engine", "high-priority"],
				project_column="To Do",
			),
			GitHubIssue(
				title="🖼️ Graphics Engine Complete Analysis",
				body="""## Objective
Full disassembly and documentation of the graphics rendering system.

## Tasks
- [ ] Disassemble PPU management code
- [ ] Document sprite system (OAM, DMA)
- [ ] Analyze tile/map rendering
- [ ] Map palette management
- [ ] Document graphics compression formats

## Acceptance Criteria
- Complete graphics engine disassembly
- PPU register usage documentation
- Sprite system technical manual
- Graphics format specifications

## Files to Create/Modify
- `disassembly/graphics_engine.asm`
- `documentation/ppu_system.md`
- `documentation/sprite_formats.md`
""",
				labels=["disassembly", "graphics", "medium-priority"],
				project_column="To Do",
			),
			GitHubIssue(
				title="🎵 Audio System Disassembly",
				body="""## Objective
Complete disassembly of the SPC-700 audio system and music engine.

## Tasks
- [ ] Disassemble SPC-700 driver code
- [ ] Document music format and sequencing
- [ ] Analyze sound effect system
- [ ] Map audio sample data
- [ ] Create audio extraction tools

## Acceptance Criteria
- SPC-700 driver fully disassembled
- Music format specification
- Sound effect trigger documentation
- Audio sample extraction working

## Files to Create/Modify
- `disassembly/audio_driver.asm`
- `documentation/music_format.md`
- `tools/audio/extract_samples.py`
""",
				labels=["disassembly", "audio", "medium-priority"],
				project_column="To Do",
			),
			GitHubIssue(
				title="⚔️ Battle System Analysis",
				body="""## Objective
Comprehensive disassembly of the battle system and combat mechanics.

## Tasks
- [ ] Disassemble battle initialization
- [ ] Document combat calculations (damage, hit rate)
- [ ] Analyze spell system implementation
- [ ] Map monster AI behavior
- [ ] Document status effect system

## Acceptance Criteria
- Battle system completely disassembled
- Combat formula documentation
- AI behavior analysis
- Status effect technical specs

## Files to Create/Modify
- `disassembly/battle_system.asm`
- `analysis/combat_formulas.md`
- `documentation/monster_ai.md`
""",
				labels=["disassembly", "gameplay", "high-priority"],
				project_column="To Do",
			),
			GitHubIssue(
				title="🏪 Menu and UI System",
				body="""## Objective
Disassemble menu systems, inventory, and user interface code.

## Tasks
- [ ] Disassemble menu rendering system
- [ ] Document inventory management
- [ ] Analyze text rendering engine
- [ ] Map dialog system
- [ ] Document save/load system

## Acceptance Criteria
- Complete UI system disassembly
- Menu flow documentation
- Text rendering specifications
- Save format documentation

## Files to Create/Modify
- `disassembly/menu_system.asm`
- `documentation/ui_system.md`
- `documentation/save_format.md`
""",
				labels=["disassembly", "ui", "medium-priority"],
				project_column="To Do",
			),
			GitHubIssue(
				title="🗺️ Map and Field System",
				body="""## Objective
Disassemble overworld map system and field exploration code.

## Tasks
- [ ] Disassemble map rendering engine
- [ ] Document tile system and compression
- [ ] Analyze collision detection
- [ ] Map NPC behavior system
- [ ] Document area transition system

## Acceptance Criteria
- Map system fully disassembled
- Tile format specifications
- Collision system documentation
- NPC behavior analysis

## Files to Create/Modify
- `disassembly/map_system.asm`
- `documentation/map_format.md`
- `analysis/collision_system.md`
""",
				labels=["disassembly", "gameplay", "medium-priority"],
				project_column="To Do",
			),
			GitHubIssue(
				title="📊 Data Tables Complete Documentation",
				body="""## Objective
Document all game data tables with complete structure analysis.

## Tasks
- [ ] Document item database structure
- [ ] Analyze spell data tables
- [ ] Map monster statistics
- [ ] Document class progression tables
- [ ] Create data extraction tools

## Acceptance Criteria
- All data tables documented
- C header files for structures
- Data extraction tools working
- Complete data specifications

## Files to Create/Modify
- `documentation/data_structures.h`
- `analysis/item_database.md`
- `tools/data/extract_tables.py`
""",
				labels=["documentation", "data-analysis", "high-priority"],
				project_column="To Do",
			),
			GitHubIssue(
				title="🔧 Advanced Analysis Tools",
				body="""## Objective
Create advanced tools for automated disassembly and analysis.

## Tasks
- [ ] Build cross-reference analyzer
- [ ] Create function call graph generator
- [ ] Implement code coverage tracking
- [ ] Build automated documentation generator
- [ ] Create ROM comparison tools

## Acceptance Criteria
- Cross-reference system working
- Call graphs generated automatically
- Coverage tracking implemented
- Documentation auto-generation working

## Files to Create/Modify
- `tools/analysis/cross_reference.py`
- `tools/analysis/call_graph.py`
- `tools/analysis/coverage_tracker.py`
""",
				labels=["tooling", "automation", "medium-priority"],
				project_column="To Do",
			),
			GitHubIssue(
				title="📚 Master Documentation System",
				body="""## Objective
Create comprehensive documentation system with all findings.

## Tasks
- [ ] Build master documentation index
- [ ] Create technical reference manual
- [ ] Generate API documentation
- [ ] Build interactive documentation site
- [ ] Create PDF export system

## Acceptance Criteria
- Master documentation complete
- Technical manual generated
- Interactive documentation working
- PDF export functional

## Files to Create/Modify
- `docs/master_index.md`
- `docs/technical_manual.md`
- `tools/docs/generate_site.py`
""",
				labels=["documentation", "presentation", "low-priority"],
				project_column="To Do",
			),
		]

		self.pending_issues.extend(core_issues)
		print(f"📋 Created {len(core_issues)} disassembly issues")

	def format_all_files(self):
		"""Run formatting on all Python files"""
		python_files = list(self.repo_path.rglob("*.py"))

		formatted_files = []
		for file_path in python_files:
			try:
				# Simple formatting - ensure proper indentation
				with open(file_path, "r", encoding="utf-8") as f:
					content = f.read()

				# Basic formatting fixes
				lines = content.split("\n")
				formatted_lines = []

				for line in lines:
					# Convert spaces to tabs for consistency
					if line.strip():
						# Count leading spaces
						leading_spaces = len(line) - len(line.lstrip())
						if leading_spaces > 0:
							# Convert 4 spaces to 1 tab, etc.
							tabs = "\t" * (leading_spaces // 4)
							remainder_spaces = " " * (leading_spaces % 4)
							formatted_line = tabs + remainder_spaces + line.lstrip()
						else:
							formatted_line = line
					else:
						formatted_line = ""

					formatted_lines.append(formatted_line)

				formatted_content = "\n".join(formatted_lines)

				if content != formatted_content:
					with open(file_path, "w", encoding="utf-8") as f:
						f.write(formatted_content)
					formatted_files.append(str(file_path.relative_to(self.repo_path)))

			except Exception as e:
				print(f"⚠️	Error formatting {file_path}: {e}")

		if formatted_files:
			self.log_action("format", f"Formatted {len(formatted_files)} Python files", formatted_files)

		return formatted_files

	def create_branch_for_issue(self, issue: GitHubIssue) -> str:
		"""Create a new branch for an issue"""
		# Generate branch name from title
		branch_name = issue.title.lower()
		branch_name = "".join(c for c in branch_name if c.isalnum() or c in "-_")
		branch_name = branch_name.replace(" ", "-")
		branch_name = f"feature/{branch_name}"

		try:
			# Create and checkout new branch
			subprocess.run(["git", "checkout", "-b", branch_name], cwd=self.repo_path, check=True)

			issue.branch_name = branch_name
			self.log_action("branch_create", f"Created branch {branch_name} for issue: {issue.title}")
			return branch_name

		except subprocess.CalledProcessError as e:
			print(f"❌ Error creating branch: {e}")
			return ""

	def commit_and_push(self, message: str, files: List[str] = None):
		"""Commit changes and push to repository"""
		try:
			# Add files
			if files:
				for file in files:
					subprocess.run(["git", "add", file], cwd=self.repo_path, check=True)
			else:
				subprocess.run(["git", "add", "."], cwd=self.repo_path, check=True)

			# Commit
			commit_result = subprocess.run(
				["git", "commit", "-m", message], capture_output=True, text=True, cwd=self.repo_path
			)

			if commit_result.returncode == 0:
				# Get commit hash
				hash_result = subprocess.run(
					["git", "rev-parse", "HEAD"], capture_output=True, text=True, cwd=self.repo_path
				)
				commit_hash = hash_result.stdout.strip()

				# Push
				subprocess.run(["git", "push", "origin", "HEAD"], cwd=self.repo_path, check=True)

				self.log_action("commit_push", message, files or [])
				print(f"✅ Committed and pushed: {commit_hash[:8]} - {message}")
				return commit_hash
			else:
				print(f"ℹ️	No changes to commit")
				return None

		except subprocess.CalledProcessError as e:
			print(f"❌ Error committing: {e}")
			return None

	def merge_and_cleanup_branch(self, branch_name: str, issue_title: str):
		"""Merge branch back to main and clean up"""
		try:
			# Switch to main
			subprocess.run(["git", "checkout", "main"], cwd=self.repo_path, check=True)

			# Merge
			subprocess.run(["git", "merge", branch_name], cwd=self.repo_path, check=True)

			# Push merged changes
			subprocess.run(["git", "push", "origin", "main"], cwd=self.repo_path, check=True)

			# Delete local branch
			subprocess.run(["git", "branch", "-d", branch_name], cwd=self.repo_path, check=True)

			# Delete remote branch
			subprocess.run(["git", "push", "origin", "--delete", branch_name], cwd=self.repo_path, check=True)

			self.log_action("merge_cleanup", f"Merged and cleaned up branch {branch_name} for: {issue_title}")
			print(f"✅ Merged and cleaned up branch: {branch_name}")

		except subprocess.CalledProcessError as e:
			print(f"❌ Error merging branch: {e}")

	def save_issue_to_file(self, issue: GitHubIssue):
		"""Save issue details to file for tracking"""
		issue_file = self.issue_dir / f"issue_{issue.title.lower().replace(' ', '_')}.json"

		with open(issue_file, "w") as f:
			json.dump(asdict(issue), f, indent="\t")

		print(f"💾 Saved issue to: {issue_file}")

	def _save_session(self):
		"""Save current session to file"""
		session_data = {
			"start_time": self.session_entries[0].timestamp if self.session_entries else datetime.now().isoformat(),
			"entries": [asdict(entry) for entry in self.session_entries],
			"total_actions": len(self.session_entries),
		}

		with open(self.current_session_file, "w") as f:
			json.dump(session_data, f, indent="\t")

	def generate_session_summary(self) -> str:
		"""Generate a summary of the current session"""
		if not self.session_entries:
			return "No actions logged in this session."

		summary = f"""
# Session Summary - {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}

**Total Actions:** {len(self.session_entries)}
**Session Duration:** {(datetime.fromisoformat(self.session_entries[-1].timestamp) - datetime.fromisoformat(self.session_entries[0].timestamp)).total_seconds():.0f} seconds

## Actions Performed:
"""

		for i, entry in enumerate(self.session_entries, 1):
			summary += f"{i}. **{entry.action}** - {entry.description}\n"
			if entry.files_changed:
				summary += f"	 Files: {', '.join(entry.files_changed)}\n"
			summary += f"	 Time: {entry.timestamp}\n\n"

		return summary


def main():
	"""Test the session manager"""
	manager = DQ3SessionManager("c:/Users/me/source/repos/dq3r-info")

	print("🚀 DQ3 Session Manager - Test Mode")
	print("=" * 50)

	# Create issues
	manager.create_disassembly_issues()

	# Save issues to files
	for issue in manager.pending_issues:
		manager.save_issue_to_file(issue)

	print(f"\n📋 Created {len(manager.pending_issues)} issues")
	print("✅ Session manager test complete!")


if __name__ == "__main__":
	main()
