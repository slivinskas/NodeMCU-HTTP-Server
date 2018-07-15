print('Setting up WIFI...')
dofile(config.lua)

function checkWIFI() 
  if ( wifiTrys > NUMWIFITRYS ) then
    print("Sorry. Not able to connect")
  else
    ipAddr = wifi.sta.getip()
    if ( ( ipAddr ~= nil ) and  ( ipAddr ~= "0.0.0.0" ) )then
      tmr.alarm( 1 , 500 , 0 , connectedPrint() )
    else
      -- Reset alarm again
      tmr.alarm( 0 , 2500 , 0 , checkWIFI)
      print("Checking WIFI..." .. wifiTrys)
      wifiTrys = wifiTrys + 1
    end 
  end 
end

function connectedPrint()
    print("Connected to WIFI!")
    print("ESP8266 mode is: " .. wifi.getmode())
    print("The module MAC address is: " .. wifi.ap.getmac())
    print("Config done, IP is "..wifi.sta.getip())
end

-- Lets see if we are already connected by getting the IP
ipAddr = wifi.sta.getip()
if ( ( ipAddr == nil ) or  ( ipAddr == "0.0.0.0" ) ) then
    -- We aren't connected, so let's connect
    print("Configuring WIFI....")
    wifi.setmode(wifi.STATION)
    wifi.sta.config(station_cfg)
    wifi.sta.connect()
    tmr.alarm(1, 1000, tmr.ALARM_AUTO, function()
      if wifi.sta.getip() == nil then
            print('Waiting for IP ...')
        else
            tmr.stop(1)
            connectedPrint()
        end
    end)
else
 -- We are connected, so just run the launch code.
  connectedPrint()
end