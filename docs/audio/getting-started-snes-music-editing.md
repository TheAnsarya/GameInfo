# Getting Started with SNES Music Editing

A beginner-friendly guide to editing SNES game music using SPC Tool and Ableton Live.

## What You'll Need

1. **SPC Tool** - Included in this repository
2. **Ableton Live** - Any version (Lite works fine)
3. **SPC Files** - Your favorite SNES game music files

### Where to Get SPC Files

SPC files are music rips from SNES games. You can find them at:
- [SMSPower SPC Archive](https://www.smspower.org/)
- Various game music archives online

## Your First Edit

Let's walk through editing a piece of SNES music from start to finish.

### Step 1: Explore the Original

First, let's see what's in an SPC file:

```powershell
spc-tool info "path/to/your-song.spc"
```

This shows you:
- Song title and game information
- Number of samples (instruments)
- Which channels are active
- Echo/reverb settings

### Step 2: Extract the Components

Extract the audio samples and MIDI data:

```powershell
# Create a project folder
mkdir my-music-edit
cd my-music-edit

# Extract samples as WAV files
spc-tool extract "../your-song.spc" -o ./samples

# Export the sequence as MIDI
spc-tool midi "../your-song.spc" -o original.mid
```

You now have:
- `samples/` - WAV files of each instrument
- `original.mid` - The music arrangement as MIDI

### Step 3: Create an Ableton Project

```powershell
spc-tool ableton "../your-song.spc" -o "Music Edit.als"
```

Open `Music Edit.als` in Ableton Live. You'll see:
- Each SNES channel as a separate track
- The original samples loaded into Simpler instruments
- MIDI clips with the original arrangement

### Step 4: Edit in Ableton

Now you can edit like any other music project:

**Easy edits:**
- Adjust the tempo
- Change instrument volumes
- Add effects to channels
- Mute or solo channels

**Intermediate edits:**
- Modify MIDI notes
- Swap samples between channels
- Add new MIDI patterns

**Advanced edits:**
- Create new samples
- Complete re-arrangement
- Add new melodic lines

### Step 5: Export Your Changes

When you're done editing:

1. **Export MIDI**: File → Export MIDI Clip
2. **Export new samples** (if you created any): Freeze track → right-click → Export

### Step 6: Compile Back to SPC Format

Convert your modified MIDI to N-SPC sequence data:

```powershell
spc-tool import-midi modified.mid -o new-sequence.nspc
```

If you have new samples, convert them:

```powershell
spc-tool convert my-new-sample.wav -o new-sample.brr
```

### Step 7: Build the Final SPC

Create a new SPC file with your modifications:

```powershell
spc-tool build -o my-remix.spc -c project-config.json
```

## Understanding SPC Limitations

SNES audio has hard limits you must work within:

### 8 Channels Maximum

The SNES can only play 8 sounds simultaneously. If your edit needs more, you'll have to:
- Combine parts
- Remove less important elements
- Use the same channel for sequential parts

### 64KB Sample Memory

All samples must fit in 64KB. Tips:
- Use shorter samples
- Reduce sample rate (16kHz works well for most sounds)
- Reuse samples across channels
- Loop sustained sounds

### 32kHz Maximum Sample Rate

Higher quality sources will be downsampled. Use the pre-emphasis filter to preserve high frequencies:

```powershell
spc-tool convert my-sample.wav -o sample.brr --pre-emphasis
```

## Common Workflows

### Remix: Keep Original Samples, Change Arrangement

1. Extract MIDI only
2. Edit MIDI in any DAW
3. Import MIDI back

This is the safest approach—you're only changing notes, not sounds.

### Sample Swap: Replace Instruments

1. Extract all samples
2. Create/find replacement samples
3. Match sample rates and loop points
4. Convert to BRR

### Full Re-creation: New Music for a Game

1. Compose in Ableton (8 channels max!)
2. Export each track as WAV
3. Convert all to BRR
4. Export MIDI from each track
5. Combine into SPC

## Troubleshooting

### "Could not parse sequence data"

Some games use custom sound drivers that aren't fully supported yet. You can still:
- Extract samples (always works)
- Use the Ableton project generator
- Create new arrangements from scratch

### Samples sound different after conversion

BRR compression is lossy. Try:
- Higher quality source files
- Pre-emphasis filter (`-p` option)
- Lower sample rates (paradoxically can sound better)

### Echo sounds wrong

The SNES echo effect is hardware-specific. The software simulation is close but not perfect. Adjust echo settings in your DAW to taste.

### Clicks at loop points

Loop points must align to 16-sample boundaries. Use a audio editor to:
1. Find where you want to loop
2. Adjust to nearest 16-sample boundary
3. Ensure waveform matches at loop points

## Next Steps

- Read the [SPC Tool User Guide](spc-tool-user-guide.md) for all commands
- Study the [SNES Audio Technical Reference](snes-audio-technical-reference.md)
- Join ROM hacking communities to share your work!

## Example: Complete Session

Here's a complete editing session from start to finish:

```powershell
# 1. Set up project
mkdir "FF6 Terra Remix"
cd "FF6 Terra Remix"

# 2. Analyze the original
spc-tool info "../ff6-terra.spc"

# 3. Extract everything
spc-tool extract "../ff6-terra.spc" -o ./samples -f both
spc-tool midi "../ff6-terra.spc" -o original.mid

# 4. Create Ableton project
spc-tool ableton "../ff6-terra.spc" -o "Terra Remix.als"

# 5. [Edit in Ableton - export as modified.mid]

# 6. Convert modified MIDI
spc-tool import-midi modified.mid -o sequence.nspc

# 7. Validate and test
spc-tool render my-remix.spc -o preview.wav -d 60

# 8. Package for distribution
spc-tool bundle create -o "Terra Remix.spcmod" -d .
```

Happy editing! 🎵
