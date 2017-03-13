require "base/internal/ui/reflexcore"

Nice_VisualDamageBatching = { score = 0, index = 0, ttlDmgDone = 0, totalDamageDone = nil, doneDamage = 0, doingDamage = false, actualDisplay = false, displayLength = 3, display = false, time = 0 }
registerWidget("Nice_VisualDamageBatching")

function Nice_VisualDamageBatching:initialize()
    self.userData = loadUserData()
    CheckSetDefaultValue(self, "userData", "table", {})
    CheckSetDefaultValue(self.userData, "length", "number", 3)
    CheckSetDefaultValue(self.userData, "size", "number", 20)
    CheckSetDefaultValue(self.userData, "spacing", "number", 2)
end

function Nice_VisualDamageBatching:drawOptions(x, y)
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
    user.size = ui2RowSliderEditBox0Decimals(x, y, 90, 250, 40, "Size", user.size, 0, 100, optargs)
    nvgText(x + 260, y + 30, "How big are the icons")    

    y = y + 55
    user.spacing = ui2RowSliderEditBox0Decimals(x, y, 90, 250, 40, "Spacing", user.spacing, 0, 20, optargs)
    nvgText(x + 260, y + 30, "How far are icons from each other")

    y = y + 55
    user.length = ui2RowSliderEditBox0Decimals(x, y, 90, 250, 40, "Length", user.length, 0, 10, optargs)
    nvgText(x + 260, y + 30, "How long do the icons stay up for")

    saveUserData(user)
end

