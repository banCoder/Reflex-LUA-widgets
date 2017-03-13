require "base/internal/ui/reflexcore"

Nice_VisualDamageBatching = { index = 0, ttlDmgDone = 0, totalDamageDone = nil, doneDamage = 0, doingDamage = false, actualDisplay = false, displayLength = 3, display = false, time = 0 }
registerWidget("Nice_VisualDamageBatching")

local move = 75

function Nice_VisualDamageBatching:initialize()
    self.userData = loadUserData()
    CheckSetDefaultValue(self, "userData", "table", {})
    CheckSetDefaultValue(self.userData, "length", "number", 3)
    CheckSetDefaultValue(self.userData, "delay", "number", 0)
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
    user.length = ui2RowSliderEditBox0Decimals(x, y, 90, 250, 40, "Length", user.length, 0, 10, optargs)
    nvgText(x + 260, y + 30, "How long do the damage numbers stay up for")

    y = y + 55
    user.delay = ui2RowSliderEditBox0Decimals(x, y, 90, 250, 40, "Delay", user.delay, 0, 10, optargs)
    if user.delay == 0 then
        nvgText(x + 260, y + 30, "Damage numbers show instantly")
    else
        nvgText(x + 260, y + 30, "Damage numbers are delayed by " .. tostring(user.delay) .. "s")
    end
    saveUserData(user)
end

function Nice_VisualDamageBatching:draw()
    if not shouldShowHUD() then
        Nice_VisualDamageBatching.display = false
        Nice_VisualDamageBatching.displayLength = self.userData.length
        Nice_VisualDamageBatching.doneDamage = 0
        Nice_VisualDamageBatching.time = 0
        Nice_VisualDamageBatching.totalDamageDone = nil
        move = 75
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
        move = 75
        return
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
        move = 75
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
        if Nice_VisualDamageBatching.displayLength <= -self.userData.delay  or player.health <= 0 then
            Nice_VisualDamageBatching.display = false
            Nice_VisualDamageBatching.displayLength = self.userData.length
            Nice_VisualDamageBatching.totalDamageDone = Nice_VisualDamageBatching.ttlDmgDone
            Nice_VisualDamageBatching.doneDamage = 0
            Nice_VisualDamageBatching.doingDamage = false
            Nice_VisualDamageBatching.time = 0
            Nice_VisualDamageBatching.armor = player.armor
            move = 75
        end
    end

    -- display damage doing stuff
    if Nice_VisualDamageBatching.display == true and Nice_VisualDamageBatching.displayLength < (self.userData.length - self.userData.delay) and Nice_VisualDamageBatching.doingDamage == true then
        -- fade in, fade out animation
        if Nice_VisualDamageBatching.time < 0.33 then
            intensity = -((Nice_VisualDamageBatching.displayLength + self.userData.delay) - 3) * 255 * 2.6
        else
            intensity = 255 * math.min((Nice_VisualDamageBatching.displayLength + self.userData.delay) * 2.6, 1)
        end

        -- outter text
        nvgFontSize(math.min((((Nice_VisualDamageBatching.doneDamage + 250)) * 0.22) * 1.1), 500)
        nvgTextAlign(NVG_ALIGN_CENTER, NVG_ALIGN_BOTTOM)
        move = math.max(move - Nice_VisualDamageBatching.time * 3, 0)
        if Nice_VisualDamageBatching.doneDamage > 201 then
            nvgFillColor(Color(0x00, 0x58, 0xc0, math.min(255, intensity)))
        elseif Nice_VisualDamageBatching.doneDamage > 101 then
            nvgFillColor(Color(0x00, 0xa0, 0x00, math.min(255, intensity)))
        elseif Nice_VisualDamageBatching.doneDamage > 51 then
            nvgFillColor(Color(0x00, 0x58, 0xc0, math.min(255, intensity)))
        elseif Nice_VisualDamageBatching.doneDamage > 0 then
            nvgFillColor(Color(0, 0, 0, math.min(255, intensity)))
        end
        nvgText(2, move - 1, Nice_VisualDamageBatching.doneDamage)

        -- damage you're doing
        -- color depending on amount of damage done
        if Nice_VisualDamageBatching.doneDamage > 201 then
            nvgFillColor(Color(0xb8, 0x00, 0x00, math.min(255, intensity)))
        elseif Nice_VisualDamageBatching.doneDamage > 101 then
            nvgFillColor(Color(0xe0, 0xc0, 0x00, math.min(255, intensity)))
        elseif Nice_VisualDamageBatching.doneDamage > 51 then
            nvgFillColor(Color(0x00, 0xa0, 0x00, math.min(255, intensity)))
        elseif Nice_VisualDamageBatching.doneDamage > 0 then
            nvgFillColor(Color(255, 255, 255, math.min(255, intensity)))
        end
        nvgText(0, move, Nice_VisualDamageBatching.doneDamage)
    else
        move = 75
    end
end