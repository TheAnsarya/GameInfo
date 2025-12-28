#!/usr/bin/env python3
"""
Automated Code Formatting System for DQ3R Project
Runs formatting on all project files every prompt to maintain code quality
"""

import os
import sys
import subprocess
import json
import argparse
from pathlib import Path
from typing import List, Dict, Any, Optional
import time


class CodeFormatter:
	"""Automated code formatting and quality maintenance"""

	def __init__(self, project_root: Optional[str] = None):
		"""Initialize code formatter"""
		if project_root:
			self.project_root = Path(project_root)
		else:
			self.project_root = Path(__file__).parent.parent.parent

		self.logs_dir = self.project_root / "logs"
		self.logs_dir.mkdir(exist_ok=True)

		self.formatting_log = self.logs_dir / "formatting.log"

		# Formatting configurations
		self.formatters = {
			".py": self._format_python,
			".ps1": self._format_powershell,
			".md": self._format_markdown,
			".json": self._format_json,
			".yml": self._format_yaml,
			".yaml": self._format_yaml,
		}

		self.excluded_paths = [
			".git",
			"node_modules",
			"__pycache__",
			".pytest_cache",
			"venv",
			"env",
			".vscode",
			"logs",	# Don't format our own logs
		]

	def _log_action(self, message: str) -> None:
		"""Log formatting actions"""
		timestamp = time.strftime("%Y-%m-%d %H:%M:%S")
		log_entry = f"[{timestamp}] {message}\n"

		with open(self.formatting_log, "a", encoding="utf-8") as f:
			f.write(log_entry)

		print(message)

	def _should_exclude_path(self, path: Path) -> bool:
		"""Check if path should be excluded from formatting"""
		path_str = str(path)
		return any(excluded in path_str for excluded in self.excluded_paths)

	def _format_python(self, file_path: Path) -> Dict[str, Any]:
		"""Format Python files using black and check with flake8"""
		result = {
			"file": str(file_path),
			"formatter": "python",
			"success": True,
			"actions": [],
			"errors": [],
		}

		try:
			# Format with black if available
			black_result = subprocess.run(
				[sys.executable, "-m", "black", "--line-length", "88", str(file_path)],
				capture_output=True,
				text=True,
				timeout=30,
			)

			if black_result.returncode == 0:
				result["actions"].append("Formatted with black")
			else:
				result["errors"].append(f"Black formatting failed: {black_result.stderr}")

		except subprocess.TimeoutExpired:
			result["errors"].append("Black formatting timed out")
		except FileNotFoundError:
			# Black not installed, use basic formatting
			try:
				self._basic_python_format(file_path)
				result["actions"].append("Applied basic Python formatting")
			except Exception as e:
				result["errors"].append(f"Basic formatting failed: {e}")
		except Exception as e:
			result["errors"].append(f"Python formatting error: {e}")

		# Check with flake8 if available
		try:
			flake8_result = subprocess.run(
				[
					sys.executable,
					"-m",
					"flake8",
					"--max-line-length=88",
					"--extend-ignore=E203,W503",
					str(file_path),
				],
				capture_output=True,
				text=True,
				timeout=30,
			)

			if flake8_result.returncode == 0:
				result["actions"].append("Passed flake8 checks")
			else:
				result["errors"].append(f"Flake8 issues found: {flake8_result.stdout}")

		except (FileNotFoundError, subprocess.TimeoutExpired):
			pass	# flake8 not available or timed out
		except Exception as e:
			result["errors"].append(f"Flake8 error: {e}")

		result["success"] = len(result["errors"]) == 0
		return result

	def _basic_python_format(self, file_path: Path) -> None:
		"""Basic Python formatting when black is not available"""
		try:
			with open(file_path, "r", encoding="utf-8") as f:
				content = f.read()

			# Basic formatting fixes
			lines = content.split("\n")
			formatted_lines = []

			for line in lines:
				# Remove trailing whitespace
				line = line.rstrip()

				# Ensure proper spacing around operators (basic)
				if "=" in line and not any(op in line for op in ["==", "!=", "<=", ">="]):
					parts = line.split("=", 1)
					if len(parts) == 2:
						left = parts[0].rstrip()
						right = parts[1].lstrip()
						line = f"{left} = {right}"

				formatted_lines.append(line)

			# Ensure file ends with newline
			if formatted_lines and formatted_lines[-1]:
				formatted_lines.append("")

			formatted_content = "\n".join(formatted_lines)

			with open(file_path, "w", encoding="utf-8") as f:
				f.write(formatted_content)

		except Exception as e:
			raise Exception(f"Basic Python formatting failed: {e}")

	def _format_powershell(self, file_path: Path) -> Dict[str, Any]:
		"""Format PowerShell files"""
		result = {
			"file": str(file_path),
			"formatter": "powershell",
			"success": True,
			"actions": [],
			"errors": [],
		}

		try:
			with open(file_path, "r", encoding="utf-8") as f:
				content = f.read()

			# Basic PowerShell formatting
			lines = content.split("\n")
			formatted_lines = []

			for line in lines:
				# Remove trailing whitespace
				line = line.rstrip()
				formatted_lines.append(line)

			formatted_content = "\n".join(formatted_lines)
			if not formatted_content.endswith("\n"):
				formatted_content += "\n"

			with open(file_path, "w", encoding="utf-8") as f:
				f.write(formatted_content)

			result["actions"].append("Applied PowerShell formatting")

		except Exception as e:
			result["errors"].append(f"PowerShell formatting error: {e}")
			result["success"] = False

		return result

	def _format_markdown(self, file_path: Path) -> Dict[str, Any]:
		"""Format Markdown files"""
		result = {
			"file": str(file_path),
			"formatter": "markdown",
			"success": True,
			"actions": [],
			"errors": [],
		}

		try:
			with open(file_path, "r", encoding="utf-8") as f:
				content = f.read()

			# Basic Markdown formatting
			lines = content.split("\n")
			formatted_lines = []

			for i, line in enumerate(lines):
				# Remove trailing whitespace
				line = line.rstrip()

				# Ensure proper spacing around headers
				if line.startswith("#"):
					# Ensure space after #
					if len(line) > 1 and line[1] != " ":
						line = line[0] + " " + line[1:]

					# Ensure blank line before headers (except first line)
					if i > 0 and formatted_lines and formatted_lines[-1].strip():
						formatted_lines.append("")

				formatted_lines.append(line)

			formatted_content = "\n".join(formatted_lines)
			if not formatted_content.endswith("\n"):
				formatted_content += "\n"

			with open(file_path, "w", encoding="utf-8") as f:
				f.write(formatted_content)

			result["actions"].append("Applied Markdown formatting")

		except Exception as e:
			result["errors"].append(f"Markdown formatting error: {e}")
			result["success"] = False

		return result

	def _format_json(self, file_path: Path) -> Dict[str, Any]:
		"""Format JSON files"""
		result = {
			"file": str(file_path),
			"formatter": "json",
			"success": True,
			"actions": [],
			"errors": [],
		}

		try:
			with open(file_path, "r", encoding="utf-8") as f:
				data = json.load(f)

			with open(file_path, "w", encoding="utf-8") as f:
				json.dump(data, f, indent=2, ensure_ascii=False)
				f.write("\n")	# Ensure file ends with newline

			result["actions"].append("Formatted JSON with 2-space indentation")

		except json.JSONDecodeError as e:
			result["errors"].append(f"JSON syntax error: {e}")
			result["success"] = False
		except Exception as e:
			result["errors"].append(f"JSON formatting error: {e}")
			result["success"] = False

		return result

	def _format_yaml(self, file_path: Path) -> Dict[str, Any]:
		"""Format YAML files"""
		result = {
			"file": str(file_path),
			"formatter": "yaml",
			"success": True,
			"actions": [],
			"errors": [],
		}

		try:
			with open(file_path, "r", encoding="utf-8") as f:
				content = f.read()

			# Basic YAML formatting
			lines = content.split("\n")
			formatted_lines = []

			for line in lines:
				# Remove trailing whitespace
				line = line.rstrip()
				formatted_lines.append(line)

			formatted_content = "\n".join(formatted_lines)
			if not formatted_content.endswith("\n"):
				formatted_content += "\n"

			with open(file_path, "w", encoding="utf-8") as f:
				f.write(formatted_content)

			result["actions"].append("Applied YAML formatting")

		except Exception as e:
			result["errors"].append(f"YAML formatting error: {e}")
			result["success"] = False

		return result

	def find_files_to_format(self) -> List[Path]:
		"""Find all files that should be formatted"""
		files_to_format = []

		for pattern in self.formatters.keys():
			for file_path in self.project_root.rglob(f"*{pattern}"):
				if file_path.is_file() and not self._should_exclude_path(file_path):
					files_to_format.append(file_path)

		return sorted(files_to_format)

	def format_file(self, file_path: Path) -> Dict[str, Any]:
		"""Format a single file based on its extension"""
		extension = file_path.suffix.lower()

		if extension in self.formatters:
			formatter = self.formatters[extension]
			return formatter(file_path)
		else:
			return {
				"file": str(file_path),
				"formatter": "none",
				"success": True,
				"actions": ["No formatter available"],
				"errors": [],
			}

	def format_all_files(self, verbose: bool = False) -> Dict[str, Any]:
		"""Format all files in the project"""
		start_time = time.time()
		files_to_format = self.find_files_to_format()

		results = {
			"timestamp": time.strftime("%Y-%m-%d %H:%M:%S"),
			"total_files": len(files_to_format),
			"files_processed": 0,
			"files_successful": 0,
			"files_with_errors": 0,
			"total_time": 0,
			"file_results": [],
		}

		self._log_action(f"Starting automated formatting of {len(files_to_format)} files...")

		for file_path in files_to_format:
			try:
				if verbose:
					print(f"Formatting: {file_path}")

				file_result = self.format_file(file_path)
				results["file_results"].append(file_result)
				results["files_processed"] += 1

				if file_result["success"]:
					results["files_successful"] += 1
				else:
					results["files_with_errors"] += 1

			except Exception as e:
				error_result = {
					"file": str(file_path),
					"formatter": "error",
					"success": False,
					"actions": [],
					"errors": [f"Unexpected error: {e}"],
				}
				results["file_results"].append(error_result)
				results["files_with_errors"] += 1

		results["total_time"] = time.time() - start_time

		# Log summary
		self._log_action(
			f"Formatting complete: {results['files_successful']} successful, "
			f"{results['files_with_errors']} errors, "
			f"{results['total_time']:.2f}s"
		)

		return results

	def check_editorconfig_compliance(self) -> Dict[str, Any]:
		"""Check if files comply with .editorconfig settings"""
		editorconfig_path = self.project_root / ".editorconfig"

		compliance_result = {
			"editorconfig_exists": editorconfig_path.exists(),
			"compliance_check": "basic",
			"violations": [],
			"summary": {},
		}

		if not editorconfig_path.exists():
			return compliance_result

		# Basic compliance checks
		files_to_check = self.find_files_to_format()
		violations = []

		for file_path in files_to_check:
			try:
				with open(file_path, "r", encoding="utf-8") as f:
					content = f.read()

				# Check for tabs vs spaces (assuming spaces preferred)
				if "\t" in content and file_path.suffix in [
					".py",
					".json",
					".yml",
					".yaml",
				]:
					violations.append(
						{
							"file": str(file_path),
							"violation": "Contains tabs instead of spaces",
						}
					)

				# Check line endings (should be LF or CRLF consistently)
				if "\r\n" in content and "\n" in content.replace("\r\n", ""):
					violations.append({"file": str(file_path), "violation": "Mixed line endings"})

				# Check file ends with newline
				if content and not content.endswith("\n"):
					violations.append(
						{
							"file": str(file_path),
							"violation": "File does not end with newline",
						}
					)

			except Exception as e:
				violations.append(
					{
						"file": str(file_path),
						"violation": f"Could not check compliance: {e}",
					}
				)

		compliance_result["violations"] = violations
		compliance_result["summary"] = {
			"total_files_checked": len(files_to_check),
			"files_with_violations": len([v for v in violations if v.get("file")]),
			"compliance_rate": (
				f"{((len(files_to_check) - len(violations)) / len(files_to_check) * 100):.1f}%"
				if files_to_check
				else "100%"
			),
		}

		return compliance_result


