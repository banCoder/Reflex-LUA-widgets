require "base/internal/ui/reflexcore"

Nice_PickedUpTime = { minutes = 0, seconds = 0, fontColor = Color(0, 88, 192), bgColor = Color(0, 0, 0), armorColor = Color(0, 88, 192), index = -1, ra = -1, ya = -1, ga = -1, mh = -1, displayLength = 3, display = false, hasMega = false, idk = false }
registerWidget("Nice_PickedUpTime")

function Nice_PickedUpTime:initialize()
    self.userData = loadUserData()
    CheckSetDefaultValue(self, "userData", "table", {})
    CheckSetDefaultValue(self.userData, "countUp", "boolean", true)
    CheckSetDefaultValue(self.userData, "color", "boolean", false)
    CheckSetDefaultValue(self.userData, "length", "number", 3)
    CheckSetDefaultValue(self.userData, "showText", "boolean", true)
    CheckSetDefaultValue(self.userData, "showGainedMega", "boolean", false)
    CheckSetDefaultValue(self.userData, "showLostMega", "boolean", true)
    CheckSetDefaultValue(self.userData, "showBackground", "boolean", false)
    CheckSetDefaultValue(self.userData, "text", "string", "ayy lmao")
    CheckSetDefaultValue(self.userData, "svgLocation", "string", "xD lol memes hehe")

    function reset()
        Nice_PickedUpTime.ra = -1
        Nice_PickedUpTime.ya = -1
        Nice_PickedUpTime.ga = -1
        Nice_PickedUpTime.mh = -1
        Nice_PickedUpTime.displayLength = self.userData.length
    end
end

function Nice_PickedUpTime:drawOptions(x, y)
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
    user.color = ui2RowCheckbox(x, y, 140, "Color by item", user.color)
    y = y + 40
    user.showText = ui2RowCheckbox(x, y, 105, "Show text", user.showText)
    y = y + 40
    user.showGainedMega = ui2RowCheckbox(x, y, 185, "Show gained mega", user.showGainedMega)
    y = y + 40
    user.showLostMega = ui2RowCheckbox(x, y, 170, "Show lost mega", user.showLostMega)
    y = y + 40
    user.showBackground = ui2RowCheckbox(x, y, 175, "Show background", user.showBackground)
    y = y + 40
    user.length = ui2RowSliderEditBox0Decimals(x, y, 90, 250, 40, "Length", user.length, 0, 10)

    saveUserData(user)
end

