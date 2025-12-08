#!/usr/bin/env python3
"""
Test suite for CDL tools

Run with: python -m pytest tests/ -v
Or: python test_cdl_tools.py
"""

import io
import os
import sys
import tempfile
import unittest
from pathlib import Path

# Add parent directory to path for imports
sys.path.insert(0, str(Path(__file__).parent.parent / 'tools'))

from cdl_editor import CDLFile, CDLStats, CDLRegion
from cdl_build import CDLBuilder, BuildConfig, BuildResult
from cdl_converter import CDLConverter, CDLFormat
from cdl_visualizer import CDLVisualizer


class TestCDLFile(unittest.TestCase):
    """Tests for CDLFile class"""
    
    def setUp(self):
        """Create a temporary CDL file for testing"""
        self.temp_dir = tempfile.mkdtemp()
        self.test_cdl_path = os.path.join(self.temp_dir, 'test.cdl')
        
        # Create test CDL data
        # Pattern: code, data, rendered, unused, mixed, repeat
        test_data = bytearray(1024)
        for i in range(0, 1024, 5):
            test_data[i] = 0x01      # Code
            if i + 1 < 1024:
                test_data[i + 1] = 0x02  # Data
            if i + 2 < 1024:
                test_data[i + 2] = 0x04  # Rendered
            if i + 3 < 1024:
                test_data[i + 3] = 0x00  # Unused
            if i + 4 < 1024:
                test_data[i + 4] = 0x03  # Mixed (code + data)
        
        with open(self.test_cdl_path, 'wb') as f:
            f.write(test_data)
    
    def tearDown(self):
        """Clean up temporary files"""
        import shutil
        shutil.rmtree(self.temp_dir, ignore_errors=True)
    
    def test_load_cdl(self):
        """Test loading a CDL file"""
        cdl = CDLFile(self.test_cdl_path)
        self.assertEqual(len(cdl), 1024)
    
    def test_get_byte(self):
        """Test getting individual bytes"""
        cdl = CDLFile(self.test_cdl_path)
        self.assertEqual(cdl.get_byte(0), 0x01)  # Code
        self.assertEqual(cdl.get_byte(1), 0x02)  # Data
        self.assertEqual(cdl.get_byte(2), 0x04)  # Rendered
        self.assertEqual(cdl.get_byte(3), 0x00)  # Unused
    
    def test_set_byte(self):
        """Test setting individual bytes"""
        cdl = CDLFile(self.test_cdl_path)
        cdl.set_byte(0, 0xFF)
        self.assertEqual(cdl.get_byte(0), 0xFF)
    
    def test_set_flag(self):
        """Test setting flags"""
        cdl = CDLFile(self.test_cdl_path)
        cdl.set_flag(3, 0x01)  # Set code flag on unused byte
        self.assertEqual(cdl.get_byte(3), 0x01)
    
    def test_clear_flag(self):
        """Test clearing flags"""
        cdl = CDLFile(self.test_cdl_path)
        cdl.clear_flag(0, 0x01)  # Clear code flag
        self.assertEqual(cdl.get_byte(0), 0x00)
    
    def test_mark_code(self):
        """Test marking a range as code"""
        cdl = CDLFile(self.test_cdl_path)
        cdl.mark_code(100, 109)
        for i in range(100, 110):
            self.assertTrue(cdl.get_byte(i) & 0x01)
    
    def test_mark_data(self):
        """Test marking a range as data"""
        cdl = CDLFile(self.test_cdl_path)
        cdl.mark_data(200, 209)
        for i in range(200, 210):
            self.assertTrue(cdl.get_byte(i) & 0x02)
    
    def test_clear_range(self):
        """Test clearing a range"""
        cdl = CDLFile(self.test_cdl_path)
        cdl.clear_range(0, 99)
        for i in range(100):
            self.assertEqual(cdl.get_byte(i), 0x00)
    
    def test_get_stats(self):
        """Test statistics calculation"""
        cdl = CDLFile(self.test_cdl_path)
        stats = cdl.get_stats()
        
        self.assertEqual(stats.total_bytes, 1024)
        self.assertGreater(stats.code_bytes, 0)
        self.assertGreater(stats.data_bytes, 0)
        self.assertGreater(stats.rendered_bytes, 0)
        self.assertGreater(stats.unused_bytes, 0)
        self.assertGreater(stats.mixed_bytes, 0)
    
    def test_get_bank_stats(self):
        """Test per-bank statistics"""
        cdl = CDLFile(self.test_cdl_path)
        bank_stats = cdl.get_bank_stats(bank_size=256)
        
        self.assertEqual(len(bank_stats), 4)  # 1024 / 256 = 4 banks
    
    def test_merge(self):
        """Test merging two CDL files"""
        # Create second CDL file with different data
        second_path = os.path.join(self.temp_dir, 'test2.cdl')
        second_data = bytearray(1024)
        for i in range(512, 1024):
            second_data[i] = 0x02  # Mark second half as data
        
        with open(second_path, 'wb') as f:
            f.write(second_data)
        
        cdl1 = CDLFile(self.test_cdl_path)
        cdl2 = CDLFile(second_path)
        
        original_first_byte = cdl1.get_byte(0)
        cdl1.merge(cdl2)
        
        # First byte should still have original flags
        self.assertEqual(cdl1.get_byte(0), original_first_byte)
        # Byte at 512 should now have data flag from merge
        self.assertTrue(cdl1.get_byte(512) & 0x02)
    
    def test_save(self):
        """Test saving a CDL file"""
        cdl = CDLFile(self.test_cdl_path)
        cdl.set_byte(0, 0xFF)
        
        save_path = os.path.join(self.temp_dir, 'saved.cdl')
        cdl.save(save_path)
        
        # Load and verify
        cdl2 = CDLFile(save_path)
        self.assertEqual(cdl2.get_byte(0), 0xFF)
    
    def test_export_csv(self):
        """Test CSV export"""
        cdl = CDLFile(self.test_cdl_path)
        csv_path = os.path.join(self.temp_dir, 'test.csv')
        cdl.export_csv(csv_path)
        
        self.assertTrue(os.path.exists(csv_path))
        with open(csv_path) as f:
            lines = f.readlines()
        self.assertGreater(len(lines), 1)  # Header + data
    
    def test_export_json(self):
        """Test JSON export"""
        cdl = CDLFile(self.test_cdl_path)
        json_path = os.path.join(self.temp_dir, 'test.json')
        cdl.export_json(json_path)
        
        self.assertTrue(os.path.exists(json_path))
        
        import json
        with open(json_path) as f:
            data = json.load(f)
        
        self.assertIn('statistics', data)
        self.assertIn('coverage_percent', data['statistics'])
    
    def test_find_regions(self):
        """Test finding regions"""
        cdl = CDLFile(self.test_cdl_path)
        regions = cdl.find_regions('unused')
        
        self.assertGreater(len(regions), 0)
        for region in regions:
            self.assertEqual(region.region_type, 'unused')


