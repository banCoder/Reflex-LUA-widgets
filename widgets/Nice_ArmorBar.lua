require "base/internal/ui/reflexcore"

Nice_ArmorBar = { index = 0, showDamage = 3, ttlDmgTaken = 0, totalDamageTaken = nil, takingDamage = false, armor = 0, ttlDmgDone = 0, totalDamageDone = nil, doneDamage = 0, doingDamage = false, displayLength = 3, display = false, time = 0 }
registerWidget("Nice_ArmorBar")

local move = 75

function Nice_ArmorBar:initialize()
    self.userData = loadUserData()
    CheckSetDefaultValue(self, "userData", "table", {})
    CheckSetDefaultValue(self.userData, "display_damage", "boolean", false)
    CheckSetDefaultValue(self.userData, "display_bar", "boolean", true)
    CheckSetDefaultValue(self.userData, "display_false_armor", "boolean", true)
    CheckSetDefaultValue(self.userData, "length", "number", 3)
    CheckSetDefaultValue(self.userData, "delay", "number", 0)
end

function Nice_ArmorBar:drawOptions(x, y)
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
    user.display_false_armor = ui2RowCheckbox(x, y, 176, "Display false armor", user.display_false_armor, optargs);
    nvgFillColor(Color(142,142,142,255))
    if user.display_false_armor == true then
        nvgText(x + 220, y + 30, "Armor number displays total armor")
    else
        nvgText(x + 220, y + 30, "Armor number displays only true armor")
    end

    y = y + 55
    user.display_bar = ui2RowCheckbox(x, y, 150, "Display bar", user.display_bar, optargs);
    nvgFillColor(Color(142,142,142,255))
    if user.display_bar == true then
        nvgText(x + 194, y + 30, "Health bar's background shows the amount of health you lost in the engagement")
    else
        nvgText(x + 194, y + 30, "Normal health bar background")
    end
    
    y = y + 55
    user.display_damage = ui2RowCheckbox(x, y, 150, "Display damage", user.display_damage, optargs);
    nvgFillColor(Color(142,142,142,255))
    if user.display_damage == true then
        nvgText(x + 194, y + 30, "Displays the amount of damage you are doing")
    else
        nvgText(x + 194, y + 30, "Does not display damage numbers")
    end

    if user.display_damage or user.display_bar then
        y = y + 55
        user.length = ui2RowSliderEditBox0Decimals(x, y, 90, 250, 40, "Length", user.length, 0, 10, optargs)
        nvgText(x + 260, y + 30, "How long do the damage numbers/ empty bar stay up for")

        y = y + 55
        user.delay = ui2RowSliderEditBox0Decimals(x, y, 90, 250, 40, "Delay", user.delay, 0, 10, optargs)
        if user.delay == 0 then
            nvgText(x + 260, y + 30, "Damage numbers/ empty bar shows instantly")
        else
            nvgText(x + 260, y + 30, "Damage numbers/ empty bar is delayed by " .. tostring(user.delay) .. "s")
        end
    end
    saveUserData(user)
end

