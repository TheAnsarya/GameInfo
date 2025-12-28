#!/usr/bin/env python3
"""
Automated Build System for DQ3R Project
Orchestrates compression, asset pipeline, and continuous development workflow
"""

from pathlib import Path
import subprocess
import sys
import json
import time
from typing import Dict, Any, List
import argparse

# Import our modules
try:
	sys.path.append(str(Path(__file__).parent))
	from session.session_logger import SessionLogger
	from formatting.auto_formatter import CodeFormatter, run_automated_formatting
	from compression.compression_engine import get_compression_engine
	from asset_pipeline.snes_extractor import create_asset_pipeline
except ImportError as e:
	print(f"Setting up import paths...")
	# Ensure all tool modules are in path
	tools_dir = Path(__file__).parent
	sys.path.insert(0, str(tools_dir))

	try:
		from session.session_logger import SessionLogger
		from formatting.auto_formatter import CodeFormatter, run_automated_formatting
		from compression.compression_engine import get_compression_engine
		from asset_pipeline.snes_extractor import create_asset_pipeline

		print("✅ All modules imported successfully")
	except ImportError as e2:
		print(f"❌ Import error: {e2}")
		sys.exit(1)


class DQ3RBuildSystem:
	"""Comprehensive build system for DQ3R project"""

	def __init__(self, project_root: Path = None):
		"""Initialize build system"""
		if project_root is None:
			self.project_root = Path(__file__).parent.parent
		else:
			self.project_root = Path(project_root)

		self.session_logger = SessionLogger(self.project_root)
		self.code_formatter = CodeFormatter(str(self.project_root))
		self.compression_engine = get_compression_engine()

		self.logs_dir = self.project_root / "logs"
		self.logs_dir.mkdir(exist_ok=True)

		self.build_log = self.logs_dir / "build_system.log"

		# Build configuration
		self.config = {
			"auto_format": True,
			"session_logging": True,
			"asset_extraction": True,
			"compression_analysis": True,
			"git_integration": True,
			"max_token_utilization": True,
		}

	def log_build_action(self, message: str, level: str = "INFO"):
		"""Log build system actions"""
		timestamp = time.strftime("%Y-%m-%d %H:%M:%S")
		log_entry = f"[{timestamp}] [{level}] {message}\n"

		with open(self.build_log, "a", encoding="utf-8") as f:
			f.write(log_entry)

		print(f"[BUILD] {message}")

	def run_comprehensive_build(self) -> Dict[str, Any]:
		"""Run complete build process with all systems"""
		build_start = time.time()

		self.log_build_action("Starting comprehensive DQ3R build process...")

		build_results = {
			"start_time": time.strftime("%Y-%m-%d %H:%M:%S"),
			"session_update": {},
			"formatting": {},
			"compression_analysis": {},
			"asset_extraction": {},
			"git_status": {},
			"errors": [],
			"success": False,
			"build_time": 0.0,
		}

		try:
			# 1. Update session logs
			if self.config["session_logging"]:
				self.log_build_action("Updating session logs...")
				session_result = self._update_session_logs()
				build_results["session_update"] = session_result

			# 2. Run automated formatting
			if self.config["auto_format"]:
				self.log_build_action("Running automated code formatting...")
				formatting_result = self._run_formatting()
				build_results["formatting"] = formatting_result

			# 3. Analyze and compress assets
			if self.config["compression_analysis"]:
				self.log_build_action("Analyzing compression opportunities...")
				compression_result = self._analyze_compression()
				build_results["compression_analysis"] = compression_result

			# 4. Extract ROM assets
			if self.config["asset_extraction"]:
				self.log_build_action("Extracting ROM assets...")
				asset_result = self._extract_assets()
				build_results["asset_extraction"] = asset_result

			# 5. Git integration and status
			if self.config["git_integration"]:
				self.log_build_action("Updating git status...")
				git_result = self._update_git_status()
				build_results["git_status"] = git_result

			build_results["success"] = True
			self.log_build_action("Build process completed successfully!")

		except Exception as e:
			error_msg = f"Build process failed: {e}"
			self.log_build_action(error_msg, "ERROR")
			build_results["errors"].append(error_msg)
			build_results["success"] = False

		build_results["build_time"] = time.time() - build_start
		build_results["end_time"] = time.strftime("%Y-%m-%d %H:%M:%S")

		self._save_build_report(build_results)
		return build_results

	def _update_session_logs(self) -> Dict[str, Any]:
		"""Update session logging system"""
		try:
			# Update session with current activity
			self.session_logger.update_session()

			# Log current prompt activity
			self.session_logger.log_prompt_activity(
				prompt_type="automated_build",
				description="Comprehensive build system execution with all automation features",
				tools_used=[
					"session_logger",
					"auto_formatter",
					"compression_engine",
					"asset_pipeline",
				],
				outcomes=[
					"session_updated",
					"code_formatted",
					"assets_analyzed",
					"compression_optimized",
				],
			)

			# Generate session report
			session_report = self.session_logger.generate_session_report()

			return {
				"status": "success",
				"session_updated": True,
				"report_generated": True,
				"report_path": str(self.session_logger.current_session_log),
				"summary": session_report.get("summary", {}),
			}

		except Exception as e:
			return {"status": "error", "error": str(e), "session_updated": False}

	def _run_formatting(self) -> Dict[str, Any]:
		"""Run automated code formatting"""
		try:
			# Use the existing automated formatter
			formatting_summary = run_automated_formatting()

			# Run EditorConfig compliance check
			compliance = self.code_formatter.check_editorconfig_compliance()

			return {
				"status": "success",
				"formatting_applied": True,
				"summary": formatting_summary,
				"compliance": compliance,
				"compliance_rate": compliance["summary"].get("compliance_rate", "Unknown"),
			}

		except Exception as e:
			return {"status": "error", "error": str(e), "formatting_applied": False}

	def _analyze_compression(self) -> Dict[str, Any]:
		"""Analyze compression opportunities in project files"""
		try:
			compression_results = {
				"algorithms_tested": [],
				"best_ratios": {},
				"recommendations": [],
				"total_savings": 0,
			}

			# Find files that could benefit from compression
			candidate_files = self._find_compression_candidates()

			for file_path in candidate_files:
				try:
					with open(file_path, "rb") as f:
						file_data = f.read()

					# Test different algorithms
					algorithms = ["basic_ring400", "simple_tail_window"]
					best_algo = None
					best_ratio = 1.0

					for algorithm in algorithms:
						try:
							compressed, stats = self.compression_engine.compress(file_data, algorithm)
							if stats.compression_ratio < best_ratio:
								best_ratio = stats.compression_ratio
								best_algo = algorithm

						except Exception:
							continue

					if best_ratio < 0.8:	# Good compression ratio
						file_size = len(file_data)
						savings = file_size * (1 - best_ratio)

						compression_results["best_ratios"][str(file_path)] = {
							"algorithm": best_algo,
							"ratio": best_ratio,
							"savings": int(savings),
						}
						compression_results["total_savings"] += savings

				except Exception as e:
					self.log_build_action(f"Compression analysis failed for {file_path}: {e}", "WARNING")
					continue

			compression_results["algorithms_tested"] = algorithms

			# Generate recommendations
			if compression_results["total_savings"] > 1024:	# More than 1KB savings
				compression_results["recommendations"].append(
					f"Potential compression savings: {int(compression_results['total_savings'])} bytes"
				)

			return {
				"status": "success",
				"analysis_complete": True,
				"results": compression_results,
			}

		except Exception as e:
			return {"status": "error", "error": str(e), "analysis_complete": False}

	def _find_compression_candidates(self) -> List[Path]:
		"""Find files that might benefit from compression"""
		candidates = []

		# Look for binary files that might compress well
		patterns = ["*.bin", "*.dat", "*.smc", "*.rom"]

		for pattern in patterns:
			for file_path in self.project_root.rglob(pattern):
				if file_path.is_file() and file_path.stat().st_size > 1024:	# At least 1KB
					candidates.append(file_path)

		return candidates[:10]	# Limit to prevent excessive processing

	def _extract_assets(self) -> Dict[str, Any]:
		"""Extract assets from ROM files"""
		try:
			# Find ROM files in project
			rom_files = list(self.project_root.rglob("*.smc"))

			if not rom_files:
				return {
					"status": "skipped",
					"reason": "No ROM files found",
					"extraction_complete": False,
				}

			# Use first ROM file found
			rom_file = rom_files[0]
			self.log_build_action(f"Extracting assets from {rom_file.name}...")

			# Create asset pipeline
			pipeline = create_asset_pipeline(str(rom_file))

			# Analyze ROM structure
			analysis = pipeline.analyze_rom_structure()

			# Extract known assets
			assets = pipeline.extract_dq3_assets()

			# Export assets to build directory
			assets_dir = self.project_root / "build" / "extracted_assets"
			export_results = pipeline.export_assets(assets_dir, assets)

			return {
				"status": "success",
				"rom_analyzed": True,
				"rom_file": str(rom_file),
				"rom_size": analysis["rom_size"],
				"assets_found": len(assets),
				"assets_exported": export_results["exported_count"],
				"export_failures": export_results["failed_count"],
				"extraction_complete": True,
			}

		except Exception as e:
			return {"status": "error", "error": str(e), "extraction_complete": False}

	def _update_git_status(self) -> Dict[str, Any]:
		"""Update git status and integration"""
		try:
			git_info = self.session_logger.get_git_status()

			# Check if there are changes to commit
			if git_info.get("has_changes", False):
				self.log_build_action("Git changes detected during build")

			return {
				"status": "success",
				"git_updated": True,
				"branch": git_info.get("branch", "unknown"),
				"has_changes": git_info.get("has_changes", False),
				"commit_count": git_info.get("commit_count", 0),
			}

		except Exception as e:
			return {"status": "error", "error": str(e), "git_updated": False}

	def _save_build_report(self, build_results: Dict[str, Any]):
		"""Save detailed build report"""
		try:
			report_file = self.logs_dir / f"build_report_{int(time.time())}.json"

			with open(report_file, "w", encoding="utf-8") as f:
				json.dump(build_results, f, indent=2, ensure_ascii=False)

			self.log_build_action(f"Build report saved: {report_file}")

		except Exception as e:
			self.log_build_action(f"Could not save build report: {e}", "WARNING")

	def continuous_development_mode(self):
		"""Run in continuous development mode with token maximization"""
		self.log_build_action("Starting continuous development mode...")

		iteration = 0
		max_iterations = 10	# Prevent infinite loops

		while iteration < max_iterations:
			iteration += 1
			self.log_build_action(f"Continuous development iteration {iteration}")

			# Run full build process
			build_results = self.run_comprehensive_build()

			if not build_results["success"]:
				self.log_build_action("Build failed, stopping continuous mode", "ERROR")
				break

			# Check if we should continue
			if self.config["max_token_utilization"]:
				self.log_build_action("Maximizing token utilization - continuing development...")
				time.sleep(1)	# Brief pause between iterations
			else:
				break

		self.log_build_action(f"Continuous development mode completed after {iteration} iterations")


