-- AUTO TAP CENTER SCREEN
-- Tap tengah layar = START / STOP
-- Tap jalan di TENGAH layar
-- Delay 55 ms

local delay = 55000 -- 55 ms (microsecond)
local running = false

local screenX, screenY = getScreenSize()
local centerX = screenX / 2
local centerY = screenY / 2

toast("Tap TENGAH layar untuk START / STOP")

while true do
    local x, y = waitTouch()

    -- toggle ON / OFF jika tap tengah layar
    if math.abs(x - centerX) < 120 and math.abs(y - centerY) < 120 then
        running = not running
        if running then
            toast("AUTO TAP ON")
        else
            toast("AUTO TAP OFF")
        end
    end

    -- auto tap di tengah layar
    while running do
        tap(centerX, centerY)
        usleep(delay)
    end
end
