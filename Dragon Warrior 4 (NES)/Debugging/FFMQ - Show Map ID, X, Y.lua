
MapIdAddress = 0x0e88
MapXValue = 0x0e89
MapYValue = 0x0e8a
bgColor = 0x302060FF
fgColor = 0x30FF4040

function printInfo()
	--Draw some rectangles and print some text
	--emu.drawRectangle(8, 8, 76, 24, bgColor, true, 1)
	--emu.drawRectangle(8, 8, 76, 24, fgColor, false, 1)
	emu.drawRectangle(2, 10, 86, 15, bgColor, true, 1)
	emu.drawRectangle(2, 10, 86, 15, fgColor, false, 1)
	
	MapID = emu.read(MapIdAddress, emu.memType.snesWorkRam)
	MapX = emu.read(MapXValue, emu.memType.snesWorkRam)
	MapY = emu.read(MapYValue, emu.memType.snesWorkRam)
	
	emu.drawString(6, 14, string.format("Map: %02X, %02X, %02X", MapID, MapX, MapY), 0xFFFFFF, 0xFF000000)
end

--Register some code (printInfo function) that will be run at the end of each frame
emu.addEventCallback(printInfo, emu.eventType.endFrame);

--Display a startup message
emu.displayMessage("Script", "Show Map Id, X, Y - script loaded.")
