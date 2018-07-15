dofile("LED-blinking.lua")
mainLedBlinking(1000)
dofile('wifiConnection.lua')
-- Serving static files
dofile('httpServer.lua')
dofile('serverAPI.lua')
