require "base/internal/ui/reflexcore";

Nice_MuteWhenWindowed = {canPosition = false;};

registerWidget("Nice_MuteWhenWindowed")
local preFullscreen
local preVolume = consoleGetVariable("s_volume")

function Nice_MuteWhenWindowed:initialize()
	widgetCreateConsoleVariable("volume", "float", consoleGetVariable("s_volume"))
    widgetCreateConsoleVariable("wolume", "float", 0)
end

function Nice_MuteWhenWindowed:draw()
	local fullscreen = consoleGetVariable("r_fullscreen")
    local volume = consoleGetVariable("s_volume")

    -- changes volume with fullscreen
    if preFullscreen ~= fullscreen then
        if fullscreen == 1 then
            consolePerformCommand("s_volume " .. consoleGetVariable("ui_Nice_MuteWhenWindowed_volume"))
        else
            consolePerformCommand("s_volume " .. consoleGetVariable("ui_Nice_MuteWhenWindowed_wolume"))
        end
        preFullscreen = fullscreen
    end

    -- ensures if user changes volume it changes widget too
    if preVolume ~= volume then
        if fullscreen == 1 then
            consolePerformCommand("ui_Nice_MuteWhenWindowed_volume " .. volume)
        else
            consolePerformCommand("ui_Nice_MuteWhenWindowed_wolume " .. volume)
        end
        preVolume = volume
    end
end