def run_automated_formatting():
	"""Main function to run automated formatting every prompt"""
	formatter = CodeFormatter()

	# Run formatting
	results = formatter.format_all_files()

	# Check EditorConfig compliance
	compliance = formatter.check_editorconfig_compliance()

	# Create summary report
	summary = f"""
# Automated Formatting Report

## Summary
- **Files Processed**: {results['files_processed']}
- **Successfully Formatted**: {results['files_successful']}
- **Files with Errors**: {results['files_with_errors']}
- **Processing Time**: {results['total_time']:.2f} seconds

## EditorConfig Compliance
- **Compliance Rate**: {compliance['summary'].get('compliance_rate', 'Unknown')}
- **Files Checked**: {compliance['summary'].get('total_files_checked', 0)}
- **Violations Found**: {len(compliance.get('violations', []))}

## Actions Taken
"""

	# Add file-specific actions
	action_counts = {}
	for file_result in results["file_results"]:
		for action in file_result["actions"]:
			action_counts[action] = action_counts.get(action, 0) + 1

	for action, count in action_counts.items():
		summary += f"- {action}: {count} files\n"

	if results["files_with_errors"] > 0:
		summary += f"\n## Errors Encountered\n"
		error_files = [fr for fr in results["file_results"] if not fr["success"]]
		for file_result in error_files[:5]:	# Show first 5 errors
			summary += f"- {file_result['file']}: {', '.join(file_result['errors'])}\n"

	return summary


if __name__ == "__main__":
	parser = argparse.ArgumentParser(description="Automated code formatting for DQ3R project")
	parser.add_argument("--verbose", "-v", action="store_true", help="Verbose output")
	parser.add_argument("--check-only", action="store_true", help="Check compliance only, don't format")

	args = parser.parse_args()

	formatter = CodeFormatter()

	if args.check_only:
		compliance = formatter.check_editorconfig_compliance()
		print(f"EditorConfig compliance: {compliance['summary'].get('compliance_rate', 'Unknown')}")
		if compliance["violations"]:
			print("Violations found:")
			for violation in compliance["violations"][:10]:	# Show first 10
				print(f"	{violation['file']}: {violation['violation']}")
	else:
		print(run_automated_formatting())
