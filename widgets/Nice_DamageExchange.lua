require "base/internal/ui/reflexcore"

Nice_DamageExchange = { index = 0, ttlDmgDone = 0, totalDamageDone = nil, doneDamage = 0, doingDamage = false, ttlDmgTaken = 0, totalDamageTaken = nil, takenDamage = 0, actualDisplay = false, takingDamage = false, displayLength = 3, display = false, time = 0 }
registerWidget("Nice_DamageExchange")

local move = 75

function Nice_DamageExchange:initialize()
    self.userData = loadUserData()
    CheckSetDefaultValue(self, "userData", "table", {})
    CheckSetDefaultValue(self.userData, "display", "number", 1)
    CheckSetDefaultValue(self.userData, "length", "number", 3)
    CheckSetDefaultValue(self.userData, "delay", "number", 0)
end

function Nice_DamageExchange:drawOptions(x, y)
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
    user.display = ui2RowSliderEditBox0Decimals(x, y, 90, 200, 35, "Display", user.display, 1, 3, optargs)
    if user.display == 1 then
        nvgText(x + 210, y + 30, "Show damage exchanged (damage done - damage taken)")
    elseif user.display == 2 then
        nvgText(x + 210, y + 30, "Only show damage taken")
    else
        nvgText(x + 210, y + 30, "Only show damage done")
    end

    y = y + 55
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

