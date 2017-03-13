require "base/internal/ui/reflexcore"

Nice_HealthBar = { index = 0, health = 0, ttlDmgTaken = 0, totalDamageTaken = nil, takenDamage = 0, takingDamage = false, displayLength = 3, display = false, time = 0 }
registerWidget("Nice_HealthBar")

local move = 75

function Nice_HealthBar:initialize()
    self.userData = loadUserData()
    CheckSetDefaultValue(self, "userData", "table", {})
    CheckSetDefaultValue(self.userData, "display_damage", "boolean", false)
    CheckSetDefaultValue(self.userData, "display_bar", "boolean", true)
    CheckSetDefaultValue(self.userData, "length", "number", 3)
    CheckSetDefaultValue(self.userData, "delay", "number", 0)
end

function Nice_HealthBar:drawOptions(x, y)
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
        nvgText(x + 194, y + 30, "Displays the amount of damage you are taking")
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

function Nice_HealthBar:draw()
    if not shouldShowHUD() then
        Nice_HealthBar.display = false
        Nice_HealthBar.displayLength = self.userData.length
        Nice_HealthBar.takenDamage = 0
        Nice_HealthBar.time = 0
        Nice_HealthBar.totalDamageTaken = nil
        Nice_HealthBar.health = 0
        move = 75
        return
    end
    
    -- get player, reset if not the same
    local player = getPlayer()
    if player == nil or player.index ~= Nice_HealthBar.index then
        Nice_HealthBar.display = false
        Nice_HealthBar.displayLength = self.userData.length
        Nice_HealthBar.takenDamage = 0
        Nice_HealthBar.time = 0
        Nice_HealthBar.totalDamageTaken = nil
        Nice_HealthBar.index = player.index
        Nice_HealthBar.health = player.health
        move = 75
        return
    end

    -- figure out if you took damage and how much
        Nice_HealthBar.ttlDmgTaken = player.stats.totalDamageReceived
        if Nice_HealthBar.totalDamageTaken == nil then
            Nice_HealthBar.totalDamageTaken = Nice_HealthBar.ttlDmgTaken
            Nice_HealthBar.takenDamage = 0
            Nice_HealthBar.takingDamage = false
            Nice_HealthBar.display = false
            Nice_HealthBar.displayLength = self.userData.length
            Nice_HealthBar.health = player.health
            move = 75
        elseif Nice_HealthBar.ttlDmgTaken > Nice_HealthBar.totalDamageTaken then
            Nice_HealthBar.takenDamage = Nice_HealthBar.takenDamage + Nice_HealthBar.ttlDmgTaken - Nice_HealthBar.totalDamageTaken
            Nice_HealthBar.takingDamage = true
            Nice_HealthBar.display = true
            Nice_HealthBar.displayLength = self.userData.length
            Nice_HealthBar.totalDamageTaken = Nice_HealthBar.ttlDmgTaken
        end

        -- tick down damage display
        if Nice_HealthBar.takingDamage == true then
            Nice_HealthBar.displayLength = Nice_HealthBar.displayLength - deltaTime
            if Nice_HealthBar.displayLength <= -self.userData.delay  or player.health <= 0 then
                Nice_HealthBar.display = false
                Nice_HealthBar.displayLength = self.userData.length
                Nice_HealthBar.totalDamageTaken = Nice_HealthBar.ttlDmgTaken
                Nice_HealthBar.takenDamage = 0
                Nice_HealthBar.takingDamage = false
                Nice_HealthBar.time = 0
                Nice_HealthBar.health = player.health
                move = 75
            end
        end

        -- update health
        if player.health > Nice_HealthBar.health or Nice_HealthBar.takingDamage == false then
            Nice_HealthBar.health = player.health
        end

    if self.userData.display_damage then
        -- display damage taking stuff
        if Nice_HealthBar.display == true and Nice_HealthBar.displayLength < (self.userData.length - self.userData.delay) and Nice_HealthBar.takingDamage == true then
            Nice_HealthBar.time = Nice_HealthBar.time + deltaTime
            -- fade in, fade out animation
            if Nice_HealthBar.time < 0.33 then
                intensity = -((Nice_HealthBar.displayLength + self.userData.delay) - 3) * 255 * 2.6
            else
                intensity = 255 * math.min((Nice_HealthBar.displayLength + self.userData.delay) * 2.6, 1)
            end

            -- outter text
            nvgTextAlign(NVG_ALIGN_RIGHT, NVG_ALIGN_BOTTOM)
            if Nice_HealthBar.takenDamage > 201 then
                nvgFillColor(Color(0x00, 0x58, 0xc0, math.min(255, intensity)))
            elseif Nice_HealthBar.takenDamage > 101 then
                nvgFillColor(Color(0x00, 0xa0, 0x00, math.min(255, intensity)))
            elseif Nice_HealthBar.takenDamage > 51 then
                nvgFillColor(Color(0x00, 0x58, 0xc0, math.min(255, intensity)))
            elseif Nice_HealthBar.takenDamage > 0 then
                nvgFillColor(Color(0, 0, 0, math.min(255, intensity)))
            end
            move = math.max(move - Nice_HealthBar.time * 3, 0)
            nvgFontSize((((Nice_HealthBar.takenDamage + 250)) * 0.22) * 1.1)
            if player.health >= 100 then
                nvgText(-(player.health - 100 + 2) * 5.2 - 2, move - 2, Nice_HealthBar.takenDamage)
            else
                nvgText(-(player.health + 2) * 5.2 - 2, move - 2, Nice_HealthBar.takenDamage)
            end
        
            -- damage you're taking
            -- color depending on amount of damage taken
            if Nice_HealthBar.takenDamage > 201 then
                nvgFillColor(Color(0xb8, 0x00, 0x00, math.min(255, intensity)))
            elseif Nice_HealthBar.takenDamage > 101 then
                nvgFillColor(Color(0xe0, 0xc0, 0x00, math.min(255, intensity)))
            elseif Nice_HealthBar.takenDamage > 51 then
                nvgFillColor(Color(0x00, 0xa0, 0x00, math.min(255, intensity)))
            elseif Nice_HealthBar.takenDamage > 0 then
                nvgFillColor(Color(255, 255, 255, math.min(255, intensity)))
            end
            if player.health >= 100 then
                nvgText(-(player.health - 100 + 2) * 5.2, move, Nice_HealthBar.takenDamage)
            else
                nvgText(-(player.health + 2) * 5.2, move, Nice_HealthBar.takenDamage)
            end
       else
           move = 75
       end
       if self.userData.display_bar then
            -- background
            nvgBeginPath()
            if Nice_HealthBar.health <= 100 then
                nvgRoundedRect(5, -5, -(Nice_HealthBar.health + 2) * 5.2, 80, 5)
                nvgFillColor(Color(0, 0, 0, 150))
            else
                nvgRoundedRect(5, -9, -(Nice_HealthBar.health - 100 +1) * 5.2, 88, 5)
                nvgFillColor(Color(0, 0, 0, 150))
            end
            nvgFill()
        else
            -- background
            nvgBeginPath()
            if player.health <= 100 then
                nvgRoundedRect(5, -5, -(player.health + 2) * 5.2, 80, 5)
                nvgFillColor(Color(0, 0, 0, 150))
            else
                nvgRoundedRect(5, -9, -(player.health - 100 +1) * 5.2, 88, 5)
                nvgFillColor(Color(0, 0, 0, 150))
            end
            nvgFill()
        end
    else
        if self.userData.display_bar then
            -- background
            nvgBeginPath()
            if Nice_HealthBar.health <= 100 then
                nvgRoundedRect(5, -5, -(Nice_HealthBar.health + 2) * 5.2, 80, 5)
                nvgFillColor(Color(0, 0, 0, 150))
            else
                nvgRoundedRect(5, -9, -(Nice_HealthBar.health - 100 +1) * 5.2, 88, 5)
                nvgFillColor(Color(0, 0, 0, 150))
            end
            nvgFill()
        else
            -- background
            nvgBeginPath()
            if player.health <= 100 then
                nvgRoundedRect(5, -5, -(player.health + 2) * 5.2, 80, 5)
                nvgFillColor(Color(0, 0, 0, 150))
            else
                nvgRoundedRect(5, -9, -(player.health - 100 +1) * 5.2, 88, 5)
                nvgFillColor(Color(0, 0, 0, 150))
            end
            nvgFill()
        end
    end

    -- health bar and number
    if player.health <= 100 then
        nvgBeginPath()
        nvgRect(0, 0, -(player.health * 5.2), 70)
        if player.health > 80 then
            nvgFillColor(Color(0x00, 0xa0, 0x00, 180))
        elseif player.health > 30 then
            nvgFillColor(Color(0xe0, 0xc0, 0x00, 180))
        elseif player.health > 0 then
            nvgFillColor(Color(0xb8, 0x00, 0x00, 180))
        end
        nvgFill()
    else
        nvgBeginPath()
        nvgRect(0, 0, -(100 * 5.2), 70)
        nvgFillColor(Color(0x00, 0xa0, 0x00, 180))
        nvgFill()
        nvgBeginPath()
        nvgRect(0, 0, -((player.health - 100) * 5.2), 70)
        nvgFillColor(Color(0x00, 0x58, 0xc0))
        nvgFill()
    end

    -- outter text
    if player.health > 100 then
        nvgFillColor(Color(0, 0, 0, 2000))
    elseif player.health > 80 then
        nvgFillColor(Color(0x00, 0x58, 0xc0, 2000))
    elseif player.health > 30 then
        --nvgFillColor(Color(0x00, 0xa0, 0x00, 2000))
        nvgFillColor(Color(253, 40, 252, 2000))
    elseif player.health > 0 then
        nvgFillColor(Color(0x00, 0x58, 0xc0, 2000))
    end
    nvgTextAlign(NVG_ALIGN_LEFT, NVG_ALIGN_LEFT)
    nvgFontSize(117)
    nvgFontBlur(1)
    --nvgText(2, 67, player.health)
    nvgText(5, 70, player.health)

    -- text
    if player.health > 100 then
        nvgFillColor(Color(0x00, 0x58, 0xc0))
    elseif player.health > 80 then
        nvgFillColor(Color(0x00, 0xa0, 0x00))
    elseif player.health > 30 then
        nvgFillColor(Color(0xe0, 0xc0, 0x00))
    elseif player.health > 0 then
        nvgFillColor(Color(0xb8, 0x00, 0x00))
    end
    nvgText(5, 70, player.health)

    -- 25 and 50 marks
    local ayy = 0
    for i = 25, math.min(100, player.health), 25 do
        ayy = ayy + 1
        if ayy > 4 then ayy = 1 end
        if ayy == 1 or ayy == 3 then
            nvgBeginPath()
            nvgRect(-(math.floor(i / 25) * 25) * 5.2, 20, -1, 30)
            nvgFillColor(Color(0, 0, 0))
            nvgFill()
        elseif ayy == 2 then
            nvgBeginPath()
            nvgRect(-(math.floor(i / 50) * 50) * 5.2, 10, -2, 50)
            nvgFillColor(Color(0, 0, 0))
            nvgFill()
        end
    end
end