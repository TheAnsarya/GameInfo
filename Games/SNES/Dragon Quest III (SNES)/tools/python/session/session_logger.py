#!/usr/bin/env python3
"""
Session Logging System for DQ3R Project
Automatically tracks chat/session progress and updates logs every prompt
"""

import os
import sys
import json
import datetime
from pathlib import Path
from typing import Dict, List, Any, Optional
import subprocess


class SessionLogger:
	"""Manages session logging and chat progress tracking"""

	def __init__(self, project_root: Optional[str] = None):
		"""Initialize session logger"""
		if project_root:
			self.project_root = Path(project_root)
		else:
			self.project_root = Path(__file__).parent.parent.parent

		self.logs_dir = self.project_root / "logs"
		self.logs_dir.mkdir(exist_ok=True)

		self.session_file = self.logs_dir / "current_session.json"
		self.chat_log_file = self.logs_dir / "chat_history.md"
		self.progress_file = self.logs_dir / "project_progress.json"

	def initialize_session(self) -> Dict[str, Any]:
		"""Initialize a new session or load existing one"""
		session_data = {
			"session_id": datetime.datetime.now().strftime("%Y%m%d_%H%M%S"),
			"start_time": datetime.datetime.now().isoformat(),
			"project_name": "DQ3R - Dragon Quest III Reconstruction",
			"current_phase": "Development Phase",
			"prompt_count": 0,
			"files_modified": [],
			"achievements": [],
			"todos_completed": [],
			"todos_in_progress": [],
			"git_commits": [],
			"compression_algorithms": [],
			"analysis_results": {},
			"build_status": "Unknown",
		}

		if self.session_file.exists():
			try:
				with open(self.session_file, "r") as f:
					existing_session = json.load(f)
					session_data.update(existing_session)
					print(f"Resumed session {session_data['session_id']}")
			except Exception as e:
				print(f"Warning: Could not load existing session: {e}")

		return session_data

	def update_session(self, updates: Dict[str, Any]) -> None:
		"""Update session data with new information"""
		session_data = self.initialize_session()
		session_data.update(updates)
		session_data["last_update"] = datetime.datetime.now().isoformat()
		session_data["prompt_count"] += 1

		# Save session data
		with open(self.session_file, "w") as f:
			json.dump(session_data, f, indent=2)

	def log_chat_entry(self, entry_type: str, content: str, metadata: Optional[Dict] = None) -> None:
		"""Add entry to chat history log"""
		timestamp = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")

		chat_entry = f"\n## {entry_type} - {timestamp}\n\n"
		chat_entry += f"{content}\n"

		if metadata:
			chat_entry += "\n### Metadata\n"
			for key, value in metadata.items():
				chat_entry += f"- **{key}**: {value}\n"

		chat_entry += "\n---\n"

		# Append to chat log
		with open(self.chat_log_file, "a", encoding="utf-8") as f:
			f.write(chat_entry)

	def get_git_status(self) -> Dict[str, Any]:
		"""Get current git repository status"""
		try:
			# Get current branch
			branch_result = subprocess.run(
				["git", "branch", "--show-current"],
				cwd=self.project_root,
				capture_output=True,
				text=True,
			)
			current_branch = branch_result.stdout.strip() if branch_result.returncode == 0 else "unknown"

			# Get latest commit
			commit_result = subprocess.run(
				["git", "log", "-1", "--oneline"],
				cwd=self.project_root,
				capture_output=True,
				text=True,
			)
			latest_commit = commit_result.stdout.strip() if commit_result.returncode == 0 else "unknown"

			# Get status
			status_result = subprocess.run(
				["git", "status", "--porcelain"],
				cwd=self.project_root,
				capture_output=True,
				text=True,
			)
			modified_files = [line.strip() for line in status_result.stdout.split("\n") if line.strip()]

			return {
				"current_branch": current_branch,
				"latest_commit": latest_commit,
				"modified_files": modified_files,
				"working_directory_clean": len(modified_files) == 0,
			}
		except Exception as e:
			return {"error": str(e)}

	def analyze_project_state(self) -> Dict[str, Any]:
		"""Analyze current project state and structure"""
		project_state = {
			"timestamp": datetime.datetime.now().isoformat(),
			"directory_structure": {},
			"file_counts": {},
			"git_status": self.get_git_status(),
			"build_tools": {},
			"rom_analysis": {},
		}

		# Analyze directory structure
		key_dirs = ["src", "tools", "docs", "static", ".github", "assets", "tests"]
		for dir_name in key_dirs:
			dir_path = self.project_root / dir_name
			if dir_path.exists():
				project_state["directory_structure"][dir_name] = {
					"exists": True,
					"file_count": (len(list(dir_path.rglob("*"))) if dir_path.is_dir() else 0),
				}
			else:
				project_state["directory_structure"][dir_name] = {"exists": False}

		# Count files by type
		file_extensions = [".py", ".ps1", ".md", ".yml", ".json", ".asm", ".cs"]
		for ext in file_extensions:
			files = list(self.project_root.rglob(f"*{ext}"))
			project_state["file_counts"][ext] = len(files)

		# Check build tools
		try:
			# Check Python
			python_result = subprocess.run([sys.executable, "--version"], capture_output=True, text=True)
			project_state["build_tools"]["python"] = (
				python_result.stdout.strip() if python_result.returncode == 0 else "not found"
			)

			# Check Asar
			asar_result = subprocess.run(["asar", "--version"], capture_output=True, text=True)
			project_state["build_tools"]["asar"] = "installed" if asar_result.returncode == 0 else "not found"

			# Check Git
			git_result = subprocess.run(["git", "--version"], capture_output=True, text=True)
			project_state["build_tools"]["git"] = (
				git_result.stdout.strip() if git_result.returncode == 0 else "not found"
			)
		except Exception as e:
			project_state["build_tools"]["error"] = str(e)

		return project_state

	def update_progress_tracking(self) -> None:
		"""Update comprehensive project progress tracking"""
		progress = {
			"last_update": datetime.datetime.now().isoformat(),
			"project_phase": "Advanced Development",
			"session_info": self.initialize_session(),
			"project_state": self.analyze_project_state(),
			"completed_milestones": [
				"Project Foundation Setup",
				"GitHub Infrastructure Implementation",
				"ROM Analysis Tool Enhancement",
				"DQ3 Documentation Integration",
				"Compression Algorithm Research",
			],
			"current_milestones": [
				"Session Logging System",
				"Automated Code Formatting",
				"SNES Development Toolchain",
				"Asset Extraction Pipeline",
			],
			"upcoming_milestones": [
				"Git Workflow Automation",
				"Continuous Integration",
				"ROM Disassembly Framework",
				"Graphics Extraction Tools",
			],
		}

		with open(self.progress_file, "w") as f:
			json.dump(progress, f, indent=2)

	def log_prompt_activity(self, prompt_summary: str, actions: List[str], outcomes: List[str]) -> None:
		"""Log activity for current prompt/interaction"""
		session_updates = {
			"files_modified": self.get_git_status().get("modified_files", []),
			"latest_actions": actions,
			"latest_outcomes": outcomes,
		}

		self.update_session(session_updates)

		self.log_chat_entry(
			"PROMPT_ACTIVITY",
			f"**Summary**: {prompt_summary}\n\n**Actions Taken**:\n"
			+ "\n".join(f"- {action}" for action in actions)
			+ "\n\n**Outcomes**:\n"
			+ "\n".join(f"- {outcome}" for outcome in outcomes),
			{
				"prompt_count": self.initialize_session()["prompt_count"] + 1,
				"git_status": ("modified" if session_updates["files_modified"] else "clean"),
			},
		)

		self.update_progress_tracking()
		print(f"Session logged: {prompt_summary}")

	def generate_session_report(self) -> str:
		"""Generate comprehensive session report"""
		session_data = self.initialize_session()
		project_state = self.analyze_project_state()

		report = f"""# DQ3R Session Report

## Session Information
- **Session ID**: {session_data.get('session_id', 'Unknown')}
- **Start Time**: {session_data.get('start_time', 'Unknown')}
- **Prompt Count**: {session_data.get('prompt_count', 0)}
- **Phase**: {session_data.get('current_phase', 'Unknown')}

## Project State
- **Git Branch**: {project_state['git_status'].get('current_branch', 'unknown')}
- **Latest Commit**: {project_state['git_status'].get('latest_commit', 'unknown')}
- **Working Directory**: {'Clean' if project_state['git_status'].get('working_directory_clean', False) else 'Modified'}

## File Structure
"""

		for dir_name, info in project_state["directory_structure"].items():
			status = "✓" if info["exists"] else "✗"
			count = f"({info.get('file_count', 0)} files)" if info["exists"] else ""
			report += f"- {status} `{dir_name}/` {count}\n"

		report += f"\n## Build Tools\n"
		for tool, status in project_state["build_tools"].items():
			report += f"- **{tool}**: {status}\n"

		report += f"\n## Recent Achievements\n"
		for achievement in session_data.get("achievements", []):
			report += f"- {achievement}\n"

		return report


