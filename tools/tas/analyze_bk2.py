#!/usr/bin/env python3
"""Analyze BK2 files to verify format understanding."""

import zipfile
from pathlib import Path


def analyze_bk2(filepath: Path) -> dict:
	"""Analyze a BK2 file and return summary."""
	result = {
		"filename": filepath.name,
		"files": [],
		"header": {},
		"log_key": None,
		"frame_count": 0,
		"button_chars": set(),
		"has_select": False,
		"has_start": False,
		"has_l_shoulder": False,
		"has_r_shoulder": False,
	}

	with zipfile.ZipFile(filepath, 'r') as zf:
		result["files"] = [f.filename for f in zf.filelist]

		# Parse header
		header = zf.read('Header.txt').decode('utf-8')
		for line in header.strip().split('\n'):
			if ' ' in line:
				key, value = line.split(' ', 1)
				result["header"][key] = value

		# Parse input log
		input_log = zf.read('Input Log.txt').decode('utf-8')
		lines = input_log.split('\n')

		for line in lines:
			if line.startswith('LogKey:'):
				result["log_key"] = line[7:]
			elif line.startswith('|'):
				result["frame_count"] += 1
				parts = line.split('|')
				if len(parts) >= 3:
					ctrl = parts[2]
					for i, c in enumerate(ctrl):
						if c != '.' and i < 12:
							result["button_chars"].add(c)
							if i == 4:
								result["has_select"] = True
							elif i == 5:
								result["has_start"] = True
							elif i == 10:
								result["has_l_shoulder"] = True
							elif i == 11:
								result["has_r_shoulder"] = True

	result["button_chars"] = sorted(result["button_chars"])
	return result


def main():
	base_path = Path(r'C:\Users\me\source\repos\GameInfo\~tas-files\uncompressed\SNES')

	# Select files that likely have shoulder buttons or select
	test_files = [
		'arandomgametaser_keylie-chronotrigger.bk2',  # Known to have l/r
		'hhs-secretofmana-glitched.bk2',
		'adelikat2-dragonwarrior4.bk2',
		'hetfield90-megamanx.bk2',
	]

	print("=== BK2 Format Analysis ===\n")

	for filename in test_files:
		filepath = base_path / filename
		if not filepath.exists():
			print(f"MISSING: {filename}\n")
			continue

		info = analyze_bk2(filepath)

		print(f"File: {info['filename']}")
		print(f"  Archive contents: {info['files']}")
		print(f"  Platform: {info['header'].get('Platform', 'N/A')}")
		print(f"  Game: {info['header'].get('GameName', 'N/A')}")
		print(f"  Frames: {info['frame_count']}")
		print(f"  Button chars used: {info['button_chars']}")
		print(f"  Has Select: {info['has_select']}")
		print(f"  Has Start: {info['has_start']}")
		print(f"  Has L shoulder: {info['has_l_shoulder']}")
		print(f"  Has R shoulder: {info['has_r_shoulder']}")
		print()


if __name__ == '__main__':
	main()
