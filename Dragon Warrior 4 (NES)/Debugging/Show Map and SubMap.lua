
MapNumberAddress = 0x0063
SubMapNumberAddress = 0x0064
bgColor = 0x302060FF
fgColor = 0x30FF4040

function printInfo()
	--Draw some rectangles and print some text
	--emu.drawRectangle(8, 8, 76, 24, bgColor, true, 1)
	--emu.drawRectangle(8, 8, 76, 24, fgColor, false, 1)
	emu.drawRectangle(8, 8, 62, 15, bgColor, true, 1)
	emu.drawRectangle(8, 8, 62, 15, fgColor, false, 1)
	
	Map = emu.read(MapNumberAddress, emu.memType.nesMemory)
	SubMap = emu.read(SubMapNumberAddress, emu.memType.nesMemory)
	
	emu.drawString(12, 12, string.format("Map: %02X-%02X", Map, SubMap), 0xFFFFFF, 0xFF000000)
end

--Register some code (printInfo function) that will be run at the end of each frame
emu.addEventCallback(printInfo, emu.eventType.endFrame);

--Display a startup message
emu.displayMessage("Script", "Show Map/SubMap - script loaded.")
