-- this is where all the Nvg stuff is stored
-- it's also a nice reference for any UI element you don't know (extract it from internal.pak)
require "base/internal/ui/reflexcore"

-- you put any widget properties here, we don't need it here
Nice_CarnageTracker = { }

-- this is what the widget will be called in reflex
registerWidget("Nice_CarnageTracker")

-- draw function is looped while the game is running
-- this is where the logic goes
function Nice_CarnageTracker:draw()
    -- you don't want it showing in main menu etc.
    if not shouldShowHUD() then 
        return 
    end

    -- we need local player (you or whoever you're spectating)
    local localPlayer = getLocalPlayer()

    -- we can't proceed without a local player
    if localPlayer == nil then 
        return 
    end

    -- this is a function I found in LuaVariables.txt
    -- we asign it to a local variabler so other widgets can't get confused (only this widget can access it)
    -- we assign it to a variable so you don't have to call the function multiple times - better performance
    local carnage = math.floor(localPlayer.carnageTimer / 1000)

    -- only show the text if yo uactually have the carnage, no need to display 0
    if carnage > 0 then
        nvgFontSize(40);
        nvgFontFace("TitilliumWeb-Bold");
        nvgTextAlign(NVG_ALIGN_CENTER, NVG_ALIGN_MIDDLE);
        nvgFontBlur(0);
        nvgFillColor(Color(60,80,255));
        -- nvgText can be found in reflexcore.lua, it's the most basic NVG thing
        -- first 0 is X coordinate, 2nd is Y, 3rd is text to display
        nvgText(0, 0, carnage)
    end
end