function Nice_DamageExchange:draw()
    if not shouldShowHUD() then
        Nice_DamageExchange.display = false
        Nice_DamageExchange.displayLength = self.userData.length
        Nice_DamageExchange.takenDamage = 0
        Nice_DamageExchange.doneDamage = 0
        Nice_DamageExchange.time = 0
        Nice_DamageExchange.totalDamageTaken = nil
        Nice_DamageExchange.totalDamageDone = nil
        move = 75
        return
    end
    
    -- get player, reset if not the same
    local player = getPlayer()
    if player == nil or player.index ~= Nice_DamageExchange.index then
        Nice_DamageExchange.display = false
        Nice_DamageExchange.displayLength = self.userData.length
        Nice_DamageExchange.takenDamage = 0
        Nice_DamageExchange.doneDamage = 0
        Nice_DamageExchange.time = 0
        Nice_DamageExchange.totalDamageTaken = nil
        Nice_DamageExchange.totalDamageDone = nil
        Nice_DamageExchange.index = player.index
        move = 75
        return
    end

    if self.userData.display == 1 then
        -- figure out if you did damage and how much
        Nice_DamageExchange.ttlDmgDone = player.stats.totalDamageDone
        if Nice_DamageExchange.totalDamageDone == nil then
            Nice_DamageExchange.totalDamageDone = Nice_DamageExchange.ttlDmgDone
            Nice_DamageExchange.doneDamage = 0
            Nice_DamageExchange.doingDamage = false
            Nice_DamageExchange.display = false
            Nice_DamageExchange.displayLength = self.userData.length
            Nice_DamageExchange.armor = player.armor
            move = 75
        elseif Nice_DamageExchange.ttlDmgDone > Nice_DamageExchange.totalDamageDone then
            Nice_DamageExchange.doneDamage = Nice_DamageExchange.doneDamage + Nice_DamageExchange.ttlDmgDone - Nice_DamageExchange.totalDamageDone
            Nice_DamageExchange.doingDamage = true
            Nice_DamageExchange.display = true
            Nice_DamageExchange.displayLength = self.userData.length
            Nice_DamageExchange.totalDamageDone = Nice_DamageExchange.ttlDmgDone
        end

        -- figure out if you took damage and how much
        Nice_DamageExchange.ttlDmgTaken = player.stats.totalDamageReceived
        if Nice_DamageExchange.totalDamageTaken == nil then
            Nice_DamageExchange.totalDamageTaken = Nice_DamageExchange.ttlDmgTaken
            Nice_DamageExchange.takenDamage = 0
            Nice_DamageExchange.takingDamage = false
            Nice_DamageExchange.display = false
            Nice_DamageExchange.displayLength = self.userData.length
            Nice_DamageExchange.health = player.health
            move = 75
        elseif Nice_DamageExchange.ttlDmgTaken > Nice_DamageExchange.totalDamageTaken then
            Nice_DamageExchange.takenDamage = Nice_DamageExchange.takenDamage + Nice_DamageExchange.ttlDmgTaken - Nice_DamageExchange.totalDamageTaken
            Nice_DamageExchange.takingDamage = true
            Nice_DamageExchange.display = true
            Nice_DamageExchange.displayLength = self.userData.length
            Nice_DamageExchange.totalDamageTaken = Nice_DamageExchange.ttlDmgTaken
        end

        -- tick down damage display
        if Nice_DamageExchange.takingDamage == true or Nice_DamageExchange.doingDamage == true then
            Nice_DamageExchange.displayLength = Nice_DamageExchange.displayLength - deltaTime
            if Nice_DamageExchange.displayLength <= -self.userData.delay  or player.health <= 0 then
                Nice_DamageExchange.display = false
                Nice_DamageExchange.displayLength = self.userData.length
                Nice_DamageExchange.totalDamageTaken = Nice_DamageExchange.ttlDmgTaken
                Nice_DamageExchange.totalDamageDone = Nice_DamageExchange.ttlDmgDone
                Nice_DamageExchange.takenDamage = 0
                Nice_DamageExchange.doneDamage = 0
                Nice_DamageExchange.takingDamage = false
                Nice_DamageExchange.doingDamage = false
                Nice_DamageExchange.time = 0
                move = 75
            end
        end

        -- display damage taking stuff
        if Nice_DamageExchange.display == true and Nice_DamageExchange.displayLength < (self.userData.length - self.userData.delay) and (Nice_DamageExchange.takingDamage == true or Nice_DamageExchange.doingDamage == true) then
            Nice_DamageExchange.time = Nice_DamageExchange.time + deltaTime
            -- fade in, fade out animation
            if Nice_DamageExchange.time < 0.33 then
                intensity = -((Nice_DamageExchange.displayLength + self.userData.delay) - 3) * 255 * 2.6
            else
                intensity = 255 * math.min((Nice_DamageExchange.displayLength + self.userData.delay) * 2.6, 1)
            end

            -- outter text
            nvgTextAlign(NVG_ALIGN_CENTER, NVG_ALIGN_BOTTOM)
            if Nice_DamageExchange.takenDamage > 201 then
                nvgFillColor(Color(0x00, 0x58, 0xc0, math.min(255, intensity)))
            elseif Nice_DamageExchange.takenDamage > 101 then
                nvgFillColor(Color(0x00, 0xa0, 0x00, math.min(255, intensity)))
            elseif Nice_DamageExchange.takenDamage > 51 then
                nvgFillColor(Color(0x00, 0x58, 0xc0, math.min(255, intensity)))
            elseif Nice_DamageExchange.takenDamage > 0 then
                nvgFillColor(Color(0, 0, 0, math.min(255, intensity)))
            end
            move = math.max(move - Nice_DamageExchange.time * 3, 0)
            -- size depending on amount lost/ gained
            if Nice_DamageExchange.takenDamage > Nice_DamageExchange.doneDamage then
                nvgFontSize(math.min((((Nice_DamageExchange.takenDamage - Nice_DamageExchange.doneDamage + 250)) * 0.22) * 1.1, 500))
            else
                nvgFontSize(math.min((((Nice_DamageExchange.doneDamage - Nice_DamageExchange.takenDamage + 250)) * 0.22) * 1.1, 500))
            end
            -- damage you're exchanging
            -- color depending on who's winning
            if Nice_DamageExchange.takenDamage > Nice_DamageExchange.doneDamage then
                nvgFillColor(Color(0x00, 0x58, 0xc0, math.min(255, intensity)))
                nvgText(2, move - 1, Nice_DamageExchange.doneDamage - Nice_DamageExchange.takenDamage)
                nvgFillColor(Color(0xb8, 0x00, 0x00, math.min(255, intensity)))
                nvgText(0, move, Nice_DamageExchange.doneDamage - Nice_DamageExchange.takenDamage)
            else
                nvgFillColor(Color(0x00, 0x58, 0xc0, math.min(255, intensity)))
                nvgText(2, move - 1, Nice_DamageExchange.doneDamage - Nice_DamageExchange.takenDamage)
                nvgFillColor(Color(0x00, 0xa0, 0x00, math.min(255, intensity)))
                nvgText(0, move, Nice_DamageExchange.doneDamage - Nice_DamageExchange.takenDamage)
            end
       else
           move = 75
       end
   elseif self.userData.display == 2 then
        -- figure out if you took damage and how much
        Nice_DamageExchange.ttlDmgTaken = player.stats.totalDamageReceived
        if Nice_DamageExchange.totalDamageTaken == nil then
            Nice_DamageExchange.totalDamageTaken = Nice_DamageExchange.ttlDmgTaken
            Nice_DamageExchange.takenDamage = 0
            Nice_DamageExchange.takingDamage = false
            Nice_DamageExchange.display = false
            Nice_DamageExchange.displayLength = self.userData.length
            Nice_DamageExchange.health = player.health
            move = 75
        elseif Nice_DamageExchange.ttlDmgTaken > Nice_DamageExchange.totalDamageTaken then
            Nice_DamageExchange.takenDamage = Nice_DamageExchange.takenDamage + Nice_DamageExchange.ttlDmgTaken - Nice_DamageExchange.totalDamageTaken
            Nice_DamageExchange.takingDamage = true
            Nice_DamageExchange.display = true
            Nice_DamageExchange.displayLength = self.userData.length
            Nice_DamageExchange.totalDamageTaken = Nice_DamageExchange.ttlDmgTaken
        end

        -- tick down damage display
        if Nice_DamageExchange.takingDamage == true then
            Nice_DamageExchange.displayLength = Nice_DamageExchange.displayLength - deltaTime
            if Nice_DamageExchange.displayLength <= -self.userData.delay  or player.health <= 0 then
                Nice_DamageExchange.display = false
                Nice_DamageExchange.displayLength = self.userData.length
                Nice_DamageExchange.totalDamageTaken = Nice_DamageExchange.ttlDmgTaken
                Nice_DamageExchange.takenDamage = 0
                Nice_DamageExchange.takingDamage = false
                Nice_DamageExchange.time = 0
                move = 75
            end
        end

        -- display damage taking stuff
        if Nice_DamageExchange.display == true and Nice_DamageExchange.displayLength < (self.userData.length - self.userData.delay) and Nice_DamageExchange.takingDamage == true then
            Nice_DamageExchange.time = Nice_DamageExchange.time + deltaTime
            -- fade in, fade out animation
            if Nice_DamageExchange.time < 0.33 then
                intensity = -((Nice_DamageExchange.displayLength + self.userData.delay) - 3) * 255 * 2.6
            else
                intensity = 255 * math.min((Nice_DamageExchange.displayLength + self.userData.delay) * 2.6, 1)
            end

            -- outter text
            nvgTextAlign(NVG_ALIGN_CENTER, NVG_ALIGN_BOTTOM)
            if Nice_DamageExchange.takenDamage > 201 then
                nvgFillColor(Color(0x00, 0x58, 0xc0, math.min(255, intensity)))
            elseif Nice_DamageExchange.takenDamage > 101 then
                nvgFillColor(Color(0x00, 0xa0, 0x00, math.min(255, intensity)))
            elseif Nice_DamageExchange.takenDamage > 51 then
                nvgFillColor(Color(0x00, 0x58, 0xc0, math.min(255, intensity)))
            elseif Nice_DamageExchange.takenDamage > 0 then
                nvgFillColor(Color(0, 0, 0, math.min(255, intensity)))
            end
            move = math.max(move - Nice_DamageExchange.time * 3, 0)
            nvgFontSize(math.min((((Nice_DamageExchange.takenDamage + 250)) * 0.22) * 1.1), 500)
            nvgText(2, move - 1, Nice_DamageExchange.takenDamage)
        
            -- damage you're taking
            -- color depending on amount of damage taken
            if Nice_DamageExchange.takenDamage > 201 then
                nvgFillColor(Color(0xb8, 0x00, 0x00, math.min(255, intensity)))
            elseif Nice_DamageExchange.takenDamage > 101 then
                nvgFillColor(Color(0xe0, 0xc0, 0x00, math.min(255, intensity)))
            elseif Nice_DamageExchange.takenDamage > 51 then
                nvgFillColor(Color(0x00, 0xa0, 0x00, math.min(255, intensity)))
            elseif Nice_DamageExchange.takenDamage > 0 then
                nvgFillColor(Color(255, 255, 255, math.min(255, intensity)))
            end
            nvgText(0, move, Nice_DamageExchange.takenDamage)
       else
           move = 75
       end
    elseif self.userData.display == 3 then
        -- figure out if you did damage and how much
        Nice_DamageExchange.ttlDmgDone = player.stats.totalDamageDone
        if Nice_DamageExchange.totalDamageDone == nil then
            Nice_DamageExchange.totalDamageDone = Nice_DamageExchange.ttlDmgDone
            Nice_DamageExchange.doneDamage = 0
            Nice_DamageExchange.doingDamage = false
            Nice_DamageExchange.display = false
            Nice_DamageExchange.displayLength = self.userData.length
            Nice_DamageExchange.armor = player.armor
            move = 75
        elseif Nice_DamageExchange.ttlDmgDone > Nice_DamageExchange.totalDamageDone then
            Nice_DamageExchange.doneDamage = Nice_DamageExchange.doneDamage + Nice_DamageExchange.ttlDmgDone - Nice_DamageExchange.totalDamageDone
            Nice_DamageExchange.doingDamage = true
            Nice_DamageExchange.display = true
            Nice_DamageExchange.displayLength = self.userData.length
            Nice_DamageExchange.totalDamageDone = Nice_DamageExchange.ttlDmgDone
        end

        -- tick down damage display
        if Nice_DamageExchange.doingDamage == true then
            Nice_DamageExchange.displayLength = Nice_DamageExchange.displayLength - deltaTime
            Nice_DamageExchange.time = Nice_DamageExchange.time + deltaTime
            if Nice_DamageExchange.displayLength <= -self.userData.delay  or player.health <= 0 then
                Nice_DamageExchange.display = false
                Nice_DamageExchange.displayLength = self.userData.length
                Nice_DamageExchange.totalDamageDone = Nice_DamageExchange.ttlDmgDone
                Nice_DamageExchange.doneDamage = 0
                Nice_DamageExchange.doingDamage = false
                Nice_DamageExchange.time = 0
                Nice_DamageExchange.armor = player.armor
                move = 75
            end
        end

        -- display damage doing stuff
        if Nice_DamageExchange.display == true and Nice_DamageExchange.displayLength < (self.userData.length - self.userData.delay) and Nice_DamageExchange.doingDamage == true then
            -- fade in, fade out animation
            if Nice_DamageExchange.time < 0.33 then
                intensity = -((Nice_DamageExchange.displayLength + self.userData.delay) - 3) * 255 * 2.6
            else
                intensity = 255 * math.min((Nice_DamageExchange.displayLength + self.userData.delay) * 2.6, 1)
            end

            -- outter text
            nvgFontSize(math.min((((Nice_DamageExchange.doneDamage + 250)) * 0.22) * 1.1), 500)
            nvgTextAlign(NVG_ALIGN_CENTER, NVG_ALIGN_BOTTOM)
            move = math.max(move - Nice_DamageExchange.time * 3, 0)
            if Nice_DamageExchange.doneDamage > 201 then
                nvgFillColor(Color(0x00, 0x58, 0xc0, math.min(255, intensity)))
            elseif Nice_DamageExchange.doneDamage > 101 then
                nvgFillColor(Color(0x00, 0xa0, 0x00, math.min(255, intensity)))
            elseif Nice_DamageExchange.doneDamage > 51 then
                nvgFillColor(Color(0x00, 0x58, 0xc0, math.min(255, intensity)))
            elseif Nice_DamageExchange.doneDamage > 0 then
                nvgFillColor(Color(0, 0, 0, math.min(255, intensity)))
            end
            nvgText(2, move - 1, Nice_DamageExchange.doneDamage)

            -- damage you're doing
            -- color depending on amount of damage done
            if Nice_DamageExchange.doneDamage > 201 then
                nvgFillColor(Color(0xb8, 0x00, 0x00, math.min(255, intensity)))
            elseif Nice_DamageExchange.doneDamage > 101 then
                nvgFillColor(Color(0xe0, 0xc0, 0x00, math.min(255, intensity)))
            elseif Nice_DamageExchange.doneDamage > 51 then
                nvgFillColor(Color(0x00, 0xa0, 0x00, math.min(255, intensity)))
            elseif Nice_DamageExchange.doneDamage > 0 then
                nvgFillColor(Color(255, 255, 255, math.min(255, intensity)))
            end
            nvgText(0, move, Nice_DamageExchange.doneDamage)
        else
            move = 75
        end
    end
