function mainLedBlinking(duration)
    -- Pin definition 
    local pin = 4            --  GPIO13
    local status = gpio.LOW
    
    -- Initialising pin
    gpio.mode(pin, gpio.OUTPUT)
    gpio.write(pin, status)
    
    -- Create an interval
    tmr.alarm(0, duration, 1, function ()
        if status == gpio.LOW then
            status = gpio.HIGH
        else
            status = gpio.LOW
        end
        gpio.write(pin, status)
    end)
    print("LED blinking")
end