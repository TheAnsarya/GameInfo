# DQ3r C# Tools

C# libraries and tools for Dragon Quest III (SNES) ROM analysis and editing.

## Libraries

### DQ3SFC
SNES-specific DQ3 library with:
- ROM structure definitions
- Data map (datamap.json)
- Compression algorithms
- Text handling
- Data structures

### DQ3Lib
Common DQ3 library with:
- Compression utilities
- Map handling
- Text encoding/decoding
- Shared utilities

## Source
Copied from [logsmall](https://github.com/TheAnsarya/logsmall) repository.

## Usage
These libraries are part of the larger logsmall solution. To use:

1. Reference from the logsmall.sln solution, or
2. Copy to a new solution and update project references

## Data Map
The `DQ3SFC/datamap.json` contains important ROM address information:
- Dialog font addresses
- Text script locations
- Compression settings
- Character table files

## Building
Requires .NET 10 SDK.

```powershell
dotnet build
```
