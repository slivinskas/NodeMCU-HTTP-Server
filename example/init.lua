dofile ("Blink.lua")
local timer = require 'timer'
local mainLed =  Blink:new(4,500)
mainLed:startBlink()
dofile('wifiConnection.lua')
mainLed:startBlink()
-- Serving static files
dofile('httpServer.lua')
dofile('serverAPI.lua')
