print ("BUTTON is working")
function led(pin, level)
    pwm.setup(pin, 500, level)
    pwm.start(pin)
end
function rgb(r, g, b)
    led(8, r)
    led(6, g)
    led(7, b)
end
function blink(level)
print("level "..level)
    if level == 0 then
        led(7,500)
    else
        led(7,0)
    end
end
gpio.mode(2, gpio.INT, gpio.PULLUP)
gpio.trig(2, "both", function(level)
blink(level)
end)
