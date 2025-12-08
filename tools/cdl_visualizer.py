#!/usr/bin/env python3
"""
CDL Visualization Tool

Creates visual heatmaps and coverage visualizations for CDL files.

Features:
- Memory map heatmaps showing coverage density
- Bank-by-bank visual comparison
- PNG/SVG export
- Interactive HTML viewer
- Timeline view for coverage growth

Usage:
    python cdl_visualizer.py <cdl_file> [options]

Options:
    --output, -o      Output file (default: output.html)
    --format, -f      Output format: html, png, svg (default: html)
    --width           Image width in pixels (default: 1024)
    --height          Image height in pixels (default: auto)
    --bank-size       Bank size in bytes (default: 16384)
    --title           Title for the visualization
"""

import argparse
import colorsys
import html
import math
import os
import struct
import sys
from dataclasses import dataclass
from pathlib import Path
from typing import Dict, List, Optional, Tuple

# Try to import PIL for PNG output
try:
    from PIL import Image, ImageDraw, ImageFont
    HAS_PIL = True
except ImportError:
    HAS_PIL = False


@dataclass
class CDLStats:
    """Statistics for a region"""
    total: int
    code: int
    data: int
    rendered: int
    unused: int
    mixed: int
    
    @property
    def coverage(self) -> float:
        return ((self.total - self.unused) / self.total * 100) if self.total > 0 else 0


