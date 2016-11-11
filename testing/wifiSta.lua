--wifiSta.lua
require("wittyLed")
cnt=0
wifi.setmode(wifi.STATION)
wifi.sta.config(wifi_name,wifi_pass)
--tmr.delay(1000000)   -- wait 1,000,000 us = 1 second
tmr.alarm(1, 1000, 1, function()
if wifi.sta.status() ~= 5 then
    blink(0,0,1000,10000)
    cnt = cnt + 1
    print("(" .. cnt .. ") Conecting...")
    if cnt == 10 then
        tmr.stop(1)
        print("ERROR STATUS: ")
        err=wifi.sta.status()
        print(err)
        for i = 1, err do
        blink(1000,0,0,500000)
          i = i + 1
        end
    end
else
    tmr.stop(1)
    blink(0,1000,0,1000000)
    ip, nm, gw=wifi.sta.getip()
print("Connected to "..wifi_name.."\nIP Info:\nIP Address: "..ip.." \nNetmask: "..nm.." \nGateway Addr: "..gw.."\n")

dofile("main.lua")
end
end)