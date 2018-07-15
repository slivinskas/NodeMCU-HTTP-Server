Blink = {
    _pin = 4,
    _timer= {}
   -- _timer = require 'timer'
}

Blink.__index = Blink

function Blink:new(pin, duration)
    local o = {}
    setmetatable(o, Blink)
    self._pin = pin
    self._duration = duration
    return o
end

function Blink:setPattern(pattern)
    self.pattern = pattern
end

function Blink:startBlink()
    local status = gpio.LOW
    self:reset()
     -- Create an interval
    tmr.alarm(0, 1000, 1, function ()
        if status == gpio.LOW then
            status = gpio.HIGH
        else
            status = gpio.LOW
        end
        gpio.write(self._pin, status)
    end)
end

function Blink:stopBlink()
    self.timer.unregister()
    self:reset()
end

function Blink:changeBlink()
    
end

function Blink:reset()
    local status = gpio.LOW
    -- Initialising pin
    gpio.mode(self._pin, gpio.OUTPUT)
    gpio.write(self._pin, status)
end