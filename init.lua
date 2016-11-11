
-- Global Variables (Modify for your network)
ssid = "Vilivere"
pass = "1127664523"
gpio.mode(2, gpio.INPUT)
gpio.trig(2, "down", conekt)

-- Configure Wireless Internet
print('\nAll About Circuits init.lua\n')
wifi.setmode(wifi.STATION)
print('set mode=STATION (mode='..wifi.getmode()..')\n')
print('MAC Address: ',wifi.sta.getmac())
print('Chip ID: ',node.chipid())
print('Heap Size: ',node.heap(),'\n')
-- wifi config start
wifi.sta.config(ssid,pass)
-- wifi config end

function conekt()
    wifi.sta.connect()
    tmr.delay(1000000)   -- wait 1,000,000 us = 1 second
    if wifi.sta.status() == 1 then
        print("Connected to "..ssid)
        print(wifi.sta.getip())
        rgb(100, 100, 0)
    if wifi.sta.status() == 5 then
        print("Connected to "..ssid)
        rgb(0, 100, 0)
        print(wifi.sta.getip())
    else 
    print("ERROR STATUS :"..wifi.sta.status())
    rgb(100, 100, 0)
    end
end
end
function led(pin, level)
    pwm.setup(pin, 500, level)
    pwm.start(pin)
end

-- Control the Blue LED: 0 -> 1023 higher means light off
function blueLed(inverted_level)
    led(4, inverted_level)
end
function rgb(r, g, b)
    led(8, r)
    led(6, g)
    led(7, b)
end
rgb(0, 0, 0)