require "base/internal/ui/reflexcore"

Nice_TrueHealthBoltable = { index = 0 }
registerWidget("Nice_TrueHealthBoltable")

function Nice_TrueHealthBoltable:initialize()
    self.userData = loadUserData()
    CheckSetDefaultValue(self, "userData", "table", {})
    CheckSetDefaultValue(self.userData, "invert", "boolean", false)
    CheckSetDefaultValue(self.userData, "boltable", "number", 1)
end

function Nice_TrueHealthBoltable:drawOptions(x, y)
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

    user.invert = ui2RowCheckbox(x, y, 80, "Invert", user.invert, optargs);
    nvgFillColor(Color(142,142,142,255))
    if user.invert == true then
        nvgText(x + 124, y + 30, "Stacks from right to left")
    else
        nvgText(x + 124, y + 30, "Stacks from left to right")
    end

    y = y + 55
    user.boltable = ui2RowSliderEditBox0Decimals(x, y, 90, 200, 35, "Boltable", user.boltable, 0, 2, optargs)
    if user.boltable == 0 then
        nvgText(x + 210, y + 30, "Never show Bolt icon")
    elseif user.boltable == 1 then
        nvgText(x + 210, y + 30, "Only show Bolt icon if true health is 0")
    else
        nvgText(x + 210, y + 30, "Always show Bolt icons")
    end

    saveUserData(user)
end

local function trueHealth(player, damage)
    local trueA = math.min(math.min(player.health * (player.armorProtection + 1), player.armor), 200)
    local trueH = math.floor((player.health - 1 + trueA) / damage)
    return trueH
end

function Nice_TrueHealthBoltable:draw()
    if not shouldShowHUD() then
        Nice_TrueHealthBoltable.index = 0
        return
    end
        
    -- get player, reset if not the same
    local player = getPlayer()
    if player == nil or player.index ~= Nice_TrueHealthBoltable.index then
        Nice_TrueHealthBoltable.index = player.index
        return
    end

    local th = trueHealth(player, 100)
    local bt = trueHealth(player, 80)
    if self.userData.invert == false then
        for i = 1, th, 1 do
            nvgFillColor(Color(0, 0, 0))
            nvgSvg("internal/ui/icons/weapon6", i * 25 - 24, 2, 16)
            nvgFillColor(Color(player.weapons[6].color.r, player.weapons[6].color.g, player.weapons[6].color.b))
            nvgSvg("internal/ui/icons/weapon6", i * 25 - 25, 0, 16)
            count = i
        end
        if self.userData.boltable == 1 then
            if th == 0 and bt > 0 then
                nvgFillColor(Color(0, 0, 0))
                nvgSvg("internal/ui/icons/weapon8", 0, 2, 15)
                nvgFillColor(Color(player.weapons[8].color.r, player.weapons[8].color.g, player.weapons[8].color.b))
                nvgSvg("internal/ui/icons/weapon8", 0, 0, 15)
            end
        elseif self.userData.boltable == 2 then
            for i = 1, bt, 1 do
                nvgFillColor(Color(0, 0, 0))
                nvgSvg("internal/ui/icons/weapon8", (count + i) * 25 - 24, 2, 15)
                nvgFillColor(Color(255, 215, 0))
                nvgSvg("internal/ui/icons/weapon8", (count + i) * 25 - 25, 0, 15)
            end
        end
    else
        for i = 1, th, 1 do
            nvgFillColor(Color(0, 0, 0))
            nvgSvg("internal/ui/icons/weapon6", -(i * 25 - 24), 2, 16)
            nvgFillColor(Color(player.weapons[6].color.r, player.weapons[6].color.g, player.weapons[6].color.b))
            nvgSvg("internal/ui/icons/weapon6", -(i * 25 - 25), 0, 16)
            count = i
        end
        if self.userData.boltable == 1 then
            if th == 0 and bt > 0 then
                nvgFillColor(Color(0, 0, 0))
                nvgSvg("internal/ui/icons/weapon8", 0, 2, 15)
                nvgFillColor(Color(player.weapons[8].color.r, player.weapons[8].color.g, player.weapons[8].color.b))
                nvgSvg("internal/ui/icons/weapon8", 0, 0, 15)
            end
        elseif self.userData.boltable == 2 then
            for i = 1, bt, 1 do
                nvgFillColor(Color(0, 0, 0))
                nvgSvg("internal/ui/icons/weapon8", -((count + i) * 25 - 24), 2, 15)
                nvgFillColor(Color(255, 215, 0))
                nvgSvg("internal/ui/icons/weapon8", -((count + i) * 25 - 25), 0, 15)
            end
        end
    end
end