function Nice_ArmorBar:draw()
    if not shouldShowHUD() then
        Nice_ArmorBar.display = false
        Nice_ArmorBar.displayLength = self.userData.length
        Nice_ArmorBar.doneDamage = 0
        Nice_ArmorBar.time = 0
        Nice_ArmorBar.totalDamageDone = nil
        Nice_ArmorBar.totalDamageTaken = nil
        Nice_ArmorBar.showDamage = self.userData.length
        Nice_ArmorBar.armor = 0
        move = 75
        return
    end

    -- get player, reset if not the same
    local player = getPlayer()
    if player == nil or player.index ~= Nice_ArmorBar.index then
        Nice_ArmorBar.display = false
        Nice_ArmorBar.showDamage = self.userData.length
        Nice_ArmorBar.displayLength = self.userData.length
        Nice_ArmorBar.doneDamage = 0
        Nice_ArmorBar.time = 0
        Nice_ArmorBar.totalDamageDone = nil
        Nice_ArmorBar.totalDamageTaken = nil
        Nice_ArmorBar.index = player.index
        Nice_ArmorBar.armor = player.armor
        move = 75
        return
    end

    -- figure out if you did damage and how much
        Nice_ArmorBar.ttlDmgDone = player.stats.totalDamageDone
        if Nice_ArmorBar.totalDamageDone == nil then
            Nice_ArmorBar.totalDamageDone = Nice_ArmorBar.ttlDmgDone
            Nice_ArmorBar.doneDamage = 0
            Nice_ArmorBar.doingDamage = false
            Nice_ArmorBar.display = false
            Nice_ArmorBar.displayLength = self.userData.length
            Nice_ArmorBar.showDamage = self.userData.length
            Nice_ArmorBar.armor = player.armor
            move = 75
        elseif Nice_ArmorBar.ttlDmgDone > Nice_ArmorBar.totalDamageDone then
            Nice_ArmorBar.doneDamage = Nice_ArmorBar.doneDamage + Nice_ArmorBar.ttlDmgDone - Nice_ArmorBar.totalDamageDone
            Nice_ArmorBar.doingDamage = true
            Nice_ArmorBar.display = true
            Nice_ArmorBar.displayLength = self.userData.length
            Nice_ArmorBar.showDamage = self.userData.length
            Nice_ArmorBar.totalDamageDone = Nice_ArmorBar.ttlDmgDone
        end

        -- figure out if you took damage and how much
        Nice_ArmorBar.ttlDmgTaken = player.stats.totalDamageReceived
        if Nice_ArmorBar.totalDamageTaken == nil then
            Nice_ArmorBar.totalDamageTaken = Nice_ArmorBar.ttlDmgTaken
            Nice_ArmorBar.takingDamage = false
            Nice_ArmorBar.showDamage = self.userData.length
        elseif Nice_ArmorBar.ttlDmgTaken > Nice_ArmorBar.totalDamageTaken then
            Nice_ArmorBar.takingDamage = true
            Nice_ArmorBar.showDamage = self.userData.length
            Nice_ArmorBar.totalDamageTaken = Nice_ArmorBar.ttlDmgTaken
        end

        -- tick down taking damage stuff
        if Nice_ArmorBar.takingDamage == true then
            Nice_ArmorBar.showDamage = Nice_ArmorBar.showDamage - deltaTime
            if Nice_ArmorBar.showDamage <= -self.userData.delay  or player.health <= 0 then
                Nice_ArmorBar.takingDamage = false
                Nice_ArmorBar.totalDamageTaken = Nice_ArmorBar.ttlDmgTaken
                Nice_ArmorBar.showDamage = self.userData.length
                Nice_ArmorBar.showDamage = self.userData.length
            end
        end

        -- tick down damage display
        if Nice_ArmorBar.doingDamage == true then
            Nice_ArmorBar.displayLength = Nice_ArmorBar.displayLength - deltaTime
            Nice_ArmorBar.time = Nice_ArmorBar.time + deltaTime
            if Nice_ArmorBar.displayLength <= -self.userData.delay  or player.health <= 0 then
                Nice_ArmorBar.display = false
                Nice_ArmorBar.displayLength = self.userData.length
                Nice_ArmorBar.showDamage = self.userData.length
                Nice_ArmorBar.totalDamageDone = Nice_ArmorBar.ttlDmgDone
                Nice_ArmorBar.doneDamage = 0
                Nice_ArmorBar.doingDamage = false
                Nice_ArmorBar.time = 0
                Nice_ArmorBar.armor = player.armor
                move = 75
            end
        end

        -- update armor
        if player.armor > Nice_ArmorBar.armor or Nice_ArmorBar.takingDamage == false then
            Nice_ArmorBar.armor = player.armor
        end

    if self.userData.display_damage then
        -- display damage doing stuff
        if Nice_ArmorBar.display == true and Nice_ArmorBar.displayLength < (self.userData.length - self.userData.delay) and Nice_ArmorBar.doingDamage == true then
            -- fade in, fade out animation
            if Nice_ArmorBar.time < 0.33 then
                intensity = -((Nice_ArmorBar.displayLength + self.userData.delay) - 3) * 255 * 2.6
            else
                intensity = 255 * math.min((Nice_ArmorBar.displayLength + self.userData.delay) * 2.6, 1)
            end

            -- outter text
            nvgFontBlur(3)
            nvgFontSize(80)
            nvgTextAlign(NVG_ALIGN_LEFT, NVG_ALIGN_BOTTOM)
            move = math.max(move - Nice_ArmorBar.time * 3, 0)
            if Nice_ArmorBar.doneDamage > 201 then
                nvgFillColor(Color(0x00, 0x58, 0xc0, math.min(20000, intensity)))
            elseif Nice_ArmorBar.doneDamage > 101 then
                nvgFillColor(Color(0x00, 0xa0, 0x00, math.min(20000, intensity)))
            elseif Nice_ArmorBar.doneDamage > 51 then
                nvgFillColor(Color(0x00, 0x58, 0xc0, math.min(20000, intensity)))
            elseif Nice_ArmorBar.doneDamage > 0 then
                nvgFillColor(Color(0, 0, 0, math.min(20000, intensity)))
            end
            nvgText((player.armor + 5) * 2.6, move, Nice_ArmorBar.doneDamage)

            -- damage you're doing
            -- color depending on amount of damage done
            nvgFontBlur(0)
            if Nice_ArmorBar.doneDamage > 201 then
                nvgFillColor(Color(0xb8, 0x00, 0x00, math.min(255, intensity)))
            elseif Nice_ArmorBar.doneDamage > 101 then
                nvgFillColor(Color(0xe0, 0xc0, 0x00, math.min(255, intensity)))
            elseif Nice_ArmorBar.doneDamage > 51 then
                nvgFillColor(Color(0x00, 0xa0, 0x00, math.min(255, intensity)))
            elseif Nice_ArmorBar.doneDamage > 0 then
                nvgFillColor(Color(255, 255, 255, math.min(255, intensity)))
            end
            nvgText((player.armor + 5) * 2.6, move, Nice_ArmorBar.doneDamage)
        else
            move = 75
        end
        if self.userData.display_bar then
            -- background
            if player.armor > 0 then
                nvgBeginPath()
                nvgRoundedRect(-5, -5, (Nice_ArmorBar.armor + 4) * 2.6, 80, 5)
                nvgFillColor(Color(0, 0, 0, 150))
                nvgFill()
            end
        else
            -- background
            if player.armor > 0 then
                nvgBeginPath()
                nvgRoundedRect(-5, -5, (player.armor + 4) * 2.6, 80, 5)
                nvgFillColor(Color(0, 0, 0, 150))
                nvgFill()
            end
        end
    else
        -- background
        if self.userData.display_bar then
            -- background
            if player.armor > 0 then
                nvgBeginPath()
                nvgRoundedRect(-5, -5, (Nice_ArmorBar.armor + 4) * 2.6, 80, 5)
                nvgFillColor(Color(0, 0, 0, 150))
                nvgFill()
            end
        else
            -- background
            if player.armor > 0 then
                nvgBeginPath()
                nvgRoundedRect(-5, -5, (player.armor + 4) * 2.6, 80, 5)
                nvgFillColor(Color(0, 0, 0, 150))
                nvgFill()
            end
        end
    end
    
    -- armor bar and number
    if player.armor > 0 then
        -- true armor
        nvgBeginPath()
        trueArmor = math.min(math.min(player.health * (player.armorProtection + 1), player.armor), 200)
        nvgRect(0, 0, trueArmor * 2.6, 70)
        if player.armorProtection == 0 then
        nvgFillColor(Color(0x00, 0xa0, 0x00, 180))
        elseif player.armorProtection == 1 then
            nvgFillColor(Color(0xe0, 0xc0, 0x00, 180))
        elseif player.armorProtection == 2 then
            nvgFillColor(Color(0xb8, 0x00, 0x00, 180))
        end
        nvgFill()
        -- false armor
        nvgBeginPath()
        falseArmor = player.armor - (player.armor - trueArmor)
        if player.armorProtection == 0 then
            nvgFillColor(Color(0x00, 0xa0, 0x00, 50))
        elseif player.armorProtection == 1 then
            nvgFillColor(Color(0xe0, 0xc0, 0x00, 50))
        elseif player.armorProtection == 2 then
            nvgFillColor(Color(0xb8, 0x00, 0x00, 50))
        end
        nvgRect(trueArmor * 2.6, 0, (player.armor - trueArmor) * 2.6, 70)
        nvgFill()
    else
        falseArmor = 0
        trueArmor = 0
    end
    
    -- outter text
    if player.armorProtection == 0 then
        nvgFillColor(Color(0x00, 0x58, 0xc0, 2000))
    elseif player.armorProtection == 1 then
        --nvgFillColor(Color(0x00, 0xa0, 0x00, 2000))
        nvgFillColor(Color(253, 40, 252, 2000))
    elseif player.armorProtection == 2 then
        nvgFillColor(Color(0x00, 0x58, 0xc0, 2000))
    end
    nvgTextAlign(NVG_ALIGN_RIGHT, NVG_ALIGN_RIGHT)
    nvgFontSize(117)
    nvgFontBlur(1)
    if self.userData.display_false_armor then
        --nvgText(-3, 32, player.armor)
        nvgText(-5, 35, player.armor)
    else
        --nvgText(-3, 32, falseArmor)
        nvgText(-5, 35, falseArmor)
    end

    -- text
    if player.armorProtection == 0 then
        nvgFillColor(Color(0x00, 0xa0, 0x00))
    elseif player.armorProtection == 1 then
        nvgFillColor(Color(0xe0, 0xc0, 0x00))
    elseif player.armorProtection == 2 then
        nvgFillColor(Color(0xb8, 0x00, 0x00))
    end
    if self.userData.display_false_armor then
        nvgText(-5, 35, player.armor)
    else
        nvgText(-5, 35, falseArmor)
    end

    -- 25, 50 and 100 marks
    local ayy = 0
    for i = 25, player.armor, 25 do
        ayy = ayy + 1
        if ayy > 4 then ayy = 1 end
        if ayy == 1 or ayy == 3 then
            nvgBeginPath()
            nvgRect(math.floor(i / 25) * 25 * 2.6, 20, -1, 30)
            nvgFillColor(Color(0, 0, 0))
            nvgFill()
        elseif ayy == 2 then
            nvgBeginPath()
            nvgRect(math.floor(i / 50) * 50 * 2.6, 10, -2, 50)
            nvgFillColor(Color(0, 0, 0))
            nvgFill()
        elseif ayy == 4 then
            nvgBeginPath()
            nvgRect(math.floor(i / 100) * 100 * 2.6, 0, -3, 70)
            nvgFillColor(Color(0, 0, 0))
            nvgFill()
        end
    end
end