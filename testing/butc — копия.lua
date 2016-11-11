require("wittyLed")
rgb(0,0,0)
du=0
function press(level)
if level==0 then
du = tmr.now()
else
du=tmr.now()-du
rgb(0,0,0)
getEvent(du)

end
end
gpio.mode(2, gpio.INT, gpio.PULLUP)
gpio.trig(2, "both", function(level)
press(level)
end)
function getEvent(du)
--print(du)
if du >5000000 then
rgb(1000,0,0)
print('very long Press')
elseif du >1000000 then
rgb(0,1000,0)
print('long Press')
else print('short press')
rgb(0,0,1000)
end
end



