require("wittyLed")
rgb(0,0,0)
du=0
cnt=0
stat=0
function ledChange(c)
    print(c)
    if cnt<1000 then
    stat=1
        rgb(0,0,1000)
    elseif cnt<2000 then
    stat=2
        rgb(0,1000,0)
    elseif cnt<3000 then
    stat=3
        rgb(1000,0,0)
    else
    cnt=0
    end
end
function press(level)
cnt=0
    tmr.alarm(0, 100, 1, function()
        if level == 0 then
            cnt = cnt + 100
            ledChange(cnt)
        elseif level==1 then
            tmr.stop(0)
            go(stat)
            --print("ITMER STOPED :"..cnt)
            --cnt=0
        end
    end)
end


gpio.mode(2, gpio.INT, gpio.PULLUP)
gpio.trig(2, "both", function(level)
press(level)
end)

function go(s)
print(s)
end


