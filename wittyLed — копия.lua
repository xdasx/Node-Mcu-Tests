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
function rad(r, g, b, time)
rgb(0, 0, 0)
tmr.delay(time)
    if r~=0 then 
        for i=1,r do
        led(8, i)
        tmr.delay(time/100)
        end
    end
    if g~=0 then 
        for i=1,g do
        led(6, i)
        tmr.delay(time/100)
        end
    end
    if b~=0 then 
        for i=1,b do
        led(7, i)
        tmr.delay(time/100)
        end
    end
     tmr.delay(time)
    if r~=0 then 
        for i=r,0 , -1 do
        led(8, i)
        tmr.delay(time/100)
        end
    end
    if g~=0 then 
        for i=g,0 , -1  do
        led(6, i)
        tmr.delay(time/100)
        end
    end
    if b~=0 then 
        for i=b,0, -1 do
        led(7, i)
        tmr.delay(time/100)
        end
    end
end
--rad(1000, 0, 0, 100000)
for i=1,1000 do
        led(8, i)
        print(i)
        tmr.delay(100000/100)
        end
--rad(1000, 1000, 0, 100000)
--rad(1000, 1000, 1000, 100000)
--rad(1000, 0, 0, 100000)
--rad(0, 1000, 0, 100000)
--rad(0, 0, 1000, 100000)
