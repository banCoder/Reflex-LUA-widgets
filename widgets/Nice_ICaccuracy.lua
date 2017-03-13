require "base/internal/ui/reflexcore"

Nice_ICaccuracy = { index = nil, ttlShotsFired = 0, shotsFired = nil, firedShots = 0, shotsHit = nil, hitShots = 0, doingDamage = false, actualDisplay = false, displayLength = 3, display = false, time = 0 }
registerWidget("Nice_ICaccuracy")

function Nice_ICaccuracy:initialize()
    self.userData = loadUserData()
    CheckSetDefaultValue(self, "userData", "table", {})
    CheckSetDefaultValue(self.userData, "length", "number", 2)
    CheckSetDefaultValue(self.userData, "delay", "number", 2)
end

function Nice_ICaccuracy:drawOptions(x, y)
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

    y = y + 55
    user.length = ui2RowSliderEditBox2Decimals(x, y, 90, 350, 60, "Length", user.length, 0, 10, optargs)
    nvgText(x + 380, y + 30, "How long do the damage numbers stay up for")

    y = y + 55
    user.delay = ui2RowSliderEditBox2Decimals(x, y, 90, 350, 60, "Delay", user.delay, 0, 10, optargs)
    if user.delay == 0 then
        nvgText(x + 380, y + 30, "Damage numbers show instantly")
    else
        nvgText(x + 380, y + 30, "Damage numbers are delayed by " .. tostring(user.delay) .. "s")
    end
    saveUserData(user)
end