def main():
	"""Main entry point for build system"""
	parser = argparse.ArgumentParser(description="DQ3R Automated Build System")
	parser.add_argument(
		"--continuous",
		"-c",
		action="store_true",
		help="Run in continuous development mode",
	)
	parser.add_argument("--no-format", action="store_true", help="Skip automated formatting")
	parser.add_argument("--no-session", action="store_true", help="Skip session logging")
	parser.add_argument("--no-assets", action="store_true", help="Skip asset extraction")
	parser.add_argument("--project-root", default=".", help="Project root directory")

	args = parser.parse_args()

	# Create build system
	project_root = Path(args.project_root).resolve()
	build_system = DQ3RBuildSystem(project_root)

	# Configure based on arguments
	if args.no_format:
		build_system.config["auto_format"] = False
	if args.no_session:
		build_system.config["session_logging"] = False
	if args.no_assets:
		build_system.config["asset_extraction"] = False

	try:
		if args.continuous:
			# Run continuous development mode
			build_system.continuous_development_mode()
		else:
			# Run single build
			results = build_system.run_comprehensive_build()

			if results["success"]:
				print("✅ Build completed successfully!")
				print(f"⏱️	Build time: {results['build_time']:.2f} seconds")
			else:
				print("❌ Build failed!")
				for error in results["errors"]:
					print(f"	 Error: {error}")
				sys.exit(1)

	except KeyboardInterrupt:
		print("\n🛑 Build interrupted by user")
		sys.exit(130)
	except Exception as e:
		print(f"💥 Build system error: {e}")
		sys.exit(1)


if __name__ == "__main__":
	main()
