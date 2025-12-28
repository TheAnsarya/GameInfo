# GitHub Issue #9: Critical SNES Address Translation Correction

**Priority**: CRITICAL
**Type**: Bug Fix
**Epic**: Core System Architecture
**Estimated Hours**: 8 hours

## Problem Statement

Current graphics analysis shows meaningless data because SNES address translation is incorrect. SNES addresses ($XX:YYYY format) must be properly converted to ROM file offsets for accurate data extraction. The current implementation is treating SNES addresses as direct file offsets, resulting in completely wrong data being analyzed.

## Technical Details

### Current Issue
- Graphics analyzer extracting random data instead of actual graphics
- Address translation between SNES memory map and ROM file offsets is broken
- LoROM banking calculation is incorrect
- All analysis tools affected by improper address mapping

### SNES LoROM Address Translation Rules
```
SNES Address: $BB:HHLL
ROM Offset calculation:
- If HHLL < $8000: Invalid (not ROM space)
- If HHLL >= $8000: ROM_Offset = (BB * $8000) + (HHLL - $8000)
- Banks $00-$3F map to ROM $000000-$1FFFFF
- Banks $80-$BF map to ROM $000000-$1FFFFF (mirror)
- Banks $40-$7F map to ROM $200000-$3FFFFF
- Banks $C0-$FF map to ROM $200000-$3FFFFF (mirror)
```

## Acceptance Criteria

1. **Address Translation Function**
   - [ ] Implement correct SNES-to-ROM address translation
   - [ ] Handle LoROM banking properly ($00-$3F, $40-$7F, $80-$BF, $C0-$FF)
   - [ ] Validate address ranges and return errors for invalid addresses
   - [ ] Support both 24-bit ($BB:HHLL) and 16-bit ($HHLL) address formats

2. **Graphics Data Verification**
   - [ ] Extract actual graphics data from known SNES addresses
   - [ ] Verify extracted data matches expected patterns
   - [ ] Generate sample graphics dumps with proper address mapping
   - [ ] Validate against known graphics locations in DQ3 ROM map

3. **All Analysis Tools Updated**
   - [ ] Update ROM map analyzer with correct address translation
   - [ ] Fix graphics format analyzer address calculations
   - [ ] Correct audio system analyzer address mapping
   - [ ] Update cross-reference engine with proper addressing

4. **Validation and Testing**
   - [ ] Test against known Dragon Quest III data locations
   - [ ] Verify graphics extraction produces recognizable game assets
   - [ ] Compare with reference ROM map documentation
   - [ ] Generate comprehensive address translation test suite

## Implementation Plan

### Phase 1: Core Address Translation (2 hours)
- Create centralized SNES address translation utility
- Implement LoROM banking calculation functions
- Add comprehensive address validation
- Create unit tests for address translation

### Phase 2: Graphics System Fix (3 hours)
- Update graphics analyzer with correct addressing
- Re-extract graphics data using proper address translation
- Verify extracted graphics match expected game assets
- Generate visual validation reports

### Phase 3: System-Wide Updates (2 hours)
- Update all analysis tools with correct address translation
- Fix ROM map analyzer address calculations
- Correct audio and memory banking address mapping
- Update cross-reference engine addressing

### Phase 4: Validation and Testing (1 hour)
- Run complete analysis suite with corrected addressing
- Generate validation reports comparing old vs new results
- Verify against Dragon Quest III ROM map documentation
- Create comprehensive test coverage

## Expected Outcomes

1. **Accurate Data Extraction**
   - Graphics data extraction produces recognizable game assets
   - Audio data extraction identifies actual music and sound effects
   - ROM map analysis correctly identifies game systems

2. **Proper Address Mapping**
   - All SNES addresses correctly mapped to ROM file offsets
   - LoROM banking properly handled across all tools
   - Address validation prevents invalid memory access

3. **Enhanced Analysis Quality**
   - Significantly improved accuracy of all analysis tools
   - Proper identification of game assets and data structures
   - Reliable cross-reference analysis with correct addressing

## Files to Modify

- `tools/analysis/graphics_format_analyzer.py`
- `tools/analysis/rom_map_analyzer.py`
- `tools/analysis/audio_system_analyzer.py`
- `tools/analysis/memory_banking_analyzer.py`
- `tools/analysis/cross_reference_engine.py`
- Create: `tools/utils/snes_address_translation.py`

## Dependencies

- Requires Dragon Quest III ROM file
- Depends on ROM map documentation from datacrystal.tcrf.net
- Graphics validation requires known asset locations

## Risk Assessment

**Risk**: Medium
**Impact**: High - Affects all analysis tools and data extraction

**Mitigation**:
- Maintain backup of current analysis results for comparison
- Implement comprehensive testing before deploying changes
- Validate against multiple known data locations

---

*Created: 2025-11-09 00:12:53*
*Epic: Core System Architecture*
*Priority: CRITICAL - Foundation for all analysis accuracy*
