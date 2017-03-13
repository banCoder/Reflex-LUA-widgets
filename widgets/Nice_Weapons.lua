require "base/internal/ui/reflexcore"

Nice_Weapons = { index = 0 }
registerWidget("Nice_Weapons")

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

function Nice_Weapons:initialize()
    self.userData = loadUserData()
    CheckSetDefaultValue(self, "userData", "table", {})
    CheckSetDefaultValue(self.userData, "invert", "boolean", false)
    CheckSetDefaultValue(self.userData, "spacing", "number", 14)
    CheckSetDefaultValue(self.userData, "verSpacing", "number", 10)
    CheckSetDefaultValue(self.userData, "iconSize", "number", 15)
end

function Nice_Weapons:drawOptions(x, y)
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
    user.invert = ui2RowCheckbox(x, y, 90, "Invert", user.invert, optargs);
    nvgFillColor(Color(142,142,142,255))
    if user.invert == true then
        nvgText(x + 134, y + 30, "Inverted, rack below current weapon ammo count")
    else
        nvgText(x + 134, y + 30, "Normal, current weapon ammo count below rack")
    end
    
    y = y + 55
    user.spacing = ui2RowSliderEditBox0Decimals(x, y, 170, 400, 60, "Horizontal spacing", user.spacing, 0, 200, optargs)
    nvgText(x + 410, y + 30, "Horizontal spacing between weapons in the rack")

    y = y + 55
    user.verSpacing = ui2RowSliderEditBox0Decimals(x, y, 170, 400, 60, "Vertical spacing", user.verSpacing, 0, 200, optargs)
    nvgText(x + 410, y + 30, "Vertical spacing between weapons in the rack and big ammo number")

    y = y + 55
    user.iconSize = ui2RowSliderEditBox0Decimals(x, y, 170, 400, 60, "Icon size", user.iconSize, 0, 50, optargs)
    saveUserData(user)
end

local verticalSpacing = 35