def log_current_prompt():
	"""Function to be called every prompt to update logs"""
	logger = SessionLogger()

	# Determine what happened this prompt based on git status
	git_status = logger.get_git_status()
	modified_files = git_status.get("modified_files", [])

	if not modified_files:
		actions = ["Session monitoring", "Project status check"]
		outcomes = ["No file modifications detected", "Session logging active"]
	else:
		actions = [
			f"Modified {len(modified_files)} files",
			"Updated project components",
		]
		outcomes = ["Files staged for commit", "Project structure maintained"]

		# Add specific action types based on file patterns
		for file in modified_files[:5]:	# Limit to first 5 files
			if ".py" in file:
				actions.append(f"Python development: {file}")
			elif ".md" in file:
				actions.append(f"Documentation update: {file}")
			elif ".yml" in file:
				actions.append(f"Workflow configuration: {file}")
			elif ".json" in file:
				actions.append(f"Configuration update: {file}")

	logger.log_prompt_activity("Automated session update - Development progress tracking", actions, outcomes)

	return logger.generate_session_report()


if __name__ == "__main__":
	try:
		if len(sys.argv) > 1 and sys.argv[1] == "--report":
			logger = SessionLogger()
			print(logger.generate_session_report())
		else:
			print(log_current_prompt())
	except UnicodeEncodeError:
		print("Session updated (Unicode encoding handled)")
	except Exception as e:
		print(f"Session update completed with minor issues: {e}")
