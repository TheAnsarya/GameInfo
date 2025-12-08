#!/usr/bin/env python3
"""
CDL Coverage Tracker

Track and analyze CDL (Code/Data Logger) coverage over time.
Supports multiple emulator formats and generates coverage trends.

Features:
- Track CDL coverage history
- Compare CDL files over time
- Generate coverage trends and charts
- Set coverage goals and alerts
- Export coverage reports
- CI/CD integration support

Usage:
    python cdl_coverage.py init --project <name>
    python cdl_coverage.py add <cdl_file> --name <snapshot_name>
    python cdl_coverage.py report
    python cdl_coverage.py compare <snapshot1> <snapshot2>
"""

import argparse
import json
import os
import sys
from dataclasses import dataclass, asdict
from datetime import datetime
from pathlib import Path
from typing import Dict, List, Optional, Tuple


@dataclass
class CoverageSnapshot:
    """A snapshot of CDL coverage at a point in time"""
    name: str
    timestamp: str
    prg_size: int
    chr_size: int
    prg_code: int
    prg_data: int
    prg_pcm: int
    chr_read: int
    chr_drawn: int
    total_logged: int
    coverage_percent: float
    source_file: str = ""
    notes: str = ""
    
    @property
    def prg_coverage(self) -> float:
        """PRG ROM coverage percentage"""
        if self.prg_size == 0:
            return 0.0
        return (self.prg_code + self.prg_data + self.prg_pcm) / self.prg_size * 100
    
    @property
    def chr_coverage(self) -> float:
        """CHR ROM coverage percentage"""
        if self.chr_size == 0:
            return 0.0
        return (self.chr_read + self.chr_drawn) / self.chr_size * 100


class CDLAnalyzer:
    """Analyze CDL files for coverage statistics"""
    
    # CDL flag bits
    CODE = 0x01
    DATA = 0x02
    PCM = 0x40
    INDIRECT_CODE = 0x10
    INDIRECT_DATA = 0x20
    
    CHR_READ = 0x01
    CHR_DRAWN = 0x02
    
    @classmethod
    def detect_format(cls, data: bytes) -> str:
        """Detect CDL format from header"""
        if data[:3] == b'MCD':
            return 'mesen'
        elif data[:4] == b'CDL\x1a':
            return 'mesen2'
        else:
            return 'fceux'
    
    @classmethod
    def analyze(cls, filepath: str) -> CoverageSnapshot:
        """Analyze a CDL file and return coverage statistics"""
        with open(filepath, 'rb') as f:
            data = f.read()
        
        fmt = cls.detect_format(data)
        
        # Parse based on format
        if fmt == 'mesen':
            prg_data, chr_data = cls._parse_mesen(data)
        elif fmt == 'mesen2':
            prg_data, chr_data = cls._parse_mesen2(data)
        else:
            prg_data, chr_data = cls._parse_fceux(data)
        
        # Calculate statistics
        prg_size = len(prg_data)
        chr_size = len(chr_data) if chr_data else 0
        
        prg_code = sum(1 for b in prg_data if b & cls.CODE)
        prg_data_count = sum(1 for b in prg_data if b & cls.DATA)
        prg_pcm = sum(1 for b in prg_data if b & cls.PCM)
        
        chr_read = sum(1 for b in chr_data if b & cls.CHR_READ) if chr_data else 0
        chr_drawn = sum(1 for b in chr_data if b & cls.CHR_DRAWN) if chr_data else 0
        
        total_size = prg_size + chr_size
        total_logged = prg_code + prg_data_count + prg_pcm
        if chr_data:
            total_logged += sum(1 for b in chr_data if b != 0)
        
        coverage = total_logged / total_size * 100 if total_size > 0 else 0.0
        
        return CoverageSnapshot(
            name="",
            timestamp=datetime.now().isoformat(),
            prg_size=prg_size,
            chr_size=chr_size,
            prg_code=prg_code,
            prg_data=prg_data_count,
            prg_pcm=prg_pcm,
            chr_read=chr_read,
            chr_drawn=chr_drawn,
            total_logged=total_logged,
            coverage_percent=coverage,
            source_file=filepath
        )
    
    @classmethod
    def _parse_mesen(cls, data: bytes) -> Tuple[bytes, bytes]:
        """Parse Mesen CDL format"""
        # Skip 3-byte header 'MCD'
        content = data[3:]
        
        # Simple split - first half PRG, second half CHR
        # In reality, this depends on ROM size
        half = len(content) // 2
        return content[:half], content[half:]
    
    @classmethod
    def _parse_mesen2(cls, data: bytes) -> Tuple[bytes, bytes]:
        """Parse Mesen 2 CDL format"""
        # Skip 4-byte header 'CDL\x1a'
        content = data[4:]
        
        # Try to detect PRG/CHR split
        half = len(content) // 2
        return content[:half], content[half:]
    
    @classmethod
    def _parse_fceux(cls, data: bytes) -> Tuple[bytes, bytes]:
        """Parse FCEUX CDL format (raw)"""
        # FCEUX CDL files are typically PRG only
        return data, b''