function Nice_VisualDamageBatching:draw()
    if not shouldShowHUD() then
        Nice_VisualDamageBatching.display = false
        Nice_VisualDamageBatching.displayLength = self.userData.length
        Nice_VisualDamageBatching.doneDamage = 0
        Nice_VisualDamageBatching.time = 0
        Nice_VisualDamageBatching.totalDamageDone = nil
        return
    end
    
    -- get player, reset if not the same
    local player = getPlayer()
    if player == nil or player.index ~= Nice_VisualDamageBatching.index then
        Nice_VisualDamageBatching.display = false
        Nice_VisualDamageBatching.displayLength = self.userData.length
        Nice_VisualDamageBatching.doneDamage = 0
        Nice_VisualDamageBatching.time = 0
        Nice_VisualDamageBatching.totalDamageDone = nil
        Nice_VisualDamageBatching.index = player.index
        Nice_VisualDamageBatching.score = player.score
        return
    elseif ((player.score ~= Nice_VisualDamageBatching.score and world.gameModeIndex ~= 3) or (world.gameModeIndex == 3 and string.match(world.mutators, "arena"))) or player.isDead then
        Nice_VisualDamageBatching.display = false
        Nice_VisualDamageBatching.displayLength = self.userData.length
        Nice_VisualDamageBatching.doneDamage = 0
        Nice_VisualDamageBatching.time = 0
        Nice_VisualDamageBatching.totalDamageDone = nil
        Nice_VisualDamageBatching.index = player.index
        Nice_VisualDamageBatching.score = player.score 
    end

    -- figure out if you did damage and how much
    Nice_VisualDamageBatching.ttlDmgDone = player.stats.totalDamageDone
    if Nice_VisualDamageBatching.totalDamageDone == nil then
        Nice_VisualDamageBatching.totalDamageDone = Nice_VisualDamageBatching.ttlDmgDone
        Nice_VisualDamageBatching.doneDamage = 0
        Nice_VisualDamageBatching.doingDamage = false
        Nice_VisualDamageBatching.display = false
        Nice_VisualDamageBatching.displayLength = self.userData.length
        Nice_VisualDamageBatching.armor = player.armor
    elseif Nice_VisualDamageBatching.ttlDmgDone > Nice_VisualDamageBatching.totalDamageDone then
        Nice_VisualDamageBatching.doneDamage = Nice_VisualDamageBatching.doneDamage + Nice_VisualDamageBatching.ttlDmgDone - Nice_VisualDamageBatching.totalDamageDone
        Nice_VisualDamageBatching.doingDamage = true
        Nice_VisualDamageBatching.display = true
        Nice_VisualDamageBatching.displayLength = self.userData.length
        Nice_VisualDamageBatching.totalDamageDone = Nice_VisualDamageBatching.ttlDmgDone
    end

    -- tick down damage display
    if Nice_VisualDamageBatching.doingDamage == true then
        Nice_VisualDamageBatching.displayLength = Nice_VisualDamageBatching.displayLength - deltaTime
        Nice_VisualDamageBatching.time = Nice_VisualDamageBatching.time + deltaTime
        if Nice_VisualDamageBatching.displayLength <= 0  or player.health <= 0 then
            Nice_VisualDamageBatching.display = false
            Nice_VisualDamageBatching.displayLength = self.userData.length
            Nice_VisualDamageBatching.totalDamageDone = Nice_VisualDamageBatching.ttlDmgDone
            Nice_VisualDamageBatching.doneDamage = 0
            Nice_VisualDamageBatching.doingDamage = false
            Nice_VisualDamageBatching.time = 0
            Nice_VisualDamageBatching.armor = player.armor
        end
    end
    -- display damage doing stuff
    if Nice_VisualDamageBatching.display == true and Nice_VisualDamageBatching.displayLength < (self.userData.length) and Nice_VisualDamageBatching.doingDamage == true then
        -- fade in, fade out animation
        if Nice_VisualDamageBatching.time < 0.33 then
            intensity = -((Nice_VisualDamageBatching.displayLength) - 3) * 255 * 2.6
        else
            intensity = 255 * math.min((Nice_VisualDamageBatching.displayLength) * 2.6, 1)
        end
        if Nice_VisualDamageBatching.doneDamage > 349 then
            nvgFillColor(Color(0, 0, 0))
            nvgSvg("internal/ui/icons/health", -(2 * self.userData.size + 2 * self.userData.spacing) + 1, 0, self.userData.size)
            nvgSvg("internal/ui/icons/armor", 1, 0, self.userData.size)
            nvgSvg("internal/ui/icons/health", 2 * self.userData.size + 2 * self.userData.spacing, 0, self.userData.size + 1, 0, self.userData.size)
            -- mh ra mh
            -- nvgFillColor(Color(0, 88, 192))
	    nvgFillColor(Color(255, 255, 255))
            nvgSvg("internal/ui/icons/health", -(2 * self.userData.size + 2 * self.userData.spacing), 0, self.userData.size)
            nvgFillColor(Color(184, 0, 0))
            nvgSvg("internal/ui/icons/armor", 0, 0, self.userData.size)
            nvgFillColor(Color(0, 88, 192))
            nvgSvg("internal/ui/icons/health", 2 * self.userData.size + 2 * self.userData.spacing, 0, self.userData.size)
        elseif Nice_VisualDamageBatching.doneDamage > 299 then
            nvgFillColor(Color(0, 0, 0))
            nvgSvg("internal/ui/icons/health", -(2 * self.userData.size + 2 * self.userData.spacing) + 1, 0, self.userData.size)
            nvgSvg("internal/ui/icons/armor", 1, 0, self.userData.size)
            nvgSvg("internal/ui/icons/health", 2 * self.userData.size + 2 * self.userData.spacing, 0, self.userData.size + 1, 0, self.userData.size)
            -- mh ya mh
            -- nvgFillColor(Color(0, 88, 192))
	    nvgFillColor(Color(255, 255, 255))
            nvgSvg("internal/ui/icons/health", -(2 * self.userData.size + 2 * self.userData.spacing), 0, self.userData.size)
            nvgFillColor(Color(224, 192, 0))
            nvgSvg("internal/ui/icons/armor", 0, 0, self.userData.size)
            nvgFillColor(Color(0, 88, 192))
            nvgSvg("internal/ui/icons/health", 2 * self.userData.size + 2 * self.userData.spacing, 0, self.userData.size)
        elseif Nice_VisualDamageBatching.doneDamage > 249 then
            nvgFillColor(Color(0, 0, 0))
            nvgSvg("internal/ui/icons/health", -(2 * self.userData.size + 2 * self.userData.spacing) + 1, 0, self.userData.size)
            nvgSvg("internal/ui/icons/armor", 1, 0, self.userData.size)
            -- mh ra
            -- nvgFillColor(Color(0, 88, 192))
	    nvgFillColor(Color(255, 255, 255))
            nvgSvg("internal/ui/icons/health", -(2 * self.userData.size + 2 * self.userData.spacing), 0, self.userData.size)
            nvgFillColor(Color(184, 0, 0))
            nvgSvg("internal/ui/icons/armor", 0, 0, self.userData.size)
        elseif Nice_VisualDamageBatching.doneDamage > 199 then
            nvgFillColor(Color(0, 0, 0))
            nvgSvg("internal/ui/icons/health", -(2 * self.userData.size + 2 * self.userData.spacing) + 1, 0, self.userData.size)
            nvgSvg("internal/ui/icons/armor", 1, 0, self.userData.size)
            -- mh ya
            -- nvgFillColor(Color(0, 88, 192))
	    nvgFillColor(Color(255, 255, 255))
            nvgSvg("internal/ui/icons/health", -(2 * self.userData.size + 2 * self.userData.spacing), 0, self.userData.size)
            nvgFillColor(Color(224, 192, 0))
            nvgSvg("internal/ui/icons/armor", 0, 0, self.userData.size)
        elseif Nice_VisualDamageBatching.doneDamage > 149 then
            nvgFillColor(Color(0, 0, 0))
            nvgSvg("internal/ui/icons/health", -(2 * self.userData.size + 2 * self.userData.spacing) + 1, 0, self.userData.size)
            nvgSvg("internal/ui/icons/armor", 1, 0, self.userData.size)
            -- mh ga
            -- nvgFillColor(Color(0, 88, 192))
	    nvgFillColor(Color(255, 255, 255))
            nvgSvg("internal/ui/icons/health", -(2 * self.userData.size + 2 * self.userData.spacing), 0, self.userData.size)
            nvgFillColor(Color(0, 160, 0))
            nvgSvg("internal/ui/icons/armor", 0, 0, self.userData.size)
        elseif Nice_VisualDamageBatching.doneDamage > 99 then
            nvgFillColor(Color(0, 0, 0))
            nvgSvg("internal/ui/icons/health", -(2 * self.userData.size + 2 * self.userData.spacing) + 1, 0, self.userData.size)
            -- mh
            -- nvgFillColor(Color(0, 88, 192))
	    nvgFillColor(Color(255, 255, 255))
            nvgSvg("internal/ui/icons/health", -(2 * self.userData.size + 2 * self.userData.spacing), 0, self.userData.size)
        elseif Nice_VisualDamageBatching.doneDamage > 49 then
            nvgFillColor(Color(0, 0, 0))
            nvgSvg("internal/ui/icons/health", -(2 * self.userData.size + 2 * self.userData.spacing) + 1, 0, self.userData.size)
            -- 50 health
            nvgFillColor(Color(0xff,0x80,0x00))
            nvgSvg("internal/ui/icons/health", -(2 * self.userData.size + 2 * self.userData.spacing), 0, self.userData.size)
        end
    end
end