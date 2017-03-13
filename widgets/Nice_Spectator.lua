require "base/internal/ui/reflexcore"

Nice_Spectator = { index = 0 }
registerWidget("Nice_Spectator")

local function chooseFillColor(i, alpha)
    if i == 1 then
        nvgFillColor(Color(255, 63, 52, alpha))
    elseif i == 2 then
        nvgFillColor(Color(138, 43, 226, alpha))
    elseif i == 3 then
        nvgFillColor(Color(199, 21, 133, alpha))
    elseif i == 4 then
        nvgFillColor(Color(154, 205, 50, alpha))
    elseif i == 5 then
        nvgFillColor(Color(0, 128, 0, alpha))
    elseif i == 6 then
        nvgFillColor(Color(255, 69, 0, alpha))
    elseif i == 7 then
        nvgFillColor(Color(253, 1, 252, alpha))
    elseif i == 8 then
        nvgFillColor(Color(0, 128, 0, alpha))
    end
end

local function chooseStrokeColor(i)
    if i == 1 then
        nvgStrokeColor(Color(255, 63, 52))
    elseif i == 2 then
        nvgStrokeColor(Color(138, 43, 226))
    elseif i == 3 then
        nvgStrokeColor(Color(199, 21, 133))
    elseif i == 4 then
        nvgStrokeColor(Color(154, 205, 50))
    elseif i == 5 then
        nvgStrokeColor(Color(0, 128, 0))
    elseif i == 6 then
        nvgStrokeColor(Color(255, 69, 0))
    elseif i == 7 then
        nvgStrokeColor(Color(238, 130, 238))
    elseif i == 8 then
        nvgStrokeColor(Color(0, 128, 0))
    end
end

function Nice_Spectator:initialize()
    self.userData = loadUserData()
    CheckSetDefaultValue(self, "userData", "table", {})
end