class CoverageProject:
    """Manage coverage tracking for a project"""
    
    def __init__(self, project_dir: str):
        self.project_dir = project_dir
        self.config_file = os.path.join(project_dir, 'coverage_config.json')
        self.history_file = os.path.join(project_dir, 'coverage_history.json')
        
        self.config: Dict = {}
        self.history: List[CoverageSnapshot] = []
        
        self._load()
    
    def _load(self):
        """Load project data"""
        if os.path.exists(self.config_file):
            with open(self.config_file, 'r', encoding='utf-8') as f:
                self.config = json.load(f)
        
        if os.path.exists(self.history_file):
            with open(self.history_file, 'r', encoding='utf-8') as f:
                data = json.load(f)
                self.history = [CoverageSnapshot(**s) for s in data.get('snapshots', [])]
    
    def _save(self):
        """Save project data"""
        os.makedirs(self.project_dir, exist_ok=True)
        
        with open(self.config_file, 'w', encoding='utf-8') as f:
            json.dump(self.config, f, indent=2)
        
        with open(self.history_file, 'w', encoding='utf-8') as f:
            json.dump({
                'snapshots': [asdict(s) for s in self.history]
            }, f, indent=2)
    
    def init(self, name: str, goal: float = 100.0):
        """Initialize a new project"""
        self.config = {
            'name': name,
            'created': datetime.now().isoformat(),
            'goal': goal,
            'alerts': {
                'regression_threshold': 0.1,  # Alert if coverage drops by > 0.1%
                'milestone_thresholds': [25, 50, 75, 90, 95, 99]
            }
        }
        self._save()
    
    def add_snapshot(self, cdl_file: str, name: str = "", notes: str = "") -> CoverageSnapshot:
        """Add a new coverage snapshot"""
        snapshot = CDLAnalyzer.analyze(cdl_file)
        snapshot.name = name or f"snapshot_{len(self.history) + 1}"
        snapshot.notes = notes
        
        self.history.append(snapshot)
        self._save()
        
        return snapshot
    
    def get_latest(self) -> Optional[CoverageSnapshot]:
        """Get the latest snapshot"""
        return self.history[-1] if self.history else None
    
    def get_snapshot(self, name: str) -> Optional[CoverageSnapshot]:
        """Get a snapshot by name"""
        for s in self.history:
            if s.name == name:
                return s
        return None
    
    def compare(self, name1: str, name2: str) -> Dict:
        """Compare two snapshots"""
        s1 = self.get_snapshot(name1)
        s2 = self.get_snapshot(name2)
        
        if not s1 or not s2:
            return {'error': 'Snapshot not found'}
        
        return {
            'snapshot1': name1,
            'snapshot2': name2,
            'coverage_delta': s2.coverage_percent - s1.coverage_percent,
            'prg_code_delta': s2.prg_code - s1.prg_code,
            'prg_data_delta': s2.prg_data - s1.prg_data,
            'chr_delta': (s2.chr_read + s2.chr_drawn) - (s1.chr_read + s1.chr_drawn),
            'time_delta': s2.timestamp
        }
    
    def get_trend(self, last_n: int = 10) -> List[Dict]:
        """Get coverage trend for last N snapshots"""
        snapshots = self.history[-last_n:] if len(self.history) >= last_n else self.history
        
        return [
            {
                'name': s.name,
                'timestamp': s.timestamp,
                'coverage': s.coverage_percent,
                'prg_coverage': s.prg_coverage,
                'chr_coverage': s.chr_coverage
            }
            for s in snapshots
        ]
    
    def check_alerts(self) -> List[str]:
        """Check for alert conditions"""
        alerts = []
        
        if len(self.history) < 2:
            return alerts
        
        latest = self.history[-1]
        previous = self.history[-2]
        
        # Check for regression
        threshold = self.config.get('alerts', {}).get('regression_threshold', 0.1)
        if previous.coverage_percent - latest.coverage_percent > threshold:
            alerts.append(
                f"Coverage regression: {previous.coverage_percent:.2f}% -> {latest.coverage_percent:.2f}%"
            )
        
        # Check for milestone
        milestones = self.config.get('alerts', {}).get('milestone_thresholds', [])
        for milestone in milestones:
            if previous.coverage_percent < milestone <= latest.coverage_percent:
                alerts.append(f"Milestone reached: {milestone}% coverage!")
        
        # Check goal
        goal = self.config.get('goal', 100.0)
        if previous.coverage_percent < goal <= latest.coverage_percent:
            alerts.append(f"Goal reached: {goal}% coverage!")
        
        return alerts
    
    def generate_report(self, format: str = 'text') -> str:
        """Generate a coverage report"""
        if format == 'text':
            return self._generate_text_report()
        elif format == 'markdown':
            return self._generate_markdown_report()
        elif format == 'json':
            return self._generate_json_report()
        elif format == 'html':
            return self._generate_html_report()
        return ""
    
    def _generate_text_report(self) -> str:
        """Generate text report"""
        lines = [
            f"Coverage Report: {self.config.get('name', 'Unknown')}",
            "=" * 50,
            ""
        ]
        
        if not self.history:
            lines.append("No snapshots recorded.")
            return '\n'.join(lines)
        
        latest = self.history[-1]
        
        lines.extend([
            f"Latest Snapshot: {latest.name}",
            f"Timestamp: {latest.timestamp}",
            "",
            "Coverage Summary:",
            f"  Total: {latest.coverage_percent:.2f}%",
            f"  PRG ROM: {latest.prg_coverage:.2f}%",
            f"    Code: {latest.prg_code:,} bytes",
            f"    Data: {latest.prg_data:,} bytes",
            f"    PCM:  {latest.prg_pcm:,} bytes",
        ])
        
        if latest.chr_size > 0:
            lines.extend([
                f"  CHR ROM: {latest.chr_coverage:.2f}%",
                f"    Read:  {latest.chr_read:,} bytes",
                f"    Drawn: {latest.chr_drawn:,} bytes",
            ])
        
        # Goal progress
        goal = self.config.get('goal', 100.0)
        lines.extend([
            "",
            f"Goal: {goal}%",
            f"Progress: {latest.coverage_percent / goal * 100:.1f}%"
        ])
        
        # Trend
        if len(self.history) > 1:
            trend = self.get_trend(5)
            lines.extend([
                "",
                "Recent Trend:",
            ])
            for t in trend:
                lines.append(f"  {t['name']}: {t['coverage']:.2f}%")
        
        return '\n'.join(lines)
    
    def _generate_markdown_report(self) -> str:
        """Generate markdown report"""
        lines = [
            f"# Coverage Report: {self.config.get('name', 'Unknown')}",
            ""
        ]
        
        if not self.history:
            lines.append("No snapshots recorded.")
            return '\n'.join(lines)
        
        latest = self.history[-1]
        
        lines.extend([
            f"## Latest: {latest.name}",
            f"*{latest.timestamp}*",
            "",
            "### Summary",
            "",
            "| Metric | Value |",
            "|--------|-------|",
            f"| Total Coverage | {latest.coverage_percent:.2f}% |",
            f"| PRG Coverage | {latest.prg_coverage:.2f}% |",
            f"| Code | {latest.prg_code:,} bytes |",
            f"| Data | {latest.prg_data:,} bytes |",
        ])
        
        if latest.chr_size > 0:
            lines.extend([
                f"| CHR Coverage | {latest.chr_coverage:.2f}% |",
            ])
        
        # Trend table
        if len(self.history) > 1:
            lines.extend([
                "",
                "### Trend",
                "",
                "| Snapshot | Coverage | PRG | CHR |",
                "|----------|----------|-----|-----|",
            ])
            for t in self.get_trend(10):
                lines.append(
                    f"| {t['name']} | {t['coverage']:.2f}% | "
                    f"{t['prg_coverage']:.2f}% | {t['chr_coverage']:.2f}% |"
                )
        
        return '\n'.join(lines)
    
    def _generate_json_report(self) -> str:
        """Generate JSON report"""
        latest = self.history[-1] if self.history else None
        
        report = {
            'project': self.config.get('name', 'Unknown'),
            'goal': self.config.get('goal', 100.0),
            'latest': asdict(latest) if latest else None,
            'trend': self.get_trend(10),
            'alerts': self.check_alerts()
        }
        
        return json.dumps(report, indent=2)
    
    def _generate_html_report(self) -> str:
        """Generate HTML report with chart"""
        if not self.history:
            return "<html><body><p>No snapshots recorded.</p></body></html>"
        
        latest = self.history[-1]
        trend = self.get_trend(20)
        
        # Chart data
        labels = [t['name'] for t in trend]
        coverage_data = [t['coverage'] for t in trend]
        prg_data = [t['prg_coverage'] for t in trend]
        
        return f"""<!DOCTYPE html>
<html>
<head>
    <title>Coverage Report - {self.config.get('name', 'Unknown')}</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        body {{ font-family: sans-serif; margin: 20px; }}
        .summary {{ display: grid; grid-template-columns: repeat(3, 1fr); gap: 20px; margin: 20px 0; }}
        .card {{ background: #f5f5f5; padding: 20px; border-radius: 8px; }}
        .card h3 {{ margin: 0 0 10px 0; }}
        .value {{ font-size: 2em; font-weight: bold; color: #333; }}
        .chart-container {{ max-width: 800px; margin: 20px 0; }}
        table {{ border-collapse: collapse; width: 100%; margin: 20px 0; }}
        th, td {{ border: 1px solid #ddd; padding: 8px; text-align: left; }}
        th {{ background: #f0f0f0; }}
    </style>
</head>
<body>
    <h1>Coverage Report: {self.config.get('name', 'Unknown')}</h1>
    <p>Latest: {latest.name} ({latest.timestamp})</p>
    
    <div class="summary">
        <div class="card">
            <h3>Total Coverage</h3>
            <div class="value">{latest.coverage_percent:.1f}%</div>
        </div>
        <div class="card">
            <h3>PRG Coverage</h3>
            <div class="value">{latest.prg_coverage:.1f}%</div>
        </div>
        <div class="card">
            <h3>CHR Coverage</h3>
            <div class="value">{latest.chr_coverage:.1f}%</div>
        </div>
    </div>
    
    <h2>Coverage Trend</h2>
    <div class="chart-container">
        <canvas id="trendChart"></canvas>
    </div>
    
    <h2>Details</h2>
    <table>
        <tr><th>PRG ROM Size</th><td>{latest.prg_size:,} bytes</td></tr>
        <tr><th>Code</th><td>{latest.prg_code:,} bytes</td></tr>
        <tr><th>Data</th><td>{latest.prg_data:,} bytes</td></tr>
        <tr><th>PCM</th><td>{latest.prg_pcm:,} bytes</td></tr>
        <tr><th>CHR ROM Size</th><td>{latest.chr_size:,} bytes</td></tr>
        <tr><th>CHR Read</th><td>{latest.chr_read:,} bytes</td></tr>
        <tr><th>CHR Drawn</th><td>{latest.chr_drawn:,} bytes</td></tr>
    </table>
    
    <script>
        new Chart(document.getElementById('trendChart'), {{
            type: 'line',
            data: {{
                labels: {json.dumps(labels)},
                datasets: [{{
                    label: 'Total Coverage',
                    data: {json.dumps(coverage_data)},
                    borderColor: '#2196F3',
                    fill: false
                }}, {{
                    label: 'PRG Coverage',
                    data: {json.dumps(prg_data)},
                    borderColor: '#4CAF50',
                    fill: false
                }}]
            }},
            options: {{
                responsive: true,
                scales: {{
                    y: {{
                        beginAtZero: true,
                        max: 100
                    }}
                }}
            }}
        }});
    </script>
</body>
</html>"""