end

---- figure out if you took damage and how much
--        Nice_DamageExchange.ttlDmgTaken = player.stats.totalDamageReceived
--        if Nice_DamageExchange.totalDamageTaken == nil then
--            Nice_DamageExchange.totalDamageTaken = Nice_DamageExchange.ttlDmgTaken
--            Nice_DamageExchange.takenDamage = 0
--            Nice_DamageExchange.takingDamage = false
--            Nice_DamageExchange.display = false
--            Nice_DamageExchange.displayLength = self.userData.length
--            move = 75
--        elseif Nice_DamageExchange.ttlDmgTaken > Nice_DamageExchange.totalDamageTaken then
--            Nice_DamageExchange.takenDamage = Nice_DamageExchange.takenDamage + Nice_DamageExchange.ttlDmgTaken - Nice_DamageExchange.totalDamageTaken
--            Nice_DamageExchange.takingDamage = true
--            Nice_DamageExchange.display = true
--            Nice_DamageExchange.displayLength = self.userData.length
--            Nice_DamageExchange.totalDamageTaken = Nice_DamageExchange.ttlDmgTaken
--        end

--        -- tick down damage display
--        if Nice_DamageExchange.display == true then
--            Nice_DamageExchange.displayLength = self.userData.length = Nice_DamageExchange.displayLength = self.userData.length - deltaTime
--            if Nice_DamageExchange.displayLength = self.userData.length <= 0 then
--                Nice_DamageExchange.actualDisplay = true
--                Nice_DamageExchange.displayLength = self.userData.length
--                Nice_DamageExchange.time = 0
--                Nice_DamageExchange.display = false
--                move = 75
--            end
--        end