function Nice_Spectator:draw()
    local spacing = 33
    local verSpacing = 30
    if isInMenu() then
        Nice_Spectator.index = 0
        return
    end
    
    -- get player, reset if not the same
    local me = getLocalPlayer()
    if me == nil or me.state == 1 then return end
    local localPlayer = getPlayer()
    if localPlayer == nil then return
    elseif localPlayer.index ~= Nice_Spectator.index then
        Nice_Spectator.index = localPlayer.index
        return
    end

    for p, player in ipairs(players) do
        if (world.gameModeIndex == 2 and player.connected and player.state == PLAYER_STATE_INGAME and player ~= localPlayer) or (world.gameModeIndex == 7 and player.connected and player.state == PLAYER_STATE_INGAME and player.team == localPlayer.team) then
            weaponsHeld = { }
            local weaponsPickedUp = 0
            for i = 1, #weaponDefinitions, 1 do
                weaponsHeld[i - 1] = player.weapons[i]
                -- count weapons picked up
                if weaponsHeld[i - 1].pickedup then
                    weaponsPickedUp = weaponsPickedUp + 1
                end
            end
            local cnt = 2
            for i = 2, #weaponsHeld, 1 do
                -- weapons you have
                if weaponsHeld[i].pickedup and weaponsHeld[i].ammo > 0 and player.weapons[i + 1].isAllowed then
                    -- icon background
                    chooseFillColor(i, 255)
                    nvgSvg("internal/ui/icons/weapon" .. i + 1, cnt * spacing - (4 * spacing - 1), -198 + verSpacing, 13)
                    -- icon
                    nvgFillColor(Color(weaponDefinitions[i + 1].color.r, weaponDefinitions[i + 1].color.g, weaponDefinitions[i + 1].color.b))
                    nvgSvg("internal/ui/icons/weapon" .. i + 1, cnt * spacing - 4 * spacing, -199 + verSpacing, 13)
                    cnt = cnt + 1
                elseif weaponsHeld[i].ammo == 0 and weaponsHeld[i].pickedup and player.weapons[i + 1].isAllowed then
                    -- icon background
                    nvgFillColor(Color(150, 150, 150))
                    nvgSvg("internal/ui/icons/weapon" .. i + 1, cnt * spacing - (4 * spacing - 1), -198 + verSpacing, 13)
                    -- icon
                    nvgFillColor(Color(weaponDefinitions[i + 1].color.r, weaponDefinitions[i + 1].color.g, weaponDefinitions[i + 1].color.b, 80))
                    nvgSvg("internal/ui/icons/weapon" .. i + 1, cnt * spacing - 4 * spacing, -199 + verSpacing, 13)
                    cnt = cnt + 1
                end
            end
            -- name background
            nvgFillColor(Color(0, 0, 0))
            nvgFontSize(40)
            nvgTextAlign(NVG_ALIGN_RIGHT, NVG_ALIGN_MIDDLE)
            nvgFontBlur(1)
            nvgText(-87,  -201 + verSpacing, player.name)
            -- name
            nvgFontBlur(0)
            nvgFillColor(Color(255, 255, 255))
            nvgText(-88,  -202 + verSpacing, player.name)
            -- health bar and number
            if player.health > 0 then
                -- health background
                nvgBeginPath()
                nvgFillColor(Color(0, 0, 0, 150))
                nvgRect(-45, -151, -(100 * 1.5 + 1), 27)
                nvgFill()
                if player.health <= 100 and player.health > 0 then
                    nvgBeginPath()
                    nvgRect(-45, -150, -(player.health * 1.5), 25)
                    if player.health > 80 then
                        nvgFillColor(Color(0x00, 0xa0, 0x00, 180))
                    elseif player.health > 30 then
                        nvgFillColor(Color(0xe0, 0xc0, 0x00, 180))
                    elseif player.health > 0 then
                        nvgFillColor(Color(0xb8, 0x00, 0x00, 180))
                    end
                    nvgFill()
                elseif player.health > 100 then
                    nvgBeginPath()
                    nvgRect(-45, -150, -(100 * 1.5), 25)
                    nvgFillColor(Color(0x00, 0xa0, 0x00, 180))
                    nvgFill()
                    nvgBeginPath()
                    nvgRect(-45, -150, -((player.health - 100) * 1.5), 25)
                    nvgFillColor(Color(0x00, 0x58, 0xc0))
                    nvgFill()
                end
                local ayy = 0
                for i = 25, math.min(100, player.health), 25 do
                    ayy = ayy + 1
                    if ayy > 4 then ayy = 1 end
                    if ayy == 1 or ayy == 3 then
                        nvgBeginPath()
                        nvgRect(-40 -(math.floor(i / 25) * 25) * 1.5, -147, 1, 20)
                        nvgFillColor(Color(0, 0, 0, 150))
                        nvgFill()
                    elseif ayy == 2 then
                        nvgBeginPath()
                        nvgRect(-40 -(math.floor(i / 50) * 50) * 1.5, -150, 1, 25)
                        nvgFillColor(Color(0, 0, 0, 150))
                        nvgFill()
                    end
                end
            end
            -- armor bar
            if player.armor > 0 then
                nvgBeginPath()
                nvgFillColor(Color(0, 0, 0))
                nvgRect(-45, -151, 3, 27)
                nvgFill()
                -- armor background
                nvgBeginPath()
                nvgFillColor(Color(0, 0, 0, 150))
                nvgRect(-42, -151, 200 * 0.75 + 1, 27)
                nvgFill()
                -- true armor
                nvgBeginPath()
                nvgRect(-42, -150, player.armor * 0.75, 25)
                if player.armorProtection == 0 then
                nvgFillColor(Color(0x00, 0xa0, 0x00, 150))
                elseif player.armorProtection == 1 then
                    nvgFillColor(Color(0xe0, 0xc0, 0x00, 150))
                elseif player.armorProtection == 2 then
                    nvgFillColor(Color(0xb8, 0x00, 0x00, 150))
                end
                nvgFill()
                -- 25, 50 and 100 marks
                for i = 50, player.armor, 50 do
                    nvgBeginPath()
                    nvgRect(-42 + math.floor(i / 50) * 50 * 0.75, -150, 1, 25)
                    nvgFillColor(Color(0, 0, 0, 100))
                    nvgFill()
                end
            end
        end
    end
end