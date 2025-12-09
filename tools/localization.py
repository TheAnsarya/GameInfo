#!/usr/bin/env python3
"""
Localization Manager - Manage game text for multiple languages.

Tools for handling game text localization, string tables,
and translation workflows.

Usage:
	python localization.py <strings.json>
	python localization.py --export-csv
	python localization.py --validate

Features:
	- Multi-language string tables
	- CSV import/export
	- Placeholder validation
	- Length checking
	- Translation status tracking
"""

import argparse
import csv
import json
import os
import re
import sys
from dataclasses import dataclass, field
from enum import Enum, auto
from pathlib import Path
from typing import Any, Dict, List, Optional, Set, Tuple


class TranslationStatus(Enum):
	"""Translation completion status."""
	NOT_STARTED = auto()
	IN_PROGRESS = auto()
	NEEDS_REVIEW = auto()
	APPROVED = auto()
	FINAL = auto()


class StringCategory(Enum):
	"""String categories."""
	DIALOGUE = auto()
	MENU = auto()
	ITEM = auto()
	SKILL = auto()
	MONSTER = auto()
	LOCATION = auto()
	SYSTEM = auto()
	TUTORIAL = auto()
	CREDITS = auto()


@dataclass
class LocalizedString:
	"""A localized text string."""
	string_id: str
	category: StringCategory = StringCategory.SYSTEM
	context: str = ""  # For translators
	max_length: int = 0  # 0 = no limit
	has_placeholders: bool = False
	translations: Dict[str, str] = field(default_factory=dict)
	status: Dict[str, TranslationStatus] = field(default_factory=dict)
	notes: Dict[str, str] = field(default_factory=dict)
	
	def get_text(self, language: str, fallback: str = "en") -> str:
		"""Get text for language with fallback."""
		if language in self.translations:
			return self.translations[language]
		if fallback in self.translations:
			return self.translations[fallback]
		return f"[{self.string_id}]"
	
	def set_text(self, language: str, text: str) -> None:
		"""Set text for language."""
		self.translations[language] = text
		if language not in self.status:
			self.status[language] = TranslationStatus.IN_PROGRESS
	
	def get_placeholders(self, language: str = "en") -> List[str]:
		"""Get placeholders in text."""
		text = self.translations.get(language, "")
		return re.findall(r'\{[^}]+\}|\%[sd]', text)
	
	def validate_translation(self, language: str, base: str = "en") -> List[str]:
		"""Validate translation against base. Returns issues."""
		issues = []
		
		if language not in self.translations:
			return [f"Missing translation for {language}"]
		
		text = self.translations[language]
		base_text = self.translations.get(base, "")
		
		# Length check
		if self.max_length > 0 and len(text) > self.max_length:
			issues.append(f"Exceeds max length ({len(text)}/{self.max_length})")
		
		# Placeholder check
		if self.has_placeholders:
			base_ph = set(self.get_placeholders(base))
			trans_ph = set(self.get_placeholders(language))
			
			missing = base_ph - trans_ph
			extra = trans_ph - base_ph
			
			if missing:
				issues.append(f"Missing placeholders: {missing}")
			if extra:
				issues.append(f"Extra placeholders: {extra}")
		
		return issues
	
	def to_dict(self) -> Dict[str, Any]:
		"""Convert to dictionary."""
		result = {
			"id": self.string_id,
			"category": self.category.name
		}
		
		if self.context:
			result["context"] = self.context
		if self.max_length:
			result["max_length"] = self.max_length
		if self.has_placeholders:
			result["has_placeholders"] = True
		
		result["translations"] = self.translations
		
		if self.status:
			result["status"] = {k: v.name for k, v in self.status.items()}
		if self.notes:
			result["notes"] = self.notes
		
		return result
	
	@classmethod
	def from_dict(cls, data: Dict[str, Any]) -> "LocalizedString":
		"""Create from dictionary."""
		status = {k: TranslationStatus[v] for k, v in data.get("status", {}).items()}
		
		return cls(
			string_id=data["id"],
			category=StringCategory[data.get("category", "SYSTEM")],
			context=data.get("context", ""),
			max_length=data.get("max_length", 0),
			has_placeholders=data.get("has_placeholders", False),
			translations=data.get("translations", {}),
			status=status,
			notes=data.get("notes", {})
		)