--        -- display damage taking stuff
--        if Nice_DamageExchange.actualDisplay == true then
--            Nice_DamageExchange.time = Nice_DamageExchange.time + deltaTime
--            if Nice_DamageExchange.time >= 3 then
--                 Nice_DamageExchange.actualDisplay = false
--                 Nice_DamageExchange.totalDamageDone = Nice_DamageExchange.ttlDmgDone
--                 Nice_DamageExchange.doneDamage = 0
--                 Nice_DamageExchange.doingDamage = false
--                 Nice_DamageExchange.totalDamageTaken = Nice_DamageExchange.ttlDmgTaken
--                 Nice_DamageExchange.takenDamage = 0
--                 Nice_DamageExchange.takingDamage = false
--            end

--            -- fade in, fade out animation
--            if Nice_DamageExchange.time < 0.33 then
--                intensity = -(Nice_DamageExchange.displayLength = self.userData.length - 3) * 255 * 3
--            else
--                intensity = 255 * math.min(Nice_DamageExchange.displayLength = self.userData.length * 3.0, 1)
--            end

--            -- damage you've exchanged
--            if Nice_DamageExchange.takenDamage > Nice_DamageExchange.doneDamage then
--                nvgFontSize((((Nice_DamageExchange.takenDamage - Nice_DamageExchange.doneDamage + 250)) * 0.22) * 1.2)
--            else
--                nvgFontSize((((Nice_DamageExchange.doneDamage - Nice_DamageExchange.takenDamage + 250)) * 0.22) * 1.2)
--            end
--            nvgTextAlign(NVG_ALIGN_CENTER, NVG_ALIGN_BOTTOM)
--            move = math.max(move - Nice_DamageExchange.time * 3, 0)
--            if Nice_DamageExchange.doneDamage - Nice_DamageExchange.takenDamage ~= 0 then
--                nvgFillColor(Color(0x00, 0x58, 0xc0, math.min(255, intensity)))
--                nvgText(1, move - 1, Nice_DamageExchange.doneDamage - Nice_DamageExchange.takenDamage)
--                if Nice_DamageExchange.takenDamage > Nice_DamageExchange.doneDamage then
--                    nvgFillColor(Color(0xb8, 0x00, 0x00, math.min(255, intensity)))
--                else
--                    nvgFillColor(Color(0x00, 0xa0, 0x00, math.min(255, intensity)))
--                end
--                nvgText(0, move, Nice_DamageExchange.doneDamage - Nice_DamageExchange.takenDamage)
--            end        
--        else
--            move = 75
--        end