class TestCDLBuilder(unittest.TestCase):
    """Tests for CDLBuilder class"""
    
    def setUp(self):
        """Create temporary files for testing"""
        self.temp_dir = tempfile.mkdtemp()
        
        # Create multiple CDL files to merge
        for i in range(3):
            path = os.path.join(self.temp_dir, f'session{i}.cdl')
            data = bytearray(1024)
            # Each session covers different parts
            start = i * 300
            end = min(start + 400, 1024)
            for j in range(start, end):
                data[j] = 0x01  # Code
            with open(path, 'wb') as f:
                f.write(data)
    
    def tearDown(self):
        """Clean up"""
        import shutil
        shutil.rmtree(self.temp_dir, ignore_errors=True)
    
    def test_merge_files(self):
        """Test merging multiple CDL files"""
        builder = CDLBuilder()
        builder.verbose = False
        
        inputs = [
            os.path.join(self.temp_dir, 'session0.cdl'),
            os.path.join(self.temp_dir, 'session1.cdl'),
            os.path.join(self.temp_dir, 'session2.cdl'),
        ]
        output = os.path.join(self.temp_dir, 'merged.cdl')
        
        result = builder.merge_files(output, inputs)
        
        self.assertTrue(result.success)
        self.assertEqual(result.merged_count, 3)
        self.assertTrue(os.path.exists(output))
    
    def test_create_diff(self):
        """Test creating differential CDL"""
        builder = CDLBuilder()
        builder.verbose = False
        
        old_path = os.path.join(self.temp_dir, 'session0.cdl')
        new_path = os.path.join(self.temp_dir, 'session1.cdl')
        diff_path = os.path.join(self.temp_dir, 'diff.cdl')
        
        result, diff_data = builder.create_diff(old_path, new_path, diff_path)
        
        self.assertTrue(result.success)
        self.assertTrue(os.path.exists(diff_path))
    
    def test_validate(self):
        """Test CDL validation"""
        builder = CDLBuilder()
        builder.verbose = False
        
        cdl_path = os.path.join(self.temp_dir, 'session0.cdl')
        result = builder.validate(cdl_path, expected_size=1024)
        
        self.assertTrue(result.success)
        self.assertIsNotNone(result.stats)
    
    def test_generate_report(self):
        """Test HTML report generation"""
        builder = CDLBuilder()
        builder.verbose = False
        
        cdl_path = os.path.join(self.temp_dir, 'session0.cdl')
        report_path = os.path.join(self.temp_dir, 'report.html')
        
        result = builder.generate_report(cdl_path, report_path, "Test ROM")
        
        self.assertTrue(result.success)
        self.assertTrue(os.path.exists(report_path))
        
        with open(report_path) as f:
            content = f.read()
        self.assertIn('Test ROM', content)
        self.assertIn('Coverage', content)