class LocalizationManager:
	"""Manage game localization."""
	
	def __init__(self):
		self.strings: Dict[str, LocalizedString] = {}
		self.languages: List[str] = ["en"]
		self.base_language: str = "en"
		self.metadata: Dict[str, Any] = {}
	
	def add_string(self, string: LocalizedString) -> None:
		"""Add localized string."""
		self.strings[string.string_id] = string
		
		# Track languages
		for lang in string.translations.keys():
			if lang not in self.languages:
				self.languages.append(lang)
	
	def get_string(self, string_id: str) -> Optional[LocalizedString]:
		"""Get string by ID."""
		return self.strings.get(string_id)
	
	def get_text(self, string_id: str, language: str = "en") -> str:
		"""Get text for string."""
		string = self.get_string(string_id)
		if string:
			return string.get_text(language, self.base_language)
		return f"[{string_id}]"
	
	def get_by_category(self, category: StringCategory) -> List[LocalizedString]:
		"""Get strings by category."""
		return [s for s in self.strings.values() if s.category == category]
	
	def get_untranslated(self, language: str) -> List[LocalizedString]:
		"""Get strings missing translation."""
		return [s for s in self.strings.values() 
				if language not in s.translations]
	
	def get_by_status(self, language: str, 
					  status: TranslationStatus) -> List[LocalizedString]:
		"""Get strings by status."""
		return [s for s in self.strings.values()
				if s.status.get(language) == status]
	
	def get_completion(self, language: str) -> Tuple[int, int]:
		"""Get translation completion (translated, total)."""
		total = len(self.strings)
		translated = sum(1 for s in self.strings.values() 
						 if language in s.translations and s.translations[language])
		return translated, total
	
	def get_statistics(self) -> Dict[str, Any]:
		"""Get localization statistics."""
		stats = {
			"total_strings": len(self.strings),
			"languages": self.languages,
			"by_category": {},
			"by_language": {}
		}
		
		# Category counts
		for cat in StringCategory:
			count = len(self.get_by_category(cat))
			if count:
				stats["by_category"][cat.name] = count
		
		# Language completion
		for lang in self.languages:
			trans, total = self.get_completion(lang)
			stats["by_language"][lang] = {
				"translated": trans,
				"total": total,
				"percent": trans / total * 100 if total else 0
			}
		
		return stats
	
	def validate_all(self, language: str) -> Dict[str, List[str]]:
		"""Validate all translations. Returns {string_id: [issues]}."""
		issues = {}
		
		for string in self.strings.values():
			string_issues = string.validate_translation(language, self.base_language)
			if string_issues:
				issues[string.string_id] = string_issues
		
		return issues
	
	def export_csv(self, filepath: str, languages: List[str] = None) -> None:
		"""Export to CSV."""
		languages = languages or self.languages
		
		with open(filepath, "w", newline="", encoding="utf-8") as f:
			writer = csv.writer(f)
			
			# Header
			header = ["ID", "Category", "Context", "Max Length"] + languages + ["Notes"]
			writer.writerow(header)
			
			# Data
			for string in self.strings.values():
				row = [
					string.string_id,
					string.category.name,
					string.context,
					string.max_length or ""
				]
				
				for lang in languages:
					row.append(string.translations.get(lang, ""))
				
				row.append(string.notes.get(self.base_language, ""))
				writer.writerow(row)
	
	def import_csv(self, filepath: str, languages: List[str] = None) -> int:
		"""Import from CSV. Returns count of imported strings."""
		count = 0
		
		with open(filepath, "r", encoding="utf-8") as f:
			reader = csv.DictReader(f)
			
			# Detect language columns
			if languages is None:
				languages = [col for col in reader.fieldnames 
							 if col not in ["ID", "Category", "Context", "Max Length", "Notes"]]
			
			for row in reader:
				string_id = row.get("ID", "")
				if not string_id:
					continue
				
				if string_id in self.strings:
					string = self.strings[string_id]
				else:
					string = LocalizedString(
						string_id=string_id,
						category=StringCategory[row.get("Category", "SYSTEM")]
					)
					self.strings[string_id] = string
				
				if row.get("Context"):
					string.context = row["Context"]
				if row.get("Max Length"):
					string.max_length = int(row["Max Length"])
				
				for lang in languages:
					if lang in row and row[lang]:
						string.set_text(lang, row[lang])
				
				count += 1
		
		return count
	
	def load(self, filepath: str) -> None:
		"""Load from JSON."""
		with open(filepath, "r", encoding="utf-8") as f:
			data = json.load(f)
		
		self.metadata = data.get("metadata", {})
		self.languages = data.get("languages", ["en"])
		self.base_language = data.get("base_language", "en")
		
		for string_data in data.get("strings", []):
			string = LocalizedString.from_dict(string_data)
			self.add_string(string)
	
	def save(self, filepath: str) -> None:
		"""Save to JSON."""
		data = {
			"metadata": self.metadata,
			"languages": self.languages,
			"base_language": self.base_language,
			"strings": [s.to_dict() for s in self.strings.values()]
		}
		
		with open(filepath, "w", encoding="utf-8") as f:
			json.dump(data, f, indent="\t", ensure_ascii=False)