function Nice_Weapons:draw()
    local spacing = 56 + self.userData.spacing
    if not shouldShowHUD() then
        Nice_Weapons.index = 0
        return
    end
    
    -- get player, reset if not the same
    local player = getPlayer()
    local localPlayer = getLocalPlayer()
    if player == nil or player.index ~= Nice_Weapons.index then
        Nice_Weapons.index = player.index
        return
    end

    weaponsHeld = { }
    local weaponsPickedUp = 0

    for i = 2, #weaponDefinitions, 1 do
        weaponsHeld[i - 1] = player.weapons[i]
        -- count weapons picked up
        if weaponsHeld[i - 1].pickedup then
            weaponsPickedUp = weaponsPickedUp + 1
        end
    end
    for i = 1, #weaponsHeld, 1 do
        -- weapons you have
        if player.weaponIndexSelected == 1 then
            nvgFillColor(Color(0, 0, 0))
            local svgName = "internal/ui/icons/weapon1"
		    if player.inventoryMelee ~= nil then
			    local def = inventoryDefinitions[player.inventoryMelee]
			    if def ~= nil then
				    svgName = def.asset
			    end
		    end
            nvgSvg(svgName, 3, -82, 45)
            nvgFillColor(Color(weaponDefinitions[1].color.r, weaponDefinitions[1].color.g, weaponDefinitions[1].color.b))
            nvgSvg(svgName, 0, -85, 45)
        end
        if self.userData.invert then
            if weaponsHeld[i].pickedup and player.weapons[i + 1].isAllowed then
                -- rectangle and ammo around the selected weapon
                if player.weaponIndexSelected == i + 1 then
                    -- ammo status
                    if weaponsHeld[i].ammo / weaponsHeld[i].maxAmmo > 0.8 then
                        nvgFillColor(Color(0x00, 0x58, 0xc0, 100))
                    elseif weaponsHeld[i].ammo / weaponsHeld[i].maxAmmo > 0.4 then
                        nvgFillColor(Color(0x00, 0xa0, 0x00, 100))
                    elseif weaponsHeld[i].ammo / weaponsHeld[i].maxAmmo > 0.1 then
                        nvgFillColor(Color(255, 255, 0, 100))   
                    else
                        nvgFillColor(Color(0xb8, 0x00, 0x00, 150))
                    end
                    nvgBeginPath()
                    nvgRect(i * spacing - 4 * spacing - 28, 53, 58, -74 * (weaponsHeld[i].ammo / weaponsHeld[i].maxAmmo))
                    nvgFill()
                    -- rectangle background
                    nvgBeginPath()
                    nvgMoveTo(i * spacing - 4 * spacing - 26, -18)
                    nvgLineTo(i * spacing - 4 * spacing + 32, -18)
                    nvgLineTo(i * spacing - 4 * spacing + 32, 56)
                    nvgLineTo(i * spacing - 4 * spacing - 26, 56)
                    nvgLineTo(i * spacing - 4 * spacing - 26, -18)
                    -- line background
                    nvgLineTo(i * spacing - 4 * spacing, -18)
                    nvgLineTo(i * spacing - 4 * spacing, -28)
                    nvgLineTo(10, -30)
                    nvgLineTo(10, -50 - self.userData.verSpacing)
                    nvgStrokeWidth(3)
                    chooseStrokeColor(i)
                    nvgStroke()
                    -- recatngle
                    nvgBeginPath()
                    nvgMoveTo(i * spacing - 4 * spacing - 28, -20)
                    nvgLineTo(i * spacing - 4 * spacing + 30, -20)
                    nvgLineTo(i * spacing - 4 * spacing + 30, 54)
                    nvgLineTo(i * spacing - 4 * spacing - 28, 54)
                    nvgLineTo(i * spacing - 4 * spacing - 28, -20)
                    -- line
                    nvgLineTo(i * spacing - 4 * spacing, -20)
                    nvgLineTo(i * spacing - 4 * spacing, -30)
                    nvgLineTo(8, -32)
                    nvgLineTo(8, -52 - self.userData.verSpacing)
                    nvgStrokeWidth(3)
                    nvgStrokeColor(Color(weaponDefinitions[i + 1].color.r, weaponDefinitions[i + 1].color.g, weaponDefinitions[i + 1].color.b))
                    nvgStroke()
                    -- ammo
                    nvgFontSize(117)
                    nvgTextAlign(NVG_ALIGN_CENTER, NVG_ALIGN_MIDDLE)
                    chooseFillColor(i, 1000)
                    nvgFontBlur(1)
                    nvgText(0, -75 - self.userData.verSpacing, weaponsHeld[i].ammo)
                    nvgFontBlur(0)
                    nvgFillColor(Color(0,0,0))
                    nvgText(0, -75 - self.userData.verSpacing, weaponsHeld[i].ammo)
                end
                -- icon background
                chooseFillColor(i, 2000)
                nvgSvg("internal/ui/icons/weapon" .. i + 1, i * spacing - (4 * spacing - 1), 1, self.userData.iconSize)
                -- icon
                nvgFillColor(Color(weaponDefinitions[i + 1].color.r, weaponDefinitions[i + 1].color.g, weaponDefinitions[i + 1].color.b))
                nvgSvg("internal/ui/icons/weapon" .. i + 1, i * spacing - 4 * spacing, 0, self.userData.iconSize)
                -- ammo background
                chooseFillColor(i, 2000)
                nvgFontSize(40)
                nvgTextAlign(NVG_ALIGN_CENTER, NVG_ALIGN_MIDDLE)
                --nvgText(i * spacing - (4 * spacing - 1), verticalSpacing - 1, weaponsHeld[i].ammo)
                nvgFontBlur(1)
                nvgText(i * spacing - (4 * spacing), verticalSpacing, weaponsHeld[i].ammo)
                -- ammo
                nvgFontBlur(0)
                nvgFillColor(Color(weaponDefinitions[i + 1].color.r, weaponDefinitions[i + 1].color.g, weaponDefinitions[i + 1].color.b))
                nvgText(i * spacing - 4 * spacing, verticalSpacing, weaponsHeld[i].ammo)
            -- weapons you don't have, but do have ammo for them
            elseif weaponsHeld[i].ammo > 0 and player.weapons[i + 1].isAllowed then
                -- ammo background
                chooseFillColor(i, 2000)
                nvgFontSize(40)
                nvgTextAlign(NVG_ALIGN_CENTER, NVG_ALIGN_MIDDLE)
                nvgFontBlur(1)
                nvgText(i * spacing - (4 * spacing), verticalSpacing, weaponsHeld[i].ammo)
                -- ammo
                nvgFontBlur(0)
                nvgFillColor(Color(weaponDefinitions[i + 1].color.r, weaponDefinitions[i + 1].color.g, weaponDefinitions[i + 1].color.b))
                nvgText(i * spacing - 4 * spacing, verticalSpacing, weaponsHeld[i].ammo)
            end
        else
            if weaponsHeld[i].pickedup and player.weapons[i + 1].isAllowed then
                -- rectangle and ammo around the selected weapon
                if player.weaponIndexSelected == i + 1 then
                    -- ammo status
                    if weaponsHeld[i].ammo / weaponsHeld[i].maxAmmo > 0.8 then
                        nvgFillColor(Color(0x00, 0x58, 0xc0, 100))
                    elseif weaponsHeld[i].ammo / weaponsHeld[i].maxAmmo > 0.4 then
                        nvgFillColor(Color(0x00, 0xa0, 0x00, 100))
                    elseif weaponsHeld[i].ammo / weaponsHeld[i].maxAmmo > 0.1 then
                        nvgFillColor(Color(255, 255, 0, 100))   
                    else
                        nvgFillColor(Color(0xb8, 0x00, 0x00, 150))
                    end
                    nvgBeginPath()
                    nvgRect(i * spacing - 4 * spacing - 28, -148, 58, -74 * (weaponsHeld[i].ammo / weaponsHeld[i].maxAmmo))
                    nvgFill()
                    -- rectangle background
                    nvgBeginPath()
                    nvgMoveTo(i * spacing - 4 * spacing + 32, -144)
                    nvgLineTo(i * spacing - 4 * spacing - 26, -144)
                    nvgLineTo(i * spacing - 4 * spacing - 26, -218)
                    nvgLineTo(i * spacing - 4 * spacing + 32, -218)
                    nvgLineTo(i * spacing - 4 * spacing + 32, -144)
                    -- line background
                    nvgLineTo(i * spacing - 4 * spacing, -144)
                    nvgLineTo(i * spacing - 4 * spacing, -134)
                    nvgLineTo(10, -132)
                    nvgLineTo(10, -112 + self.userData.verSpacing)
                    nvgStrokeWidth(3)
                    chooseStrokeColor(i)
                    nvgStroke()
                    -- recatngle
                    nvgBeginPath()
                    nvgMoveTo(i * spacing - 4 * spacing + 30, -146)
                    nvgLineTo(i * spacing - 4 * spacing - 28, -146)
                    nvgLineTo(i * spacing - 4 * spacing - 28, -220)
                    nvgLineTo(i * spacing - 4 * spacing + 30, -220)
                    nvgLineTo(i * spacing - 4 * spacing + 30, -146)
                    -- line
                    nvgLineTo(i * spacing - 4 * spacing, -146)
                    nvgLineTo(i * spacing - 4 * spacing, -136)
                    nvgLineTo(8, -134)
                    nvgLineTo(8, -114 + self.userData.verSpacing)
                    nvgStrokeWidth(3)
                    nvgStrokeColor(Color(weaponDefinitions[i + 1].color.r, weaponDefinitions[i + 1].color.g, weaponDefinitions[i + 1].color.b))
                    nvgStroke()
                    -- ammo
                    nvgFontSize(117)
                    nvgTextAlign(NVG_ALIGN_CENTER, NVG_ALIGN_MIDDLE)
                    chooseFillColor(i, 2000)
                    --nvgText(3, -90 + self.userData.verSpacing, weaponsHeld[i].ammo)
                    nvgFontBlur(1)
                    nvgText(0, -93 + self.userData.verSpacing, weaponsHeld[i].ammo)
                    nvgFillColor(Color(weaponDefinitions[i + 1].color.r, weaponDefinitions[i + 1].color.g, weaponDefinitions[i + 1].color.b))
                    nvgFontBlur(0)
                    nvgText(0, -93 + self.userData.verSpacing, weaponsHeld[i].ammo)
                end
                -- icon background
                chooseFillColor(i, 255)
                nvgSvg("internal/ui/icons/weapon" .. i + 1, i * spacing - (4 * spacing - 1), -198, self.userData.iconSize)
                -- icon
                nvgFillColor(Color(weaponDefinitions[i + 1].color.r, weaponDefinitions[i + 1].color.g, weaponDefinitions[i + 1].color.b))
                nvgSvg("internal/ui/icons/weapon" .. i + 1, i * spacing - 4 * spacing, -199, self.userData.iconSize)
                -- ammo background
                chooseFillColor(i, 1500)
                nvgFontSize(40)
                nvgTextAlign(NVG_ALIGN_CENTER, NVG_ALIGN_MIDDLE)
                --nvgFontBlur(1)
                nvgText(i * spacing - (4 * spacing - 1), verticalSpacing - 198, weaponsHeld[i].ammo)
                -- ammo
                nvgFontBlur(0)
                nvgFillColor(Color(weaponDefinitions[i + 1].color.r, weaponDefinitions[i + 1].color.g, weaponDefinitions[i + 1].color.b))
                nvgText(i * spacing - 4 * spacing, verticalSpacing - 199, weaponsHeld[i].ammo)
            -- weapons you don't have, but do have ammo for them
            elseif weaponsHeld[i].ammo > 0 and player.weapons[i + 1].isAllowed then
                chooseFillColor(i, 2000)
                nvgFontSize(40)
                nvgTextAlign(NVG_ALIGN_CENTER, NVG_ALIGN_MIDDLE)
                nvgFontBlur(1)
                nvgText(i * spacing - (4 * spacing - 1), verticalSpacing - 198, weaponsHeld[i].ammo)
                -- ammo
                nvgFillColor(Color(weaponDefinitions[i + 1].color.r, weaponDefinitions[i + 1].color.g, weaponDefinitions[i + 1].color.b))
                nvgFontBlur(0)
                nvgText(i * spacing - 4 * spacing, verticalSpacing - 199, weaponsHeld[i].ammo)
            end
        end
    end
end