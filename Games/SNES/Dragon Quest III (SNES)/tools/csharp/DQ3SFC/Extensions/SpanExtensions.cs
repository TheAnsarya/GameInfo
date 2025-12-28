using System;

namespace DQ3SFC.Extensions;

// Extension methods for Span<T> and Memory<T>
static class SpanExtensions {
	// offset is in bytes
	// throws out of bound exceptions
	public static int Byte(this Span<byte> span, int offset) => span[offset];
	public static int Byte(this Memory<byte> memory, int offset) => memory.Span[offset];
	public static int Word(this Span<byte> span, int offset) => span[offset] + (span[offset + 1] << 8);
	public static int Word(this Memory<byte> memory, int offset) => memory.Span[offset] + (memory.Span[offset + 1] << 8);
	public static int Long(this Span<byte> span, int offset) => span[offset] + (span[offset + 1] << 8) + (span[offset + 2] << 16);
	public static int Long(this Memory<byte> memory, int offset) => memory.Span[offset] + (memory.Span[offset + 1] << 8) + (memory.Span[offset + 2] << 16);
}

