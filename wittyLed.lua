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
function blink(r, g, b, time)
   rgb(0, 0, 0)
   tmr.delay(time)
   rgb(r, g, b)
   tmr.delay(time)
   rgb(0, 0, 0)
end
