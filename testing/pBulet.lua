-- your setup.
PUSHBULLET_TOKEN = 'o.vfKdXA9F3YuvizRCO77F4PqAr01c9Dd9'
wifi_name="Vilivere"
wifi_pass="1127664523"

wifi.setmode(wifi.STATION)

-- on connect send the current IP to pushbullet.
wifi.sta.eventMonReg(wifi.STA_GOTIP, function()
    ip = wifi.sta.getip()

    http.post('https://api.pushbullet.com/v2/pushes',
              'Content-Type: application/json\r\nAccess-Token: '.. PUSHBULLET_TOKEN ..'\r\n',
              '{"body":"IP: '.. ip ..'", "title":"ESP Connected", "type":"note"}',
    function (code, data)
        -- print the response code. 200 if success.
        print(code)
    end)
end)

-- configure wifi and connect.
wifi.sta.config(wifi_name, wifi_pass)
wifi.sta.connect()