function Nice_PickedUpTime:draw()
    if not shouldShowHUD() or world.gameState < 1 then
        reset()
        return
    end

    -- get player, reset if not the same
    local player = getPlayer()
    if player == nil or player.index ~= Nice_PickedUpTime.index then
        reset()
        Nice_PickedUpTime.index = player.index
        return
    end

    if Nice_PickedUpTime.ra == -1 then
        Nice_PickedUpTime.ra = player.stats.takenRA
        Nice_PickedUpTime.ya = player.stats.takenYA
        Nice_PickedUpTime.ga = player.stats.takenGA
        Nice_PickedUpTime.mh = player.stats.takenMega
        return
    end

    if self.userData.showLostMega then
        if Nice_PickedUpTime.hasMega == false then
            Nice_PickedUpTime.hasMega = player.hasMega
        else
            Nice_PickedUpTime.idk = true
            Nice_PickedUpTime.hasMega = player.hasMega
        end
        if Nice_PickedUpTime.idk and player.hasMega == false then
             Nice_PickedUpTime.display = true
             Nice_PickedUpTime.displayLength = self.userData.length
             if self.userData.countUp then
                 Nice_PickedUpTime.minutes = math.floor(((world.gameTime / 1000)) / 60) 
                 Nice_PickedUpTime.seconds = math.ceil((world.gameTime / 1000) - 1) - (Nice_PickedUpTime.minutes * 60)
             else
                 Nice_PickedUpTime.minutes = math.floor((((world.gameTimeLimit - world.gameTime) / 1000) + 1) / 60) 
                 Nice_PickedUpTime.seconds = math.ceil((world.gameTimeLimit - world.gameTime) / 1000) - (Nice_PickedUpTime.minutes * 60)
             end
             if self.userData.color then
                 Nice_PickedUpTime.fontColor = Color(0, 88, 192)
                 Nice_PickedUpTime.bgColor = Color(0, 0, 0)
                 Nice_PickedUpTime.bgColorBright = Color(0, 0, 0, 1000)
                 Nice_PickedUpTime.armorColor = fontColor
             else
                 Nice_PickedUpTime.fontColor = Color(255, 255, 255, 255)
                 Nice_PickedUpTime.bgColor = Color(255, 255, 0)
                 Nice_PickedUpTime.bgColorBright = Color(255, 255, 0, 1000)
                 Nice_PickedUpTime.armorColor = Color(0, 88, 192)
             end
             Nice_PickedUpTime.svgLocation = "internal/ui/icons/health"
             Nice_PickedUpTime.text = "Lost Mega Health"
             Nice_PickedUpTime.idk = false
        end
    end

    if player.stats.takenRA > Nice_PickedUpTime.ra then
        Nice_PickedUpTime.ra = player.stats.takenRA
        Nice_PickedUpTime.display = true
        Nice_PickedUpTime.displayLength = self.userData.length
        if self.userData.countUp then
            Nice_PickedUpTime.minutes = math.floor(((world.gameTime / 1000)) / 60) 
            Nice_PickedUpTime.seconds = math.ceil((world.gameTime / 1000) - 1) - (Nice_PickedUpTime.minutes * 60)
        else
            Nice_PickedUpTime.minutes = math.floor((((world.gameTimeLimit - world.gameTime) / 1000) + 1) / 60) 
            Nice_PickedUpTime.seconds = math.ceil((world.gameTimeLimit - world.gameTime) / 1000) - (Nice_PickedUpTime.minutes * 60)
        end
        if self.userData.color then
            Nice_PickedUpTime.fontColor = Color(184, 0, 0)
            Nice_PickedUpTime.bgColor = Color(0, 88, 192)
            Nice_PickedUpTime.bgColorBright = Color(0, 88, 192, 1000)
            Nice_PickedUpTime.armorColor = fontColor
        else
            Nice_PickedUpTime.fontColor = Color(255, 255, 255, 255)
            Nice_PickedUpTime.bgColor = Color(255, 255, 0)
            Nice_PickedUpTime.bgColorBright = Color(255, 255, 0, 1000)
            Nice_PickedUpTime.armorColor = Color(184, 0, 0)
        end
        Nice_PickedUpTime.svgLocation = "internal/ui/icons/armor"
        Nice_PickedUpTime.text = "Red Armor"
    end

    if player.stats.takenYA > Nice_PickedUpTime.ya then
        Nice_PickedUpTime.ya = player.stats.takenYA
        Nice_PickedUpTime.display = true
        Nice_PickedUpTime.displayLength = self.userData.length
        if self.userData.countUp then
            Nice_PickedUpTime.minutes = math.floor(((world.gameTime / 1000)) / 60) 
            Nice_PickedUpTime.seconds = math.ceil((world.gameTime / 1000) - 1) - (Nice_PickedUpTime.minutes * 60)
        else
            Nice_PickedUpTime.minutes = math.floor((((world.gameTimeLimit - world.gameTime) / 1000) + 1) / 60) 
            Nice_PickedUpTime.seconds = math.ceil((world.gameTimeLimit - world.gameTime) / 1000) - (Nice_PickedUpTime.minutes * 60)
        end
        if self.userData.color then
            Nice_PickedUpTime.fontColor = Color(224, 192, 0)
            Nice_PickedUpTime.bgColor = Color(0, 160, 0)
            Nice_PickedUpTime.bgColorBright = Color(0, 160, 0, 1000)
            Nice_PickedUpTime.armorColor = fontColor
        else
            Nice_PickedUpTime.fontColor = Color(255, 255, 255, 255)
            Nice_PickedUpTime.bgColor = Color(255, 255, 0)
            Nice_PickedUpTime.bgColorBright = Color(255, 255, 0, 1000)
            Nice_PickedUpTime.armorColor = Color(224, 192, 0)
        end
        Nice_PickedUpTime.svgLocation = "internal/ui/icons/armor"
        Nice_PickedUpTime.text = "Yellow Armor"
    end

    if player.stats.takenGA > Nice_PickedUpTime.ga then
        Nice_PickedUpTime.ga = player.stats.takenGA
        Nice_PickedUpTime.display = true
        Nice_PickedUpTime.displayLength = self.userData.length
        if self.userData.countUp then
            Nice_PickedUpTime.minutes = math.floor(((world.gameTime / 1000)) / 60) 
            Nice_PickedUpTime.seconds = math.ceil((world.gameTime / 1000) - 1) - (Nice_PickedUpTime.minutes * 60)
        else
            Nice_PickedUpTime.minutes = math.floor((((world.gameTimeLimit - world.gameTime) / 1000) + 1) / 60) 
            Nice_PickedUpTime.seconds = math.ceil((world.gameTimeLimit - world.gameTime) / 1000) - (Nice_PickedUpTime.minutes * 60)
        end
        if self.userData.color then
            Nice_PickedUpTime.fontColor = Color(0, 160, 0)
            Nice_PickedUpTime.bgColor = Color(0, 88, 192)
            Nice_PickedUpTime.bgColorBright = Color(0, 88, 192, 1000)
            Nice_PickedUpTime.armorColor = fontColor
        else
            Nice_PickedUpTime.fontColor = Color(255, 255, 255, 255)
            Nice_PickedUpTime.bgColor = Color(255, 255, 0)
            Nice_PickedUpTime.bgColorBright = Color(255, 255, 0, 1000)
            Nice_PickedUpTime.armorColor = Color(0, 160, 0)
        end
        Nice_PickedUpTime.svgLocation = "internal/ui/icons/armor"
        Nice_PickedUpTime.text = "Green Armor"
    end

    if self.userData.showGainedMega then
        if player.stats.takenMega > Nice_PickedUpTime.mh then
            Nice_PickedUpTime.mh = player.stats.takenMega
            Nice_PickedUpTime.display = true
            Nice_PickedUpTime.displayLength = self.userData.length
            if self.userData.countUp then
                Nice_PickedUpTime.minutes = math.floor(((world.gameTime / 1000)) / 60) 
                Nice_PickedUpTime.seconds = math.ceil((world.gameTime / 1000) - 1) - (Nice_PickedUpTime.minutes * 60)
            else
                Nice_PickedUpTime.minutes = math.floor((((world.gameTimeLimit - world.gameTime) / 1000) + 1) / 60) 
                Nice_PickedUpTime.seconds = math.ceil((world.gameTimeLimit - world.gameTime) / 1000) - (Nice_PickedUpTime.minutes * 60)
            end
            if self.userData.color then
                Nice_PickedUpTime.fontColor = Color(0, 88, 192)
                Nice_PickedUpTime.bgColor = Color(0, 0, 0)
                Nice_PickedUpTime.bgColorBright = Color(0, 0, 0, 1000)
                Nice_PickedUpTime.armorColor = fontColor
            else
                Nice_PickedUpTime.fontColor = Color(255, 255, 255, 255)
                Nice_PickedUpTime.bgColor = Color(255, 255, 0)
                Nice_PickedUpTime.bgColorBright = Color(255, 255, 0, 1000)
                Nice_PickedUpTime.armorColor = Color(0, 88, 192)
            end
            Nice_PickedUpTime.svgLocation = "internal/ui/icons/health"
            Nice_PickedUpTime.text = "Mega Health"
        end
    end

    if Nice_PickedUpTime.display then
        Nice_PickedUpTime.displayLength = Nice_PickedUpTime.displayLength - deltaTime
        if Nice_PickedUpTime.displayLength > 0 then
	        nvgFontFace(FONT_HUD)
            if self.userData.color then
                if self.userData.showBackground then
                    -- background
                    nvgFontBlur(1)
                    nvgFontSize(50)
                    nvgFillColor(Nice_PickedUpTime.bgColorBright)
                    nvgTextAlign(NVG_ALIGN_RIGHT, NVG_ALIGN_MIDDLE)
                    nvgText(0, 0, string.format("%02d", Nice_PickedUpTime.minutes) .. ":")
                    nvgTextAlign(NVG_ALIGN_LEFT, NVG_ALIGN_MIDDLE)
                    nvgText(0, 0, string.format("%02d", Nice_PickedUpTime.seconds))
                    nvgFillColor(Nice_PickedUpTime.bgColor)
                    nvgSvg(Nice_PickedUpTime.svgLocation, 71, -1, 19)
                    nvgFontSize(47)
                    if self.userData.showText then
                        nvgFillColor(Nice_PickedUpTime.bgColorBright)
                        nvgText(101, 0, Nice_PickedUpTime.text)
                    end
                end
                -- font
                nvgFontBlur(0)
                nvgFontSize(50)
                nvgFillColor(Nice_PickedUpTime.fontColor)
	            nvgTextAlign(NVG_ALIGN_RIGHT, NVG_ALIGN_MIDDLE)
                nvgText(0, 0, string.format("%02d", Nice_PickedUpTime.minutes) .. ":")
                nvgTextAlign(NVG_ALIGN_LEFT, NVG_ALIGN_MIDDLE)
                nvgText(0, 0, string.format("%02d", Nice_PickedUpTime.seconds))
                nvgSvg(Nice_PickedUpTime.svgLocation, 70, 0, 19)
                nvgFontSize(47)
                if self.userData.showText then
                    nvgText(101, 0, Nice_PickedUpTime.text)
                end
            else
                if self.userData.showBackground then
                    -- background
                    nvgFontBlur(1)
                    nvgFontSize(50)
                    nvgFillColor(Color(0, 0, 0, 1000))
                    nvgTextAlign(NVG_ALIGN_RIGHT, NVG_ALIGN_MIDDLE)
                    nvgText(0, 0, string.format("%02d", Nice_PickedUpTime.minutes) .. ":")
                    nvgTextAlign(NVG_ALIGN_LEFT, NVG_ALIGN_MIDDLE)
                    nvgText(0, 0, string.format("%02d", Nice_PickedUpTime.seconds))
                    nvgFillColor(Color(0, 0, 0))
                    nvgSvg(Nice_PickedUpTime.svgLocation, 71, -1, 19)
                    nvgFontSize(47)
                    if self.userData.showText then
                        nvgFillColor(Color(0, 0, 0, 1000))
                        nvgText(101, 0, Nice_PickedUpTime.text)
                    end
                end
                -- font
                nvgFontBlur(0)
                nvgFontSize(50)
                nvgFillColor(Nice_PickedUpTime.fontColor)
	            nvgTextAlign(NVG_ALIGN_RIGHT, NVG_ALIGN_MIDDLE)
                nvgText(0, 0, string.format("%02d", Nice_PickedUpTime.minutes) .. ":")
                nvgTextAlign(NVG_ALIGN_LEFT, NVG_ALIGN_MIDDLE)
                nvgText(0, 0, string.format("%02d", Nice_PickedUpTime.seconds))
                nvgFontSize(47)
                if self.userData.showText then
                    nvgText(101, 0, Nice_PickedUpTime.text)
                end
                nvgFillColor(Nice_PickedUpTime.armorColor)
                nvgSvg(Nice_PickedUpTime.svgLocation, 70, 0, 19)
            end

        else
            Nice_PickedUpTime.display = false
            Nice_PickedUpTime.displayLength = self.userData.length
        end
    end
end