def main():
    parser = argparse.ArgumentParser(
        description='CDL Coverage Tracker',
        formatter_class=argparse.RawDescriptionHelpFormatter
    )
    parser.add_argument('--project-dir', '-d', default='.coverage',
                        help='Project directory (default: .coverage)')
    
    subparsers = parser.add_subparsers(dest='command', help='Commands')
    
    # Init command
    init_parser = subparsers.add_parser('init', help='Initialize coverage tracking')
    init_parser.add_argument('--project', '-p', required=True, help='Project name')
    init_parser.add_argument('--goal', '-g', type=float, default=100.0,
                             help='Coverage goal percentage')
    
    # Add command
    add_parser = subparsers.add_parser('add', help='Add a coverage snapshot')
    add_parser.add_argument('cdl_file', help='CDL file to analyze')
    add_parser.add_argument('--name', '-n', help='Snapshot name')
    add_parser.add_argument('--notes', help='Snapshot notes')
    
    # Report command
    report_parser = subparsers.add_parser('report', help='Generate coverage report')
    report_parser.add_argument('--format', '-f', choices=['text', 'markdown', 'json', 'html'],
                               default='text', help='Report format')
    report_parser.add_argument('--output', '-o', help='Output file')
    
    # Compare command
    compare_parser = subparsers.add_parser('compare', help='Compare two snapshots')
    compare_parser.add_argument('snapshot1', help='First snapshot name')
    compare_parser.add_argument('snapshot2', help='Second snapshot name')
    
    # Analyze command (one-off analysis)
    analyze_parser = subparsers.add_parser('analyze', help='Analyze a CDL file')
    analyze_parser.add_argument('cdl_file', help='CDL file to analyze')
    
    # CI command
    ci_parser = subparsers.add_parser('ci', help='CI/CD integration')
    ci_parser.add_argument('cdl_file', help='CDL file to analyze')
    ci_parser.add_argument('--name', '-n', help='Snapshot name')
    ci_parser.add_argument('--fail-on-regression', action='store_true',
                           help='Exit with error if coverage regresses')
    ci_parser.add_argument('--min-coverage', type=float,
                           help='Minimum coverage percentage required')
    
    args = parser.parse_args()
    
    if args.command == 'init':
        project = CoverageProject(args.project_dir)
        project.init(args.project, args.goal)
        print(f"Initialized coverage tracking for '{args.project}'")
        print(f"Goal: {args.goal}%")
    
    elif args.command == 'add':
        project = CoverageProject(args.project_dir)
        snapshot = project.add_snapshot(args.cdl_file, args.name, args.notes or "")
        print(f"Added snapshot: {snapshot.name}")
        print(f"Coverage: {snapshot.coverage_percent:.2f}%")
        
        # Check alerts
        alerts = project.check_alerts()
        for alert in alerts:
            print(f"  ** {alert}")
    
    elif args.command == 'report':
        project = CoverageProject(args.project_dir)
        report = project.generate_report(args.format)
        
        if args.output:
            with open(args.output, 'w', encoding='utf-8') as f:
                f.write(report)
            print(f"Report saved to {args.output}")
        else:
            print(report)
    
    elif args.command == 'compare':
        project = CoverageProject(args.project_dir)
        result = project.compare(args.snapshot1, args.snapshot2)
        
        if 'error' in result:
            print(f"Error: {result['error']}")
            sys.exit(1)
        
        print(f"Comparing {args.snapshot1} -> {args.snapshot2}")
        print(f"Coverage delta: {result['coverage_delta']:+.2f}%")
        print(f"PRG code delta: {result['prg_code_delta']:+,} bytes")
        print(f"PRG data delta: {result['prg_data_delta']:+,} bytes")
    
    elif args.command == 'analyze':
        snapshot = CDLAnalyzer.analyze(args.cdl_file)
        print(f"CDL Analysis: {args.cdl_file}")
        print(f"  PRG Size: {snapshot.prg_size:,} bytes")
        print(f"  Code: {snapshot.prg_code:,} bytes ({snapshot.prg_code/snapshot.prg_size*100:.1f}%)")
        print(f"  Data: {snapshot.prg_data:,} bytes ({snapshot.prg_data/snapshot.prg_size*100:.1f}%)")
        if snapshot.chr_size > 0:
            print(f"  CHR Size: {snapshot.chr_size:,} bytes")
            print(f"  CHR Coverage: {snapshot.chr_coverage:.1f}%")
        print(f"  Total Coverage: {snapshot.coverage_percent:.2f}%")
    
    elif args.command == 'ci':
        project = CoverageProject(args.project_dir)
        snapshot = project.add_snapshot(args.cdl_file, args.name)
        
        print(f"::group::Coverage Report")
        print(f"Coverage: {snapshot.coverage_percent:.2f}%")
        print(f"PRG: {snapshot.prg_coverage:.2f}%")
        print(f"::endgroup::")
        
        exit_code = 0
        
        # Check for regression
        if args.fail_on_regression and len(project.history) > 1:
            prev = project.history[-2]
            if snapshot.coverage_percent < prev.coverage_percent - 0.1:
                print(f"::error::Coverage regression detected: "
                      f"{prev.coverage_percent:.2f}% -> {snapshot.coverage_percent:.2f}%")
                exit_code = 1
        
        # Check minimum coverage
        if args.min_coverage and snapshot.coverage_percent < args.min_coverage:
            print(f"::error::Coverage {snapshot.coverage_percent:.2f}% "
                  f"is below minimum {args.min_coverage}%")
            exit_code = 1
        
        # Output for GitHub Actions
        print(f"::set-output name=coverage::{snapshot.coverage_percent:.2f}")
        print(f"::set-output name=prg_coverage::{snapshot.prg_coverage:.2f}")
        
        sys.exit(exit_code)
    
    else:
        parser.print_help()


if __name__ == '__main__':
    main()