class TestCDLConverter(unittest.TestCase):
    """Tests for CDLConverter class"""
    
    def setUp(self):
        """Create temporary files"""
        self.temp_dir = tempfile.mkdtemp()
        
        # Create FCEUX-style CDL
        self.fceux_path = os.path.join(self.temp_dir, 'fceux.cdl')
        data = bytearray(0x4000)  # 16KB - common NES bank size
        for i in range(0, 0x4000, 4):
            data[i] = 0x01      # Code
            data[i + 1] = 0x02  # Data
            data[i + 2] = 0x04  # Rendered
        with open(self.fceux_path, 'wb') as f:
            f.write(data)
    
    def tearDown(self):
        """Clean up"""
        import shutil
        shutil.rmtree(self.temp_dir, ignore_errors=True)
    
    def test_detect_format(self):
        """Test format detection"""
        converter = CDLConverter()
        converter.verbose = False
        
        fmt, header = converter.detect_format(self.fceux_path)
        
        self.assertEqual(fmt, CDLFormat.FCEUX)
        self.assertEqual(header.prg_size, 0x4000)
    
    def test_convert_fceux_to_mesen(self):
        """Test FCEUX to Mesen conversion"""
        converter = CDLConverter()
        converter.verbose = False
        
        output_path = os.path.join(self.temp_dir, 'mesen.cdl')
        result = converter.convert(
            self.fceux_path, output_path,
            source_format=CDLFormat.FCEUX,
            target_format=CDLFormat.MESEN
        )
        
        self.assertTrue(result)
        self.assertTrue(os.path.exists(output_path))
    
    def test_convert_roundtrip(self):
        """Test converting FCEUX -> Mesen -> FCEUX preserves data"""
        converter = CDLConverter()
        converter.verbose = False
        
        mesen_path = os.path.join(self.temp_dir, 'mesen.cdl')
        roundtrip_path = os.path.join(self.temp_dir, 'roundtrip.cdl')
        
        # Convert to Mesen
        converter.convert(self.fceux_path, mesen_path,
                         target_format=CDLFormat.MESEN)
        
        # Convert back to FCEUX
        converter.convert(mesen_path, roundtrip_path,
                         target_format=CDLFormat.FCEUX)
        
        # Validate
        result = converter.validate_conversion(self.fceux_path, roundtrip_path)
        
        self.assertTrue(result['valid'])
        self.assertTrue(result['coverage_preserved'])
    
    def test_byte_conversion_fceux_mesen(self):
        """Test individual byte conversion"""
        converter = CDLConverter()
        
        # Test code flag
        fceux_code = 0x01
        mesen_code = converter.convert_byte_fceux_to_mesen(fceux_code)
        self.assertEqual(mesen_code & 0x01, 0x01)
        
        # Test data flag
        fceux_data = 0x02
        mesen_data = converter.convert_byte_fceux_to_mesen(fceux_data)
        self.assertEqual(mesen_data & 0x02, 0x02)


