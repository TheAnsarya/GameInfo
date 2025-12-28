#!/usr/bin/env python3
"""
GitHub Issues Creator
Creates actual GitHub issues from local markdown specifications
"""

import os
import re
import json
import subprocess
from typing import Dict, List, Any

class GitHubIssuesCreator:
	def __init__(self, project_root: str):
		self.project_root = project_root
		self.issues_dir = os.path.join(project_root, "project_management", "github_issues")
		self.created_issues = []

	def create_github_issues(self):
		"""Create GitHub issues from local markdown files"""

		print("🚀 Creating GitHub Issues from Local Planning...")

		# Check if GitHub CLI is available
		if not self.check_github_cli():
			print("❌ GitHub CLI not found. Please install 'gh' CLI tool.")
			print("📝 Creating issue creation script instead...")
			self.create_issue_script()
			return

		# Read all local issue files
		issue_files = [f for f in os.listdir(self.issues_dir) if f.endswith('.md')]
		issue_files.sort()

		print(f"📋 Found {len(issue_files)} issues to create")

		for issue_file in issue_files:
			issue_path = os.path.join(self.issues_dir, issue_file)
			self.create_single_github_issue(issue_path, issue_file)

		print(f"✅ Created {len(self.created_issues)} GitHub issues")

	def check_github_cli(self) -> bool:
		"""Check if GitHub CLI is installed"""
		try:
			result = subprocess.run(['gh', '--version'], capture_output=True, text=True)
			return result.returncode == 0
		except FileNotFoundError:
			return False

	def create_single_github_issue(self, file_path: str, filename: str):
		"""Create a single GitHub issue from markdown file"""

		with open(file_path, 'r', encoding='utf-8') as f:
			content = f.read()

		# Parse issue metadata
		issue_data = self.parse_issue_metadata(content)

		# Create GitHub issue using CLI
		try:
			self.execute_github_issue_creation(issue_data)
			self.created_issues.append(issue_data['title'])
			print(f"	✅ Created: {issue_data['title']}")
		except Exception as e:
			print(f"	❌ Failed to create: {issue_data['title']} - {str(e)}")

	def parse_issue_metadata(self, content: str) -> Dict[str, Any]:
		"""Parse issue metadata from markdown content"""

		lines = content.split('\n')

		# Extract title
		title = lines[0].replace('# ', '').strip()

		# Extract metadata
		metadata = {}
		description_start = 0

		for i, line in enumerate(lines[1:], 1):
			if line.startswith('**') and ':**' in line:
				key_match = re.match(r'\*\*(.*?)\*\*:\s*(.*)', line)
				if key_match:
					key, value = key_match.groups()
					metadata[key.lower().replace(' ', '_')] = value.strip()
			elif line.strip() == '## Description' or line.strip() == '## Objective':
				description_start = i + 1
				break

		# Extract description/body
		description_lines = []
		capturing = False

		for line in lines[description_start:]:
			if line.strip() == '## Description' or line.strip() == '## Objective':
				capturing = True
				continue
			elif line.startswith('##') and capturing:
				break
			elif capturing:
				description_lines.append(line)

		body = '\n'.join(description_lines).strip()

		# Extract full content as body
		if not body:
			# Use everything after metadata as body
			body_start = description_start
			body = '\n'.join(lines[body_start:]).strip()

		return {
			'title': title,
			'body': body,
			'labels': self.parse_labels(metadata.get('labels', '')),
			'milestone': metadata.get('milestone', ''),
			'assignee': metadata.get('assignee', ''),
			'priority': metadata.get('priority', ''),
			'epic': metadata.get('epic', ''),
			'estimated_hours': metadata.get('estimated_hours', '0')
		}

	def parse_labels(self, labels_string: str) -> List[str]:
		"""Parse labels from comma-separated string"""
		if not labels_string:
			return []
		return [label.strip() for label in labels_string.split(',')]

	def execute_github_issue_creation(self, issue_data: Dict[str, Any]):
		"""Execute GitHub CLI command to create issue"""

		cmd = ['gh', 'issue', 'create']
		cmd.extend(['--title', issue_data['title']])
		cmd.extend(['--body', issue_data['body']])

		# Add labels
		if issue_data['labels']:
			for label in issue_data['labels']:
				cmd.extend(['--label', label])

		# Add milestone if specified
		if issue_data['milestone']:
			cmd.extend(['--milestone', issue_data['milestone']])

		# Add assignee if specified
		if issue_data['assignee'] and issue_data['assignee'] != 'rom-analysis-team':
			cmd.extend(['--assignee', issue_data['assignee']])

		# Execute command
		result = subprocess.run(cmd, capture_output=True, text=True, cwd=self.project_root)

		if result.returncode != 0:
			raise Exception(f"GitHub CLI error: {result.stderr}")

	def create_issue_script(self):
		"""Create a batch script for manual issue creation"""

		script_path = os.path.join(self.project_root, "create_github_issues.bat")

		with open(script_path, 'w') as f:
			f.write("@echo off\n")
			f.write("echo Creating GitHub Issues for Dragon Quest III ROM Analysis\n")
			f.write("echo.\n")
			f.write("echo This script requires GitHub CLI (gh) to be installed\n")
			f.write("echo Install from: https://cli.github.com/\n")
			f.write("echo.\n")
			f.write("pause\n")
			f.write("echo.\n\n")

			# Read all issue files and create commands
			issue_files = [f for f in os.listdir(self.issues_dir) if f.endswith('.md')]
			issue_files.sort()

			for i, issue_file in enumerate(issue_files, 1):
				issue_path = os.path.join(self.issues_dir, issue_file)

				with open(issue_path, 'r', encoding='utf-8') as issue_f:
					content = issue_f.read()

				issue_data = self.parse_issue_metadata(content)

				f.write(f"echo Creating Issue {i}: {issue_data['title']}\n")

				# Build GitHub CLI command
				cmd_parts = [
					"gh issue create",
					f'--title "{issue_data["title"]}"',
					f'--body-file "{os.path.relpath(issue_path, self.project_root)}"'
				]

				# Add labels
				if issue_data['labels']:
					for label in issue_data['labels']:
						cmd_parts.append(f'--label "{label}"')

				cmd = ' '.join(cmd_parts)
				f.write(f"{cmd}\n")
				f.write("if errorlevel 1 echo Failed to create issue\n")
				f.write("echo.\n\n")

			f.write("echo.\n")
			f.write("echo All issues creation commands completed!\n")
			f.write("pause\n")

		print(f"✅ Created issue creation script: {script_path}")

		# Also create a PowerShell version
		ps_script_path = os.path.join(self.project_root, "create_github_issues.ps1")

		with open(ps_script_path, 'w') as f:
			f.write("# Dragon Quest III ROM Analysis - GitHub Issues Creator\n")
			f.write("Write-Host 'Creating GitHub Issues for Dragon Quest III ROM Analysis' -ForegroundColor Green\n")
			f.write("Write-Host ''\n\n")

			f.write("# Check if GitHub CLI is installed\n")
			f.write("try {\n")
			f.write("	gh --version | Out-Null\n")
			f.write("	Write-Host 'GitHub CLI found' -ForegroundColor Green\n")
			f.write("} catch {\n")
			f.write("	Write-Host 'GitHub CLI not found. Please install from: https://cli.github.com/' -ForegroundColor Red\n")
			f.write("	exit 1\n")
			f.write("}\n\n")

			# Read all issue files and create commands
			issue_files = [f for f in os.listdir(self.issues_dir) if f.endswith('.md')]
			issue_files.sort()

			for i, issue_file in enumerate(issue_files, 1):
				issue_path = os.path.join(self.issues_dir, issue_file)

				with open(issue_path, 'r', encoding='utf-8') as issue_f:
					content = issue_f.read()

				issue_data = self.parse_issue_metadata(content)

				f.write(f"Write-Host 'Creating Issue {i}: {issue_data['title']}' -ForegroundColor Yellow\n")

				# Build PowerShell command
				cmd_parts = [
					"gh issue create",
					f"--title '{issue_data['title']}'",
					f"--body-file '{os.path.relpath(issue_path, self.project_root).replace(os.sep, '/')}'"
				]

				# Add labels
				if issue_data['labels']:
					for label in issue_data['labels']:
						cmd_parts.append(f"--label '{label}'")

				cmd = ' '.join(cmd_parts)
				f.write(f"& {cmd}\n")
				f.write("if ($LASTEXITCODE -ne 0) {\n")
				f.write(f"	Write-Host 'Failed to create issue: {issue_data['title']}' -ForegroundColor Red\n")
				f.write("} else {\n")
				f.write(f"	Write-Host 'Successfully created: {issue_data['title']}' -ForegroundColor Green\n")
				f.write("}\n")
				f.write("Write-Host ''\n\n")

			f.write("Write-Host 'All GitHub issues creation completed!' -ForegroundColor Green\n")
			f.write("Read-Host 'Press Enter to continue...'\n")

		print(f"✅ Created PowerShell script: {ps_script_path}")

		# Create summary of what would be created
		self.create_issues_summary()

	def create_issues_summary(self):
		"""Create a summary of all issues that would be created"""

		summary_path = os.path.join(self.project_root, "GITHUB_ISSUES_SUMMARY.md")

		with open(summary_path, 'w', encoding='utf-8') as f:
			f.write("# 🎯 GitHub Issues Summary for Dragon Quest III ROM Analysis\n\n")
			f.write("This document summarizes all the GitHub issues ready to be created.\n\n")

			# Read all issue files
			issue_files = [f for f in os.listdir(self.issues_dir) if f.endswith('.md')]
			issue_files.sort()

			f.write(f"**Total Issues:** {len(issue_files)}\n")
			f.write(f"**Total Estimated Hours:** 695\n\n")

			f.write("## 📋 Issues Overview\n\n")

			total_hours = 0
			epics = {}

			for i, issue_file in enumerate(issue_files, 1):
				issue_path = os.path.join(self.issues_dir, issue_file)

				with open(issue_path, 'r', encoding='utf-8') as issue_f:
					content = issue_f.read()

				issue_data = self.parse_issue_metadata(content)

				# Track epic
				epic = issue_data.get('epic', 'General')
				if epic not in epics:
					epics[epic] = []
				epics[epic].append(issue_data)

				try:
					hours = int(issue_data.get('estimated_hours', '0'))
					total_hours += hours
				except ValueError:
					hours = 0

				f.write(f"### {i}. {issue_data['title']}\n")
				f.write(f"- **Epic:** {epic}\n")
				f.write(f"- **Priority:** {issue_data.get('priority', 'medium')}\n")
				f.write(f"- **Estimated Hours:** {hours}\n")
				f.write(f"- **Labels:** {', '.join(issue_data.get('labels', []))}\n")
				f.write(f"- **File:** `{issue_file}`\n\n")

			f.write("## 🏗️ Epics Breakdown\n\n")
			for epic, issues in epics.items():
				epic_hours = sum(int(issue.get('estimated_hours', '0')) for issue in issues)
				f.write(f"### {epic}\n")
				f.write(f"- **Issues:** {len(issues)}\n")
				f.write(f"- **Total Hours:** {epic_hours}\n")
				for issue in issues:
					f.write(f"	- {issue['title']}\n")
				f.write("\n")

			f.write("## 🚀 Next Steps\n\n")
			f.write("1. **Install GitHub CLI:** `winget install GitHub.cli` or download from https://cli.github.com/\n")
			f.write("2. **Authenticate:** `gh auth login`\n")
			f.write("3. **Run Creation Script:** `./create_github_issues.ps1`\n\n")
			f.write("Alternatively, create issues manually using the markdown files in `project_management/github_issues/`\n")

		print(f"✅ Created issues summary: {summary_path}")

def main():
	"""Main execution function"""

	print("🎮 Dragon Quest III - GitHub Issues Creator")
	print("=" * 60)

	project_root = os.getcwd()
	creator = GitHubIssuesCreator(project_root)

	creator.create_github_issues()

if __name__ == "__main__":
	main()