function Nice_ICaccuracy:draw()
    if isInMenu() then return end
    -- get player, reset if not the same
    local player = getPlayer()
    if player == nil then
        Nice_ICaccuracy.display = false
        Nice_ICaccuracy.displayLength = self.userData.length
        Nice_ICaccuracy.firedShots = 0
        Nice_ICaccuracy.hitShots = 0;
        Nice_ICaccuracy.time = 0
        Nice_ICaccuracy.shotsFired = nil
        Nice_ICaccuracy.shotsHit = nil
        Nice_ICaccuracy.ttlShotsFired = nil
        Nice_ICaccuracy.ttlShotsHit = nil
        return
    elseif player.index ~= Nice_ICaccuracy.index then
        Nice_ICaccuracy.display = false
        Nice_ICaccuracy.displayLength = self.userData.length
        Nice_ICaccuracy.firedShots = 0
        Nice_ICaccuracy.hitShots = 0;
        Nice_ICaccuracy.time = 0
        Nice_ICaccuracy.shotsFired = nil
        Nice_ICaccuracy.shotsHit = nil
        Nice_ICaccuracy.index = player.index
        Nice_ICaccuracy.ttlShotsFired = nil
        Nice_ICaccuracy.ttlShotsHit = nil
    end
    

    -- figure out if you did damage and how much
    Nice_ICaccuracy.ttlShotsFired = player.weaponStats[7].shotsFired
    Nice_ICaccuracy.ttlShotsHit = player.weaponStats[7].shotsHit
    if Nice_ICaccuracy.shotsFired == nil then
        Nice_ICaccuracy.shotsFired = Nice_ICaccuracy.ttlShotsFired
        Nice_ICaccuracy.firedShots = 0
        Nice_ICaccuracy.shotsHit = Nice_ICaccuracy.ttlShotsHit
        Nice_ICaccuracy.hitShots = 0
        Nice_ICaccuracy.doingDamage = false
        Nice_ICaccuracy.display = false
        Nice_ICaccuracy.displayLength = self.userData.length
    elseif Nice_ICaccuracy.ttlShotsFired > Nice_ICaccuracy.shotsFired then
        Nice_ICaccuracy.firedShots = Nice_ICaccuracy.firedShots + Nice_ICaccuracy.ttlShotsFired - Nice_ICaccuracy.shotsFired
        Nice_ICaccuracy.hitShots = Nice_ICaccuracy.hitShots + Nice_ICaccuracy.ttlShotsHit - Nice_ICaccuracy.shotsHit
        Nice_ICaccuracy.doingDamage = true
        Nice_ICaccuracy.display = true
        Nice_ICaccuracy.displayLength = self.userData.length
        Nice_ICaccuracy.shotsFired = Nice_ICaccuracy.ttlShotsFired
        Nice_ICaccuracy.shotsHit = Nice_ICaccuracy.ttlShotsHit
    end

    -- tick down damage display
    if Nice_ICaccuracy.doingDamage == true then
        Nice_ICaccuracy.displayLength = Nice_ICaccuracy.displayLength - deltaTime
        Nice_ICaccuracy.time = Nice_ICaccuracy.time + deltaTime
        if Nice_ICaccuracy.displayLength <= -self.userData.delay then
            Nice_ICaccuracy.display = false
            Nice_ICaccuracy.displayLength = self.userData.length
            Nice_ICaccuracy.shotsFired = Nice_ICaccuracy.ttlShotsFired
            Nice_ICaccuracy.firedShots = 0
            Nice_ICaccuracy.shotsHit = Nice_ICaccuracy.ttlShotsHit
            Nice_ICaccuracy.hitShots = 0
            Nice_ICaccuracy.doingDamage = false
            Nice_ICaccuracy.time = 0
        end
    end

    -- display damage doing stuff
    if Nice_ICaccuracy.display == true and Nice_ICaccuracy.displayLength < (self.userData.length - self.userData.delay) and Nice_ICaccuracy.doingDamage == true and Nice_ICaccuracy.hitShots > 0 then
        -- fade in, fade out animation
        if Nice_ICaccuracy.time < 0.33 then
            intensity = -((Nice_ICaccuracy.displayLength + self.userData.delay) - 3) * 255 * 2.6
        else
            intensity = 255 * math.min((Nice_ICaccuracy.displayLength + self.userData.delay) * 2.6, 1)
        end

        nvgFontSize(60)
        nvgTextAlign(NVG_ALIGN_RIGHT, NVG_ALIGN_BOTTOM)
        if Nice_ICaccuracy.hitShots / Nice_ICaccuracy.firedShots > 0.5 then
            nvgFillColor(Color(184, 0, 0, math.min(255, intensity)))
        elseif Nice_ICaccuracy.hitShots / Nice_ICaccuracy.firedShots > 0.4 then
            nvgFillColor(Color(0, 88, 192, math.min(255, intensity)))
        elseif Nice_ICaccuracy.hitShots / Nice_ICaccuracy.firedShots > 0.3 then
            nvgFillColor(Color(0, 0, 0, math.min(255, intensity)))
        elseif Nice_ICaccuracy.hitShots / Nice_ICaccuracy.firedShots > 0.2 then
            nvgFillColor(Color(0, 88, 192, math.min(255, intensity)))
        elseif Nice_ICaccuracy.hitShots / Nice_ICaccuracy.firedShots >= 0 then
            nvgFillColor(Color(0, 0, 0, math.min(255, intensity)))
        end
        nvgText(-1, 1, math.floor((Nice_ICaccuracy.hitShots / Nice_ICaccuracy.firedShots) * 100))
        nvgFontSize(50)
        nvgTextAlign(NVG_ALIGN_LEFT, NVG_ALIGN_BOTTOM)
        nvgText(-1, -3, "%")

        nvgFontSize(60)
        nvgTextAlign(NVG_ALIGN_RIGHT, NVG_ALIGN_BOTTOM)
        if Nice_ICaccuracy.hitShots / Nice_ICaccuracy.firedShots > 0.5 then
            nvgFillColor(Color(0, 88, 192, math.min(255, intensity)))
        elseif Nice_ICaccuracy.hitShots / Nice_ICaccuracy.firedShots > 0.4 then
            nvgFillColor(Color(0, 160, 0, math.min(255, intensity)))
        elseif Nice_ICaccuracy.hitShots / Nice_ICaccuracy.firedShots > 0.3 then
            nvgFillColor(Color(224, 192, 0, math.min(255, intensity)))
        elseif Nice_ICaccuracy.hitShots / Nice_ICaccuracy.firedShots > 0.2 then
            nvgFillColor(Color(184, 0, 0, math.min(255, intensity)))
        elseif Nice_ICaccuracy.hitShots / Nice_ICaccuracy.firedShots >= 0 then
            nvgFillColor(Color(255, 255, 255, math.min(255, intensity)))
        end
        nvgText(0, 0, math.floor((Nice_ICaccuracy.hitShots / Nice_ICaccuracy.firedShots) * 100))
        nvgFontSize(50)
        nvgTextAlign(NVG_ALIGN_LEFT, NVG_ALIGN_BOTTOM)
        nvgText(0, -4, "%")
    end
end