class CDLVisualizer:
    """Generates visualizations from CDL files"""
    
    # Color scheme
    COLORS = {
        'code': '#4CAF50',       # Green
        'data': '#FF9800',       # Orange
        'rendered': '#2196F3',   # Blue
        'unused': '#9E9E9E',     # Gray
        'mixed': '#E91E63',      # Pink
        'background': '#1E1E1E', # Dark background
        'grid': '#333333',       # Grid lines
        'text': '#FFFFFF',       # White text
    }
    
    def __init__(self, cdl_path: str):
        self.cdl_path = cdl_path
        self.data = self._load_cdl(cdl_path)
        self.filename = os.path.basename(cdl_path)
    
    def _load_cdl(self, path: str) -> bytearray:
        """Load CDL file data"""
        with open(path, 'rb') as f:
            return bytearray(f.read())
    
    def _classify_byte(self, byte: int) -> str:
        """Classify a CDL byte into a type"""
        if byte == 0:
            return 'unused'
        is_code = bool(byte & 0x01)
        is_data = bool(byte & 0x02)
        is_rendered = bool(byte & 0x04)
        
        if is_code and is_data:
            return 'mixed'
        elif is_code:
            return 'code'
        elif is_data:
            return 'data'
        elif is_rendered:
            return 'rendered'
        else:
            return 'data'  # Other flags count as data
    
    def _get_block_stats(self, start: int, end: int) -> CDLStats:
        """Get statistics for a block of bytes"""
        code = data = rendered = unused = mixed = 0
        
        for i in range(start, min(end, len(self.data))):
            byte_type = self._classify_byte(self.data[i])
            if byte_type == 'unused':
                unused += 1
            elif byte_type == 'code':
                code += 1
            elif byte_type == 'data':
                data += 1
            elif byte_type == 'rendered':
                rendered += 1
            elif byte_type == 'mixed':
                mixed += 1
        
        total = min(end, len(self.data)) - start
        return CDLStats(total, code, data, rendered, unused, mixed)
    
    def _get_dominant_type(self, start: int, end: int) -> Tuple[str, float]:
        """Get the dominant type and its percentage for a block"""
        stats = self._get_block_stats(start, end)
        
        types = {
            'code': stats.code,
            'data': stats.data,
            'rendered': stats.rendered,
            'unused': stats.unused,
            'mixed': stats.mixed
        }
        
        dominant = max(types, key=types.get)
        percentage = types[dominant] / stats.total if stats.total > 0 else 0
        
        return dominant, percentage
    
    def _blend_color(self, color1: str, color2: str, ratio: float) -> str:
        """Blend two hex colors"""
        def hex_to_rgb(hex_color: str) -> Tuple[int, int, int]:
            hex_color = hex_color.lstrip('#')
            return tuple(int(hex_color[i:i+2], 16) for i in (0, 2, 4))
        
        def rgb_to_hex(rgb: Tuple[int, int, int]) -> str:
            return '#{:02x}{:02x}{:02x}'.format(*rgb)
        
        r1, g1, b1 = hex_to_rgb(color1)
        r2, g2, b2 = hex_to_rgb(color2)
        
        r = int(r1 * (1 - ratio) + r2 * ratio)
        g = int(g1 * (1 - ratio) + g2 * ratio)
        b = int(b1 * (1 - ratio) + b2 * ratio)
        
        return rgb_to_hex((r, g, b))
    
    def generate_html_heatmap(self, output_path: str, title: Optional[str] = None,
                              block_size: int = 256, width: int = 64) -> None:
        """Generate an interactive HTML heatmap"""
        
        title = title or f"CDL Coverage: {self.filename}"
        total_blocks = (len(self.data) + block_size - 1) // block_size
        height = (total_blocks + width - 1) // width
        
        # Generate block data
        blocks = []
        for i in range(total_blocks):
            start = i * block_size
            end = start + block_size
            dom_type, percentage = self._get_dominant_type(start, end)
            stats = self._get_block_stats(start, end)
            
            blocks.append({
                'offset': start,
                'type': dom_type,
                'percentage': percentage,
                'coverage': stats.coverage,
                'code': stats.code,
                'data': stats.data,
                'rendered': stats.rendered,
                'unused': stats.unused
            })
        
        # Calculate overall stats
        overall = self._get_block_stats(0, len(self.data))
        
        html_content = f'''<!DOCTYPE html>
<html>
<head>
    <title>{html.escape(title)}</title>
    <style>
        * {{ box-sizing: border-box; margin: 0; padding: 0; }}
        body {{
            font-family: 'Segoe UI', Arial, sans-serif;
            background: {self.COLORS['background']};
            color: {self.COLORS['text']};
            padding: 20px;
        }}
        .container {{
            max-width: 1400px;
            margin: 0 auto;
        }}
        h1 {{
            margin-bottom: 10px;
            color: #fff;
        }}
        .meta {{
            color: #aaa;
            margin-bottom: 20px;
            font-size: 14px;
        }}
        .stats-bar {{
            display: flex;
            gap: 20px;
            margin-bottom: 20px;
            flex-wrap: wrap;
        }}
        .stat {{
            background: #2a2a2a;
            padding: 15px 25px;
            border-radius: 8px;
            text-align: center;
        }}
        .stat-value {{
            font-size: 24px;
            font-weight: bold;
        }}
        .stat-label {{
            font-size: 12px;
            color: #aaa;
            margin-top: 5px;
        }}
        .stat.code .stat-value {{ color: {self.COLORS['code']}; }}
        .stat.data .stat-value {{ color: {self.COLORS['data']}; }}
        .stat.rendered .stat-value {{ color: {self.COLORS['rendered']}; }}
        .stat.unused .stat-value {{ color: {self.COLORS['unused']}; }}
        .stat.coverage .stat-value {{ color: #4CAF50; }}
        
        .heatmap-container {{
            background: #2a2a2a;
            padding: 20px;
            border-radius: 8px;
            overflow-x: auto;
        }}
        .heatmap {{
            display: grid;
            grid-template-columns: repeat({width}, 12px);
            gap: 1px;
            margin-bottom: 20px;
        }}
        .block {{
            width: 12px;
            height: 12px;
            border-radius: 2px;
            cursor: pointer;
            transition: transform 0.1s;
        }}
        .block:hover {{
            transform: scale(1.5);
            z-index: 10;
            position: relative;
        }}
        .block.code {{ background: {self.COLORS['code']}; }}
        .block.data {{ background: {self.COLORS['data']}; }}
        .block.rendered {{ background: {self.COLORS['rendered']}; }}
        .block.unused {{ background: {self.COLORS['unused']}; }}
        .block.mixed {{ background: {self.COLORS['mixed']}; }}
        
        .legend {{
            display: flex;
            gap: 20px;
            margin-bottom: 20px;
            flex-wrap: wrap;
        }}
        .legend-item {{
            display: flex;
            align-items: center;
            gap: 8px;
        }}
        .legend-color {{
            width: 16px;
            height: 16px;
            border-radius: 3px;
        }}
        
        .tooltip {{
            position: fixed;
            background: #000;
            color: #fff;
            padding: 10px 15px;
            border-radius: 6px;
            font-size: 13px;
            pointer-events: none;
            z-index: 1000;
            display: none;
            box-shadow: 0 4px 12px rgba(0,0,0,0.3);
        }}
        .tooltip.visible {{ display: block; }}
        
        .bank-view {{
            margin-top: 30px;
        }}
        .bank-bar {{
            display: flex;
            align-items: center;
            margin-bottom: 8px;
        }}
        .bank-label {{
            width: 80px;
            font-size: 12px;
            color: #aaa;
        }}
        .bank-progress {{
            flex: 1;
            height: 24px;
            background: #333;
            border-radius: 4px;
            overflow: hidden;
            display: flex;
        }}
        .bank-segment {{
            height: 100%;
            transition: width 0.3s;
        }}
        .bank-percent {{
            width: 60px;
            text-align: right;
            font-size: 12px;
            color: #aaa;
        }}
        
        .address-ruler {{
            display: flex;
            margin-bottom: 5px;
            font-size: 10px;
            color: #666;
        }}
        .ruler-mark {{
            flex: 1;
            text-align: center;
        }}
    </style>
</head>
<body>
    <div class="container">
        <h1>{html.escape(title)}</h1>
        <div class="meta">
            File: {html.escape(self.filename)} | 
            Size: {len(self.data):,} bytes ({len(self.data) // 1024} KB) |
            Block Size: {block_size} bytes
        </div>
        
        <div class="stats-bar">
            <div class="stat coverage">
                <div class="stat-value">{overall.coverage:.1f}%</div>
                <div class="stat-label">Coverage</div>
            </div>
            <div class="stat code">
                <div class="stat-value">{overall.code:,}</div>
                <div class="stat-label">Code Bytes</div>
            </div>
            <div class="stat data">
                <div class="stat-value">{overall.data:,}</div>
                <div class="stat-label">Data Bytes</div>
            </div>
            <div class="stat rendered">
                <div class="stat-value">{overall.rendered:,}</div>
                <div class="stat-label">Rendered</div>
            </div>
            <div class="stat unused">
                <div class="stat-value">{overall.unused:,}</div>
                <div class="stat-label">Unused</div>
            </div>
        </div>
        
        <div class="heatmap-container">
            <div class="legend">
                <div class="legend-item">
                    <div class="legend-color" style="background: {self.COLORS['code']};"></div>
                    <span>Code</span>
                </div>
                <div class="legend-item">
                    <div class="legend-color" style="background: {self.COLORS['data']};"></div>
                    <span>Data</span>
                </div>
                <div class="legend-item">
                    <div class="legend-color" style="background: {self.COLORS['rendered']};"></div>
                    <span>Rendered/Graphics</span>
                </div>
                <div class="legend-item">
                    <div class="legend-color" style="background: {self.COLORS['mixed']};"></div>
                    <span>Mixed (Code+Data)</span>
                </div>
                <div class="legend-item">
                    <div class="legend-color" style="background: {self.COLORS['unused']};"></div>
                    <span>Unused</span>
                </div>
            </div>
            
            <div class="heatmap" id="heatmap">
'''
        
        # Generate heatmap blocks
        for i, block in enumerate(blocks):
            opacity = 0.3 + (block['percentage'] * 0.7)
            html_content += f'''                <div class="block {block['type']}" 
                    data-offset="{block['offset']}" 
                    data-coverage="{block['coverage']:.1f}"
                    data-code="{block['code']}"
                    data-data="{block['data']}"
                    data-rendered="{block['rendered']}"
                    data-unused="{block['unused']}"
                    style="opacity: {opacity:.2f}"></div>
'''
        
        html_content += '''            </div>
        </div>
        
        <div class="bank-view">
            <h2 style="margin-bottom: 15px;">Bank Coverage</h2>
'''
        
        # Generate bank bars
        bank_size = 0x4000  # 16KB banks
        num_banks = (len(self.data) + bank_size - 1) // bank_size
        
        for bank in range(num_banks):
            start = bank * bank_size
            end = min(start + bank_size, len(self.data))
            stats = self._get_block_stats(start, end)
            
            code_pct = stats.code / stats.total * 100 if stats.total > 0 else 0
            data_pct = stats.data / stats.total * 100 if stats.total > 0 else 0
            rendered_pct = stats.rendered / stats.total * 100 if stats.total > 0 else 0
            mixed_pct = stats.mixed / stats.total * 100 if stats.total > 0 else 0
            
            html_content += f'''            <div class="bank-bar">
                <div class="bank-label">Bank {bank} (${start:05X})</div>
                <div class="bank-progress">
                    <div class="bank-segment" style="width: {code_pct}%; background: {self.COLORS['code']};"></div>
                    <div class="bank-segment" style="width: {data_pct}%; background: {self.COLORS['data']};"></div>
                    <div class="bank-segment" style="width: {rendered_pct}%; background: {self.COLORS['rendered']};"></div>
                    <div class="bank-segment" style="width: {mixed_pct}%; background: {self.COLORS['mixed']};"></div>
                </div>
                <div class="bank-percent">{stats.coverage:.1f}%</div>
            </div>
'''
        
        html_content += '''        </div>
    </div>
    
    <div class="tooltip" id="tooltip"></div>
    
    <script>
        const tooltip = document.getElementById('tooltip');
        const blocks = document.querySelectorAll('.block');
        
        blocks.forEach(block => {
            block.addEventListener('mouseenter', (e) => {
                const offset = parseInt(block.dataset.offset);
                const coverage = block.dataset.coverage;
                const code = block.dataset.code;
                const data = block.dataset.data;
                const rendered = block.dataset.rendered;
                const unused = block.dataset.unused;
                
                tooltip.innerHTML = `
                    <strong>Offset: $${offset.toString(16).toUpperCase().padStart(6, '0')}</strong><br>
                    Coverage: ${coverage}%<br>
                    Code: ${code} | Data: ${data}<br>
                    Rendered: ${rendered} | Unused: ${unused}
                `;
                tooltip.classList.add('visible');
            });
            
            block.addEventListener('mousemove', (e) => {
                tooltip.style.left = (e.clientX + 15) + 'px';
                tooltip.style.top = (e.clientY + 15) + 'px';
            });
            
            block.addEventListener('mouseleave', () => {
                tooltip.classList.remove('visible');
            });
        });
    </script>
</body>
</html>'''
        
        os.makedirs(os.path.dirname(output_path) or '.', exist_ok=True)
        with open(output_path, 'w') as f:
            f.write(html_content)
    
    def generate_svg_heatmap(self, output_path: str, title: Optional[str] = None,
                            block_size: int = 64, width: int = 128) -> None:
        """Generate an SVG heatmap"""
        
        title = title or f"CDL Coverage: {self.filename}"
        total_blocks = (len(self.data) + block_size - 1) // block_size
        height = (total_blocks + width - 1) // width
        
        cell_size = 6
        padding = 60
        svg_width = width * cell_size + padding * 2
        svg_height = height * cell_size + padding * 2 + 100
        
        svg_content = f'''<?xml version="1.0" encoding="UTF-8"?>
<svg xmlns="http://www.w3.org/2000/svg" width="{svg_width}" height="{svg_height}" viewBox="0 0 {svg_width} {svg_height}">
    <defs>
        <style>
            .title {{ font: bold 16px sans-serif; fill: #333; }}
            .label {{ font: 10px sans-serif; fill: #666; }}
            .legend-text {{ font: 12px sans-serif; fill: #333; }}
        </style>
    </defs>
    
    <rect width="100%" height="100%" fill="#f5f5f5"/>
    
    <text x="{svg_width // 2}" y="30" text-anchor="middle" class="title">{html.escape(title)}</text>
    
    <g transform="translate({padding}, 50)">
'''
        
        # Generate blocks
        for i in range(total_blocks):
            start = i * block_size
            end = start + block_size
            dom_type, percentage = self._get_dominant_type(start, end)
            
            x = (i % width) * cell_size
            y = (i // width) * cell_size
            
            color = self.COLORS.get(dom_type, self.COLORS['unused'])
            opacity = 0.3 + (percentage * 0.7)
            
            svg_content += f'        <rect x="{x}" y="{y}" width="{cell_size-1}" height="{cell_size-1}" fill="{color}" opacity="{opacity:.2f}"/>\n'
        
        # Legend
        legend_y = height * cell_size + 30
        legend_items = [
            ('Code', self.COLORS['code']),
            ('Data', self.COLORS['data']),
            ('Rendered', self.COLORS['rendered']),
            ('Mixed', self.COLORS['mixed']),
            ('Unused', self.COLORS['unused']),
        ]
        
        for i, (name, color) in enumerate(legend_items):
            x = i * 100
            svg_content += f'''        <rect x="{x}" y="{legend_y}" width="12" height="12" fill="{color}"/>
        <text x="{x + 18}" y="{legend_y + 10}" class="legend-text">{name}</text>
'''
        
        svg_content += '''    </g>
</svg>'''
        
        os.makedirs(os.path.dirname(output_path) or '.', exist_ok=True)
        with open(output_path, 'w') as f:
            f.write(svg_content)
    
    def generate_png_heatmap(self, output_path: str, title: Optional[str] = None,
                            block_size: int = 64, width: int = 128) -> None:
        """Generate a PNG heatmap using PIL"""
        
        if not HAS_PIL:
            raise RuntimeError("PIL/Pillow is required for PNG output. Install with: pip install Pillow")
        
        title = title or f"CDL Coverage: {self.filename}"
        total_blocks = (len(self.data) + block_size - 1) // block_size
        height = (total_blocks + width - 1) // width
        
        cell_size = 4
        padding = 40
        img_width = width * cell_size + padding * 2
        img_height = height * cell_size + padding * 2 + 60
        
        # Create image
        img = Image.new('RGB', (img_width, img_height), color=(30, 30, 30))
        draw = ImageDraw.Draw(img)
        
        def hex_to_rgb(hex_color: str) -> Tuple[int, int, int]:
            hex_color = hex_color.lstrip('#')
            return tuple(int(hex_color[i:i+2], 16) for i in (0, 2, 4))
        
        # Draw title
        try:
            font = ImageFont.truetype("arial.ttf", 14)
        except:
            font = ImageFont.load_default()
        
        draw.text((img_width // 2, 15), title, fill=(255, 255, 255), anchor="mm", font=font)
        
        # Draw heatmap
        for i in range(total_blocks):
            start = i * block_size
            end = start + block_size
            dom_type, percentage = self._get_dominant_type(start, end)
            
            x = padding + (i % width) * cell_size
            y = padding + (i // width) * cell_size
            
            base_color = hex_to_rgb(self.COLORS.get(dom_type, self.COLORS['unused']))
            # Apply opacity by blending with background
            bg = (30, 30, 30)
            opacity = 0.3 + (percentage * 0.7)
            color = tuple(int(c * opacity + bg[i] * (1 - opacity)) for i, c in enumerate(base_color))
            
            draw.rectangle([x, y, x + cell_size - 1, y + cell_size - 1], fill=color)
        
        # Draw legend
        legend_y = padding + height * cell_size + 20
        legend_items = [
            ('Code', self.COLORS['code']),
            ('Data', self.COLORS['data']),
            ('Rendered', self.COLORS['rendered']),
            ('Mixed', self.COLORS['mixed']),
            ('Unused', self.COLORS['unused']),
        ]
        
        for i, (name, color) in enumerate(legend_items):
            x = padding + i * 80
            draw.rectangle([x, legend_y, x + 12, legend_y + 12], fill=hex_to_rgb(color))
            draw.text((x + 16, legend_y), name, fill=(200, 200, 200), font=font)
        
        # Save
        os.makedirs(os.path.dirname(output_path) or '.', exist_ok=True)
        img.save(output_path)


def main():
    parser = argparse.ArgumentParser(description='CDL Visualization Tool')
    parser.add_argument('cdl_file', help='CDL file to visualize')
    parser.add_argument('--output', '-o', default='output.html', help='Output file')
    parser.add_argument('--format', '-f', choices=['html', 'svg', 'png'], default='html',
                        help='Output format')
    parser.add_argument('--width', type=int, default=64, help='Grid width in blocks')
    parser.add_argument('--block-size', type=int, default=256, help='Bytes per block')
    parser.add_argument('--title', help='Title for the visualization')
    
    args = parser.parse_args()
    
    visualizer = CDLVisualizer(args.cdl_file)
    
    if args.format == 'html':
        visualizer.generate_html_heatmap(args.output, args.title, args.block_size, args.width)
    elif args.format == 'svg':
        visualizer.generate_svg_heatmap(args.output, args.title, args.block_size, args.width)
    elif args.format == 'png':
        visualizer.generate_png_heatmap(args.output, args.title, args.block_size, args.width)
    
    print(f"Generated: {args.output}")


if __name__ == '__main__':
    main()