def create_example_localization() -> LocalizationManager:
	"""Create example localization data."""
	manager = LocalizationManager()
	manager.metadata = {"game": "Example RPG", "version": "1.0"}
	manager.languages = ["en", "ja", "es", "de", "fr"]
	
	# Menu strings
	manager.add_string(LocalizedString(
		string_id="menu_new_game",
		category=StringCategory.MENU,
		context="Main menu option",
		max_length=15,
		translations={
			"en": "New Game",
			"ja": "ニューゲーム",
			"es": "Nuevo Juego",
			"de": "Neues Spiel",
			"fr": "Nouvelle Partie"
		},
		status={"en": TranslationStatus.FINAL, "ja": TranslationStatus.FINAL}
	))
	
	manager.add_string(LocalizedString(
		string_id="menu_continue",
		category=StringCategory.MENU,
		context="Main menu option",
		max_length=15,
		translations={
			"en": "Continue",
			"ja": "つづきから",
			"es": "Continuar",
			"de": "Fortsetzen",
			"fr": "Continuer"
		}
	))
	
	manager.add_string(LocalizedString(
		string_id="menu_settings",
		category=StringCategory.MENU,
		context="Main menu option",
		max_length=15,
		translations={
			"en": "Settings",
			"ja": "せってい",
			"es": "Opciones",
			"de": "Einstellungen",
			"fr": "Options"
		}
	))
	
	# System messages
	manager.add_string(LocalizedString(
		string_id="sys_save_complete",
		category=StringCategory.SYSTEM,
		context="Shown after saving",
		has_placeholders=True,
		translations={
			"en": "Game saved to Slot {slot}.",
			"ja": "スロット{slot}にセーブしました。",
			"es": "Juego guardado en Ranura {slot}."
		}
	))
	
	manager.add_string(LocalizedString(
		string_id="sys_level_up",
		category=StringCategory.SYSTEM,
		context="Level up notification",
		has_placeholders=True,
		translations={
			"en": "{name} reached Level {level}!",
			"ja": "{name}はレベル{level}になった！"
		}
	))
	
	# Dialogue
	manager.add_string(LocalizedString(
		string_id="dlg_intro_01",
		category=StringCategory.DIALOGUE,
		context="Opening scene, King speaking",
		max_length=200,
		translations={
			"en": "Hero, thank you for answering my summons. Dark times are upon us.",
			"ja": "勇者よ、よく来てくれた。暗い時代が来ている。"
		}
	))
	
	# Items
	manager.add_string(LocalizedString(
		string_id="item_potion",
		category=StringCategory.ITEM,
		context="Basic healing item",
		max_length=12,
		translations={
			"en": "Potion",
			"ja": "やくそう",
			"es": "Poción",
			"de": "Trank",
			"fr": "Potion"
		}
	))
	
	manager.add_string(LocalizedString(
		string_id="item_potion_desc",
		category=StringCategory.ITEM,
		context="Item description",
		max_length=80,
		translations={
			"en": "Restores 30 HP to one ally.",
			"ja": "味方一人のHPを30回復する。",
			"es": "Restaura 30 PV a un aliado."
		}
	))
	
	# Monster names
	manager.add_string(LocalizedString(
		string_id="mon_slime",
		category=StringCategory.MONSTER,
		max_length=12,
		translations={
			"en": "Slime",
			"ja": "スライム",
			"es": "Limo",
			"de": "Schleim",
			"fr": "Gluant"
		}
	))
	
	return manager


