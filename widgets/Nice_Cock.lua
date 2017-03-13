require "base/internal/ui/reflexcore"

Nice_Cock = { }
registerWidget("Nice_Cock")

function Nice_Cock:initialize()
    self.userData = loadUserData()
    CheckSetDefaultValue(self, "userData", "table", {})
    CheckSetDefaultValue(self.userData, "countUp", "boolean", true)
end

function Nice_Cock:drawOptions(x, y)
    local user = self.userData

    nvgFontSize(22)
	nvgFontFace(FONT_TEXT)
	nvgTextAlign(NVG_ALIGN_LEFT, NVG_ALIGN_BOTTOM)

    nvgBeginPath()
	nvgMoveTo(x, y)
	nvgLineTo(x + 560, y)
	nvgStrokeWidth(1)
	nvgStrokeColor(Color(150, 150, 150, 80))
	nvgStroke()
    y = y + 20

    user.countUp = ui2RowCheckbox(x, y, 100, "Count up", user.countUp)
    y = y + 40

    saveUserData(user)
end

function Nice_Cock:draw()
    --if not shouldShowHUD() then return end
    local localPlayer = getLocalPlayer()
    local player = getPlayer()
    if player == nil or localPlayer == nil or isInMenu() then return end

    local fontColor = Color(255, 255, 255)
    local fontBg = Color(0, 0, 0, 1000)
    local scoreColor = Color(0, 0, 0, 150)
    local scoreBg = Color(255, 255, 180)
    local minutes = 0
    local seconds = 0
    local miliseconds = 0
    local topScore = -100
    local score = 0
    local playerScore = 0

    local allPlayers = 0
    local readyPlayers = 0
    for p, pl in ipairs(players) do 
		if pl.connected and pl.state == PLAYER_STATE_INGAME then
			allPlayers = allPlayers + 1
            if pl.ready then
                readyPlayers = readyPlayers + 1
            end
		end
	end
    -- if normal or team game mode
    if world.gameModeIndex ~= 4 then

        -- if warmup
        if world.gameState == 0 then

            -- display game length
            minutes = math.floor((world.timeLimit + 1) / 60) 
            seconds = math.ceil(world.timeLimit) - (minutes * 60)

            -- show ruleset
            nvgFontSize(30)
            nvgTextAlign(NVG_ALIGN_CENTER, NVG_ALIGN_TOP)
            nvgFontBlur(2)
            nvgFillColor(fontBg)
            nvgText(0, -12, world.mutators .. " " .. gamemodes[world.gameModeIndex].name .. " " .. world.ruleset)
            nvgFontBlur(0)
            nvgFillColor(fontColor)
            nvgText(0, -12, world.mutators .. " " .. gamemodes[world.gameModeIndex].name .. " " .. world.ruleset)
            nvgFontBlur(2)
            nvgFillColor(fontBg)
            nvgText(0, 15, readyPlayers .. "/" .. allPlayers .. " players ready")
            nvgFontBlur(0)
            nvgFillColor(fontColor)
            nvgText(0, 15, readyPlayers .. "/" .. allPlayers .. " players ready")
        else
            -- calculate score difference
            if gamemodes[world.gameModeIndex].hasTeams then
                for t, teams in pairs(world.teams) do
                    if t ~= localPlayer.team then
                        topScore = teams.score
                    end
                end
                playerScore = world.teams[localPlayer.team].score                
            else
                for p, pl in ipairs(players) do
                    if pl.connected and pl.state == PLAYER_STATE_INGAME and pl.score > topScore and player ~= pl then
                        topScore = pl.score
                    end
                end
                playerScore = player.score
            end            
            
            -- display score difference
            if playerScore > topScore then
                scoreColor = Color(0x00, 0xa0, 0x00)
                scoreBg = Color(0x00, 0x58, 0xc0, 1000)
                score = "+" .. playerScore - topScore
            elseif playerScore < topScore then
                scoreColor = Color(0xb8, 0x00, 0x00)
                score = "-" .. topScore - playerScore
                scoreBg = Color(0x00, 0x58, 0xc0, 1000)
        end
        nvgTextAlign(NVG_ALIGN_LEFT, NVG_ALIGN_BOTTOM)
        nvgFontSize(80)
        nvgFontBlur(1)
        nvgFillColor(scoreBg)
        nvgText(80, 0, score)
        nvgFontBlur(0)
        nvgFillColor(scoreColor)
        nvgText(80, 0, score)
        end

        -- if game started
        if world.gameState == 1 or world.gameState == 3 then

            -- display round timer
            if self.userData.countUp then
                minutes = math.floor(((world.gameTime / 1000)) / 60) 
                seconds = math.ceil((world.gameTime / 1000) - 1) - (minutes * 60)
            else
                minutes = math.floor((((world.gameTimeLimit - world.gameTime) / 1000) + 1) / 60) 
                seconds = math.ceil((world.gameTimeLimit - world.gameTime) / 1000) - (minutes * 60)
            end

            -- color changing clock    
            if world.gameTime / world.gameTimeLimit < 0.25 then
                fontColor = Color(fontColor.r, fontColor.g - ((world.gameTime / world.gameTimeLimit) * 1020),  fontColor.b - ((world.gameTime / world.gameTimeLimit) * 1020))
                fontBg = Color(0, 0, (world.gameTime / world.gameTimeLimit) * 1020, 1000)
            elseif world.gameTime / world.gameTimeLimit < 0.5 then
                fontColor = Color(255 - ((world.gameTime / world.gameTimeLimit) * 1020 - 255),  ((world.gameTime / world.gameTimeLimit) * 1020) - 255, 0)
                fontBg = Color(((world.gameTime / world.gameTimeLimit) * 1020) - 255,  0, 255 - ((world.gameTime / world.gameTimeLimit) * 1020 - 255), 1000)
            elseif world.gameTime / world.gameTimeLimit < 0.75 then
                fontColor = Color(0, 255 - ((world.gameTime / world.gameTimeLimit) * 1020 - 510),  ((world.gameTime / world.gameTimeLimit) * 1020) - 510)
                fontBg = Color(255 - ((world.gameTime / world.gameTimeLimit) * 1020 - 510), ((world.gameTime / world.gameTimeLimit) * 1020) - 510,  0, 1000)
            else
                fontColor = Color(0, 0, 255 - ((world.gameTime / world.gameTimeLimit) * 1020 - 765))
                fontBg = Color(((world.gameTime / world.gameTimeLimit) * 1020) - 765, 255,  ((world.gameTime / world.gameTimeLimit) * 1020) - 765, 1000)
            end 
        end

    -- if race
    else
        if localPlayer.raceActive then
            minutes = math.floor(((localPlayer.raceTimeCurrent / 1000)) / 60)
            seconds = math.ceil((localPlayer.raceTimeCurrent / 1000) - 1) - (minutes * 60)
            -- color changing clock    
            if localPlayer.raceTimeCurrent / localPlayer.score < 0.25 then
                fontColor = Color(fontColor.r, fontColor.g - ((localPlayer.raceTimeCurrent / localPlayer.score) * 1020),  fontColor.b - ((localPlayer.raceTimeCurrent / localPlayer.score) * 1020))
                fontBg = Color(0, 0, (localPlayer.raceTimeCurrent / localPlayer.score) * 1020, 1000)
            elseif localPlayer.raceTimeCurrent / localPlayer.score < 0.5 then
                fontColor = Color(255 - ((localPlayer.raceTimeCurrent / localPlayer.score) * 1020 - 255),  ((localPlayer.raceTimeCurrent / localPlayer.score) * 1020) - 255, 0)
                fontBg = Color(((localPlayer.raceTimeCurrent / localPlayer.score) * 1020) - 255,  0, 255 - ((localPlayer.raceTimeCurrent / localPlayer.score) * 1020 - 255), 1000)
            elseif localPlayer.raceTimeCurrent / localPlayer.score < 0.75 then
                fontColor = Color(0, 255 - ((localPlayer.raceTimeCurrent / localPlayer.score) * 1020 - 510),  ((localPlayer.raceTimeCurrent / localPlayer.score) * 1020) - 510)
                fontBg = Color(255 - ((localPlayer.raceTimeCurrent / localPlayer.score) * 1020 - 510), ((localPlayer.raceTimeCurrent / localPlayer.score) * 1020) - 510,  0, 1000)
            else
                fontColor = Color(0, 0, 255 - ((localPlayer.raceTimeCurrent / localPlayer.score) * 1020 - 765))
                fontBg = Color(((localPlayer.raceTimeCurrent / localPlayer.score) * 1020) - 765, 255,  ((localPlayer.raceTimeCurrent / localPlayer.score) * 1020) - 765, 1000)
            end
        end
    end

    -- show player's name
    if player ~= nil and player ~= localPlayer then
        nvgFontSize(55)
        local space = -83
        if minutes > 99 then
            space = -110
        elseif minutes > 999 then
            space = -150
        end
        nvgTextAlign(NVG_ALIGN_RIGHT, NVG_ALIGN_TOP)
        nvgFontBlur(2)
        nvgFillColor(fontBg)
        nvgText(space, -67, player.name)
        nvgFontBlur(0)
        nvgFillColor(fontColor)
        nvgText(space, -67, player.name)
    end

    -- clock with background
    nvgFontSize(80)
    nvgFontBlur(3)
    nvgFillColor(fontBg)
	nvgTextAlign(NVG_ALIGN_RIGHT, NVG_ALIGN_BOTTOM)
    nvgText(-6, 0, string.format("%02d", minutes))
    nvgTextAlign(NVG_ALIGN_CENTER, NVG_ALIGN_BOTTOM)
    nvgText(0, 0, ":")
    nvgTextAlign(NVG_ALIGN_LEFT, NVG_ALIGN_BOTTOM)
    nvgText(6, 0, string.format("%02d", seconds))
    nvgFontBlur(0)
    nvgFillColor(fontColor)
	nvgTextAlign(NVG_ALIGN_RIGHT, NVG_ALIGN_BOTTOM)
    nvgText(-6, 0, string.format("%02d", minutes))
    nvgTextAlign(NVG_ALIGN_CENTER, NVG_ALIGN_BOTTOM)
    nvgText(0, 0, ":")
    nvgTextAlign(NVG_ALIGN_LEFT, NVG_ALIGN_BOTTOM)
    nvgText(6, 0, string.format("%02d", seconds))
end