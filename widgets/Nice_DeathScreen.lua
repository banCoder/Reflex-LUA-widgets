require "base/internal/ui/reflexcore"

Nice_DeathScreen = { index = 0, ttlShotsFired = 0, shotsFired = nil, firedShots = 0, shotsHit = nil, hitShots = 0, doingDamage = false, actualDisplay = false, displayLength = 3, display = false, time = 0 }
registerWidget("Nice_DeathScreen")

function Nice_DeathScreen:initialize()
    self.userData = loadUserData()
    CheckSetDefaultValue(self, "userData", "table", {})
    CheckSetDefaultValue(self.userData, "length", "number", 3)
    CheckSetDefaultValue(self.userData, "delay", "number", 0)
end

function Nice_DeathScreen:drawOptions(x, y)
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

function Nice_DeathScreen:draw()
    
    -- get player, reset if not the same
    local player = getPlayer()
    if player == nil or player.index ~= Nice_DeathScreen.index then
        Nice_DeathScreen.display = false
        Nice_DeathScreen.displayLength = self.userData.length
        Nice_DeathScreen.firedShots = 0
        Nice_DeathScreen.hitShots = 0;
        Nice_DeathScreen.time = 0
        Nice_DeathScreen.shotsFired = nil
        Nice_DeathScreen.shotsHit = nil
        Nice_DeathScreen.index = player.index
        return
    end
    
    if player.isDead then
        nvgText(0, 0, "I AM DEAD")
    end

    -- figure out if you did damage and how much
    Nice_DeathScreen.ttlShotsFired = player.weaponStats[7].shotsFired
    Nice_DeathScreen.ttlShotsHit = player.weaponStats[7].shotsHit
    if Nice_DeathScreen.shotsFired == nil then
        Nice_DeathScreen.shotsFired = Nice_DeathScreen.ttlShotsFired
        Nice_DeathScreen.firedShots = 0
        Nice_DeathScreen.shotsHit = Nice_DeathScreen.ttlShotsHit
        Nice_DeathScreen.hitShots = 0
        Nice_DeathScreen.doingDamage = false
        Nice_DeathScreen.display = false
        Nice_DeathScreen.displayLength = self.userData.length
    elseif Nice_DeathScreen.ttlShotsFired > Nice_DeathScreen.shotsFired then
        Nice_DeathScreen.firedShots = Nice_DeathScreen.firedShots + Nice_DeathScreen.ttlShotsFired - Nice_DeathScreen.shotsFired
        Nice_DeathScreen.hitShots = Nice_DeathScreen.hitShots + Nice_DeathScreen.ttlShotsHit - Nice_DeathScreen.shotsHit
        Nice_DeathScreen.doingDamage = true
        Nice_DeathScreen.display = true
        Nice_DeathScreen.displayLength = self.userData.length
        Nice_DeathScreen.shotsFired = Nice_DeathScreen.ttlShotsFired
        Nice_DeathScreen.shotsHit = Nice_DeathScreen.ttlShotsHit
    end

    -- tick down damage display
    if Nice_DeathScreen.doingDamage == true then
        Nice_DeathScreen.displayLength = Nice_DeathScreen.displayLength - deltaTime
        Nice_DeathScreen.time = Nice_DeathScreen.time + deltaTime
        if Nice_DeathScreen.displayLength <= -self.userData.delay  or player.health <= 0 then
            Nice_DeathScreen.display = false
            Nice_DeathScreen.displayLength = self.userData.length
            Nice_DeathScreen.shotsFired = Nice_DeathScreen.ttlShotsFired
            Nice_DeathScreen.firedShots = 0
            Nice_DeathScreen.shotsHit = Nice_DeathScreen.ttlShotsHit
            Nice_DeathScreen.hitShots = 0
            Nice_DeathScreen.doingDamage = false
            Nice_DeathScreen.time = 0
        end
    end

    -- display damage doing stuff
    if Nice_DeathScreen.display == true and Nice_DeathScreen.displayLength < (self.userData.length - self.userData.delay) and Nice_DeathScreen.doingDamage == true then
        -- fade in, fade out animation
        if Nice_DeathScreen.time < 0.33 then
            intensity = -((Nice_DeathScreen.displayLength + self.userData.delay) - 3) * 255 * 2.6
        else
            intensity = 255 * math.min((Nice_DeathScreen.displayLength + self.userData.delay) * 2.6, 1)
        end

        nvgFontSize(60)
        nvgTextAlign(NVG_ALIGN_RIGHT, NVG_ALIGN_BOTTOM)
        if Nice_DeathScreen.hitShots / Nice_DeathScreen.firedShots > 0.5 then
            nvgFillColor(Color(184, 0, 0, math.min(255, intensity)))
        elseif Nice_DeathScreen.hitShots / Nice_DeathScreen.firedShots > 0.4 then
            nvgFillColor(Color(0, 88, 192, math.min(255, intensity)))
        elseif Nice_DeathScreen.hitShots / Nice_DeathScreen.firedShots > 0.3 then
            nvgFillColor(Color(0, 0, 0, math.min(255, intensity)))
        elseif Nice_DeathScreen.hitShots / Nice_DeathScreen.firedShots > 0.2 then
            nvgFillColor(Color(0, 88, 192, math.min(255, intensity)))
        elseif Nice_DeathScreen.hitShots / Nice_DeathScreen.firedShots >= 0 then
            nvgFillColor(Color(0, 0, 0, math.min(255, intensity)))
        end
        nvgText(-1, 1, math.floor((Nice_DeathScreen.hitShots / Nice_DeathScreen.firedShots) * 100))
        nvgFontSize(50)
        nvgTextAlign(NVG_ALIGN_LEFT, NVG_ALIGN_BOTTOM)
        nvgText(-1, -3, "%")

        nvgFontSize(60)
        nvgTextAlign(NVG_ALIGN_RIGHT, NVG_ALIGN_BOTTOM)
        if Nice_DeathScreen.hitShots / Nice_DeathScreen.firedShots > 0.5 then
            nvgFillColor(Color(0, 88, 192, math.min(255, intensity)))
        elseif Nice_DeathScreen.hitShots / Nice_DeathScreen.firedShots > 0.4 then
            nvgFillColor(Color(0, 160, 0, math.min(255, intensity)))
        elseif Nice_DeathScreen.hitShots / Nice_DeathScreen.firedShots > 0.3 then
            nvgFillColor(Color(224, 192, 0, math.min(255, intensity)))
        elseif Nice_DeathScreen.hitShots / Nice_DeathScreen.firedShots > 0.2 then
            nvgFillColor(Color(184, 0, 0, math.min(255, intensity)))
        elseif Nice_DeathScreen.hitShots / Nice_DeathScreen.firedShots >= 0 then
            nvgFillColor(Color(255, 255, 255, math.min(255, intensity)))
        end
        nvgText(0, 0, math.floor((Nice_DeathScreen.hitShots / Nice_DeathScreen.firedShots) * 100))
        nvgFontSize(50)
        nvgTextAlign(NVG_ALIGN_LEFT, NVG_ALIGN_BOTTOM)
        nvgText(0, -4, "%")
    end
end