class TestCDLVisualizer(unittest.TestCase):
    """Tests for CDLVisualizer class"""
    
    def setUp(self):
        """Create temporary files"""
        self.temp_dir = tempfile.mkdtemp()
        
        # Create test CDL
        self.cdl_path = os.path.join(self.temp_dir, 'test.cdl')
        data = bytearray(0x4000)
        for i in range(0, 0x2000):
            data[i] = 0x01  # First half: code
        for i in range(0x2000, 0x4000):
            data[i] = 0x02  # Second half: data
        with open(self.cdl_path, 'wb') as f:
            f.write(data)
    
    def tearDown(self):
        """Clean up"""
        import shutil
        shutil.rmtree(self.temp_dir, ignore_errors=True)
    
    def test_generate_html(self):
        """Test HTML heatmap generation"""
        visualizer = CDLVisualizer(self.cdl_path)
        output_path = os.path.join(self.temp_dir, 'heatmap.html')
        
        visualizer.generate_html_heatmap(output_path, "Test Visualization")
        
        self.assertTrue(os.path.exists(output_path))
        
        with open(output_path) as f:
            content = f.read()
        
        self.assertIn('Test Visualization', content)
        self.assertIn('heatmap', content)
    
    def test_generate_svg(self):
        """Test SVG heatmap generation"""
        visualizer = CDLVisualizer(self.cdl_path)
        output_path = os.path.join(self.temp_dir, 'heatmap.svg')
        
        visualizer.generate_svg_heatmap(output_path, "Test SVG")
        
        self.assertTrue(os.path.exists(output_path))
        
        with open(output_path) as f:
            content = f.read()
        
        self.assertIn('<svg', content)
        self.assertIn('Test SVG', content)
    
    def test_classify_byte(self):
        """Test byte classification"""
        visualizer = CDLVisualizer(self.cdl_path)
        
        self.assertEqual(visualizer._classify_byte(0x00), 'unused')
        self.assertEqual(visualizer._classify_byte(0x01), 'code')
        self.assertEqual(visualizer._classify_byte(0x02), 'data')
        self.assertEqual(visualizer._classify_byte(0x04), 'rendered')
        self.assertEqual(visualizer._classify_byte(0x03), 'mixed')
    
    def test_get_block_stats(self):
        """Test block statistics"""
        visualizer = CDLVisualizer(self.cdl_path)
        
        # First half should be all code
        stats = visualizer._get_block_stats(0, 0x2000)
        self.assertEqual(stats.code, 0x2000)
        
        # Second half should be all data
        stats = visualizer._get_block_stats(0x2000, 0x4000)
        self.assertEqual(stats.data, 0x2000)


class TestCDLStats(unittest.TestCase):
    """Tests for CDLStats dataclass"""
    
    def test_percentages(self):
        """Test percentage calculations"""
        stats = CDLStats(
            total_bytes=1000,
            code_bytes=400,
            data_bytes=300,
            rendered_bytes=100,
            unused_bytes=150,
            mixed_bytes=50
        )
        
        self.assertEqual(stats.code_percent, 40.0)
        self.assertEqual(stats.data_percent, 30.0)
        self.assertEqual(stats.coverage_percent, 85.0)
    
    def test_zero_total(self):
        """Test with zero total bytes"""
        stats = CDLStats(0, 0, 0, 0, 0, 0)
        
        self.assertEqual(stats.code_percent, 0)
        self.assertEqual(stats.coverage_percent, 0)


def run_tests():
    """Run all tests"""
    loader = unittest.TestLoader()
    suite = unittest.TestSuite()
    
    # Add test classes
    suite.addTests(loader.loadTestsFromTestCase(TestCDLFile))
    suite.addTests(loader.loadTestsFromTestCase(TestCDLBuilder))
    suite.addTests(loader.loadTestsFromTestCase(TestCDLConverter))
    suite.addTests(loader.loadTestsFromTestCase(TestCDLVisualizer))
    suite.addTests(loader.loadTestsFromTestCase(TestCDLStats))
    
    # Run with verbosity
    runner = unittest.TextTestRunner(verbosity=2)
    result = runner.run(suite)
    
    return len(result.failures) + len(result.errors) == 0


if __name__ == '__main__':
    success = run_tests()
    sys.exit(0 if success else 1)
