require "base/internal/ui/reflexcore"

Nice_Clutch = { length = 3, display = false, score = -1 }
registerWidget("Nice_Clutch")


function Nice_Clutch:draw()
    if not shouldShowHUD() or not ((world.gameModeIndex == 3 or world.gameModeIndex == 1) and string.find(world.mutators, "Arena")) then return end
    local localPlayer = getLocalPlayer()
    if localPlayer.state ~= PLAYER_STATE_INGAME then return end

    local aliveCount = 0
    local allCount = 0
    local teamCount = 0
    local enemyCount = 0
    local deadCount = 0
    for p, player in pairs(players) do
        -- count all players
        if player.connected and player.state == PLAYER_STATE_INGAME then
            allCount = allCount + 1
            if player.infoHidden then
                enemyCount = enemyCount + 1
                -- count dead enemies
			    if player.isDead then
                    deadCount = deadCount + 1
                end
            else
                -- count teammates
                teamCount = teamCount + 1
                if player.health > 0 then
                    -- count alive teammates
                    aliveCount = aliveCount + 1
                end
            end
		end
	end

    -- return if there are no enemies
    if allCount == aliveCount then return end

    nvgFontSize(80)
    nvgFontFace("titilliumWeb-regular")
	nvgTextAlign(NVG_ALIGN_CENTER, NVG_ALIGN_MIDDLE)
	local col = Color(232,232,232)
	local text = aliveCount .. " v " .. allCount - teamCount - deadCount
    if aliveCount == 1 then
        nvgFontBlur(2)
        nvgFillColor(Color(200, 64, 64))
	    nvgText(0, 0, text)
    end
	nvgFontBlur(0)
    nvgFillColor(Color(255, 255, 255, 220))
	nvgText(0, 0, text)
end