def main():
	"""Main entry point."""
	parser = argparse.ArgumentParser(description="Localization Manager")
	parser.add_argument("datafile", nargs="?", help="Localization JSON file")
	parser.add_argument("--list", "-l", action="store_true",
						help="List all strings")
	parser.add_argument("--category", "-c", 
						choices=[c.name for c in StringCategory],
						help="Filter by category")
	parser.add_argument("--language", help="Show specific language")
	parser.add_argument("--untranslated", "-u", help="Show untranslated for language")
	parser.add_argument("--validate", "-v", help="Validate language")
	parser.add_argument("--stats", "-s", action="store_true",
						help="Show statistics")
	parser.add_argument("--export-csv", help="Export to CSV file")
	parser.add_argument("--import-csv", help="Import from CSV file")
	parser.add_argument("--create-example", action="store_true",
						help="Create example data")
	parser.add_argument("--export", "-e", help="Export to JSON file")
	
	args = parser.parse_args()
	
	manager = LocalizationManager()
	
	if args.create_example:
		manager = create_example_localization()
		output = args.datafile or "localization.json"
		manager.save(output)
		print(f"Created example data: {output}")
		return
	
	if args.datafile and os.path.exists(args.datafile):
		manager.load(args.datafile)
		print(f"Loaded: {args.datafile}")
	else:
		manager = create_example_localization()
		print("Localization Manager - Demo Mode")
	
	print(f"Strings: {len(manager.strings)}")
	print(f"Languages: {', '.join(manager.languages)}")
	print()
	
	# Import CSV
	if args.import_csv:
		count = manager.import_csv(args.import_csv)
		print(f"Imported {count} strings from {args.import_csv}")
		print()
	
	# List strings
	if args.list:
		lang = args.language or manager.base_language
		print(f"All Strings ({lang}):")
		for string in manager.strings.values():
			text = string.get_text(lang)[:50]
			print(f"  [{string.string_id}] {text}")
		print()
	
	# Filter by category
	if args.category:
		cat = StringCategory[args.category]
		strings = manager.get_by_category(cat)
		lang = args.language or manager.base_language
		print(f"{args.category} Strings ({len(strings)}):")
		for string in strings:
			text = string.get_text(lang)[:50]
			print(f"  {string.string_id}: {text}")
		print()
	
	# Untranslated
	if args.untranslated:
		strings = manager.get_untranslated(args.untranslated)
		print(f"Untranslated for {args.untranslated} ({len(strings)}):")
		for string in strings[:20]:
			base_text = string.get_text(manager.base_language)[:40]
			print(f"  {string.string_id}: {base_text}")
		if len(strings) > 20:
			print(f"  ... and {len(strings) - 20} more")
		print()
	
	# Validate
	if args.validate:
		issues = manager.validate_all(args.validate)
		if issues:
			print(f"Validation Issues for {args.validate} ({len(issues)} strings):")
			for string_id, string_issues in issues.items():
				print(f"  {string_id}:")
				for issue in string_issues:
					print(f"    - {issue}")
		else:
			print(f"No validation issues for {args.validate}")
		print()
	
	# Statistics
	if args.stats:
		stats = manager.get_statistics()
		print("Statistics:")
		print(f"  Total strings: {stats['total_strings']}")
		print("\n  By Category:")
		for cat, count in stats["by_category"].items():
			print(f"    {cat}: {count}")
		print("\n  By Language:")
		for lang, data in stats["by_language"].items():
			pct = data["percent"]
			bar = "█" * int(pct / 10) + "░" * (10 - int(pct / 10))
			print(f"    {lang}: {data['translated']}/{data['total']} ({pct:.1f}%) {bar}")
		print()
	
	# Export CSV
	if args.export_csv:
		manager.export_csv(args.export_csv)
		print(f"Exported to CSV: {args.export_csv}")
		print()
	
	# Export JSON
	if args.export:
		manager.save(args.export)
		print(f"Exported to: {args.export}")


if __name__ == "__main__":
	main()
