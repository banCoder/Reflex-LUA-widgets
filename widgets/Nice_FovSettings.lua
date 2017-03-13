require "base/internal/ui/reflexcore"

Nice_FovSettings = { canPosition = false, index = 0 }
registerWidget("Nice_FovSettings")

function Nice_FovSettings:initialize()
    self.userData = loadUserData()
    settings = {
        [0] = { FOV = nil, zoomKey = nil; sensitivity = nil; advancedSens = nil; advancedAcceleration = nil; advancedAngle = nil; advancedOffset = nil; advancedPower = nil; advancedSensCap = nil; advancedPostscaleX = nil; advancedPostscaleY = nil; invert = nil; };
        [1] = { FOV = consoleGetVariable("r_fov"); zoomSens = 1; zoomHold = 0; zoom = false; zoomFOV = 80; sensitivity = consoleGetVariable("m_speed"); advancedSens = consoleGetVariable("m_advanced"); advancedAcceleration = consoleGetVariable("m_advanced_acceleration"); advancedAngle = consoleGetVariable("m_advanced_angle"); advancedOffset = consoleGetVariable("m_advanced_offset"); advancedPower = consoleGetVariable("m_advanced_power"); advancedSensCap = consoleGetVariable("m_advanced_sensitivity_cap"); advancedPostscaleX = consoleGetVariable("m_advanced_postscale_x"); advancedPostscaleY = consoleGetVariable("m_advanced_postscale_y"); invert = consoleGetVariable("m_invert"); sensitivityScale = 1; sensEnabled = false; zoomKeep = false; sameKey = false};
        [2] = { FOV = consoleGetVariable("r_fov"); zoomSens = 1; zoomHold = 0; zoom = false; zoomFOV = 80; sensitivity = consoleGetVariable("m_speed"); advancedSens = consoleGetVariable("m_advanced"); advancedAcceleration = consoleGetVariable("m_advanced_acceleration"); advancedAngle = consoleGetVariable("m_advanced_angle"); advancedOffset = consoleGetVariable("m_advanced_offset"); advancedPower = consoleGetVariable("m_advanced_power"); advancedSensCap = consoleGetVariable("m_advanced_sensitivity_cap"); advancedPostscaleX = consoleGetVariable("m_advanced_postscale_x"); advancedPostscaleY = consoleGetVariable("m_advanced_postscale_y"); invert = consoleGetVariable("m_invert"); sensitivityScale = 1; sensEnabled = false; zoomKeep = false; sameKey = false};
        [3] = { FOV = consoleGetVariable("r_fov"); zoomSens = 1; zoomHold = 0; zoom = false; zoomFOV = 80; sensitivity = consoleGetVariable("m_speed"); advancedSens = consoleGetVariable("m_advanced"); advancedAcceleration = consoleGetVariable("m_advanced_acceleration"); advancedAngle = consoleGetVariable("m_advanced_angle"); advancedOffset = consoleGetVariable("m_advanced_offset"); advancedPower = consoleGetVariable("m_advanced_power"); advancedSensCap = consoleGetVariable("m_advanced_sensitivity_cap"); advancedPostscaleX = consoleGetVariable("m_advanced_postscale_x"); advancedPostscaleY = consoleGetVariable("m_advanced_postscale_y"); invert = consoleGetVariable("m_invert"); sensitivityScale = 1; sensEnabled = false; zoomKeep = false; sameKey = false};
        [4] = { FOV = consoleGetVariable("r_fov"); zoomSens = 1; zoomHold = 0; zoom = false; zoomFOV = 80; sensitivity = consoleGetVariable("m_speed"); advancedSens = consoleGetVariable("m_advanced"); advancedAcceleration = consoleGetVariable("m_advanced_acceleration"); advancedAngle = consoleGetVariable("m_advanced_angle"); advancedOffset = consoleGetVariable("m_advanced_offset"); advancedPower = consoleGetVariable("m_advanced_power"); advancedSensCap = consoleGetVariable("m_advanced_sensitivity_cap"); advancedPostscaleX = consoleGetVariable("m_advanced_postscale_x"); advancedPostscaleY = consoleGetVariable("m_advanced_postscale_y"); invert = consoleGetVariable("m_invert"); sensitivityScale = 1; sensEnabled = false; zoomKeep = false; sameKey = false};
        [5] = { FOV = consoleGetVariable("r_fov"); zoomSens = 1; zoomHold = 0; zoom = false; zoomFOV = 80; sensitivity = consoleGetVariable("m_speed"); advancedSens = consoleGetVariable("m_advanced"); advancedAcceleration = consoleGetVariable("m_advanced_acceleration"); advancedAngle = consoleGetVariable("m_advanced_angle"); advancedOffset = consoleGetVariable("m_advanced_offset"); advancedPower = consoleGetVariable("m_advanced_power"); advancedSensCap = consoleGetVariable("m_advanced_sensitivity_cap"); advancedPostscaleX = consoleGetVariable("m_advanced_postscale_x"); advancedPostscaleY = consoleGetVariable("m_advanced_postscale_y"); invert = consoleGetVariable("m_invert"); sensitivityScale = 1; sensEnabled = false; zoomKeep = false; sameKey = false};
        [6] = { FOV = consoleGetVariable("r_fov"); zoomSens = 1; zoomHold = 0; zoom = false; zoomFOV = 80; sensitivity = consoleGetVariable("m_speed"); advancedSens = consoleGetVariable("m_advanced"); advancedAcceleration = consoleGetVariable("m_advanced_acceleration"); advancedAngle = consoleGetVariable("m_advanced_angle"); advancedOffset = consoleGetVariable("m_advanced_offset"); advancedPower = consoleGetVariable("m_advanced_power"); advancedSensCap = consoleGetVariable("m_advanced_sensitivity_cap"); advancedPostscaleX = consoleGetVariable("m_advanced_postscale_x"); advancedPostscaleY = consoleGetVariable("m_advanced_postscale_y"); invert = consoleGetVariable("m_invert"); sensitivityScale = 1; sensEnabled = false; zoomKeep = false; sameKey = false};
        [7] = { FOV = consoleGetVariable("r_fov"); zoomSens = 1; zoomHold = 0; zoom = false; zoomFOV = 80; sensitivity = consoleGetVariable("m_speed"); advancedSens = consoleGetVariable("m_advanced"); advancedAcceleration = consoleGetVariable("m_advanced_acceleration"); advancedAngle = consoleGetVariable("m_advanced_angle"); advancedOffset = consoleGetVariable("m_advanced_offset"); advancedPower = consoleGetVariable("m_advanced_power"); advancedSensCap = consoleGetVariable("m_advanced_sensitivity_cap"); advancedPostscaleX = consoleGetVariable("m_advanced_postscale_x"); advancedPostscaleY = consoleGetVariable("m_advanced_postscale_y"); invert = consoleGetVariable("m_invert"); sensitivityScale = 1; sensEnabled = false; zoomKeep = false; sameKey = false};
        [8] = { FOV = consoleGetVariable("r_fov"); zoomSens = 1; zoomHold = 0; zoom = false; zoomFOV = 80; sensitivity = consoleGetVariable("m_speed"); advancedSens = consoleGetVariable("m_advanced"); advancedAcceleration = consoleGetVariable("m_advanced_acceleration"); advancedAngle = consoleGetVariable("m_advanced_angle"); advancedOffset = consoleGetVariable("m_advanced_offset"); advancedPower = consoleGetVariable("m_advanced_power"); advancedSensCap = consoleGetVariable("m_advanced_sensitivity_cap"); advancedPostscaleX = consoleGetVariable("m_advanced_postscale_x"); advancedPostscaleY = consoleGetVariable("m_advanced_postscale_y"); invert = consoleGetVariable("m_invert"); sensitivityScale = 1; sensEnabled = false; zoomKeep = false; sameKey = false};
        [9] = { FOV = consoleGetVariable("r_fov"); zoomSens = 1; zoomHold = 0; zoom = false; zoomFOV = 80; sensitivity = consoleGetVariable("m_speed"); advancedSens = consoleGetVariable("m_advanced"); advancedAcceleration = consoleGetVariable("m_advanced_acceleration"); advancedAngle = consoleGetVariable("m_advanced_angle"); advancedOffset = consoleGetVariable("m_advanced_offset"); advancedPower = consoleGetVariable("m_advanced_power"); advancedSensCap = consoleGetVariable("m_advanced_sensitivity_cap"); advancedPostscaleX = consoleGetVariable("m_advanced_postscale_x"); advancedPostscaleY = consoleGetVariable("m_advanced_postscale_y"); invert = consoleGetVariable("m_invert"); sensitivityScale = 1; sensEnabled = false; zoomKeep = false; sameKey = false};
    } 
    CheckSetDefaultValue(self, "userData", "table", settings)
    widgetCreateConsoleVariable("zoom", "int", 1)
    widgetCreateConsoleVariable("key", "int", 1)

    local weaponNamesFov = { "Melee", "Burst gun", "Shotgun", "Grenade launcher", "Plasma gun", "Rocket launcher", "Ion cannon", "Bolt rifle", "Stake gun" }
    local editZoomIndexFov = { false, false, false, false, false, false, false, false, false}
    local editSensitivityIndexFov = { false, false, false, false, false, false, false, false, false }

    function defaultSensitivity(weaponIndex)
        if self.userData[0].sensitivity == nil then
            self.userData[0].sensitivity = consoleGetVariable("m_speed")
            self.userData[0].advancedSens = consoleGetVariable("m_advanced")
            self.userData[0].advancedAcceleration = consoleGetVariable("m_advanced_acceleration")
            self.userData[0].advancedAngle = consoleGetVariable("m_advanced_angle")
            self.userData[0].advancedOffset = consoleGetVariable("m_advanced_offset")
            self.userData[0].advancedPower = consoleGetVariable("m_advanced_power")
            self.userData[0].advancedSensCap = consoleGetVariable("m_advanced_sensitivity_cap")
            self.userData[0].advancedPostscaleX = consoleGetVariable("m_advanced_postscale_x")
            self.userData[0].advancedPostscaleY = consoleGetVariable("m_advanced_postscale_y")
            self.userData[0].invert = consoleGetVariable("m_invert")
            self.userData[0].sensEnabled = false
            self.userData[0].sensitivityScale = 1
            for i = 1, 9 do
                self.userData[i].sensitivity = self.userData[0].sensitivity
                self.userData[i].advancedSens = self.userData[0].advancedSens
                self.userData[i].advancedAcceleration = self.userData[0].advancedAcceleration
                self.userData[i].advancedAngle = self.userData[0].advancedAngle
                self.userData[i].advancedOffset = self.userData[0].advancedOffset
                self.userData[i].advancedPower = self.userData[0].advancedPower
                self.userData[i].advancedSensCap = self.userData[0].advancedSensCap
                self.userData[i].advancedPostscaleX = self.userData[0].advancedPostscaleX
                self.userData[i].advancedPostscaleY = self.userData[0].advancedPostscaleY
                self.userData[i].invert = self.userData[0].invert
                self.userData[i].sensEnabled = false
                self.userData[i].sensitivityScale = 1
            end
        end
    end

    function newDefaultSensitivity(weaponIndex)
        if self.userData[0].sensitivity ~= nil and self.userData[weaponIndex].sensitivity ~= nil then
            self.userData[0].sensitivity = self.userData[weaponIndex].sensitivity
            self.userData[0].advancedSens = self.userData[weaponIndex].advancedSens
            self.userData[0].advancedAcceleration = self.userData[weaponIndex].advancedAcceleration
            self.userData[0].advancedAngle = self.userData[weaponIndex].advancedAngle
            self.userData[0].advancedOffset = self.userData[weaponIndex].advancedOffset
            self.userData[0].advancedPower = self.userData[weaponIndex].advancedPower
            self.userData[0].advancedSensCap = self.userData[weaponIndex].advancedSensCap
            self.userData[0].advancedPostscaleX = self.userData[weaponIndex].advancedPostscaleX
            self.userData[0].advancedPostscaleY = self.userData[weaponIndex].advancedPostscaleY
            self.userData[0].invert = self.userData[weaponIndex].invert
            self.userData[0].sensEnabled = false
            self.userData[0].sensitivityScale = self.userData[weaponIndex].sensitivityScale
            for i = 1, 9 do
                if self.userData[i].sensEnabled == false or i == weaponIndex then
                    self.userData[i].sensitivity = self.userData[0].sensitivity
                    self.userData[i].advancedSens = self.userData[0].advancedSens
                    self.userData[i].advancedAcceleration = self.userData[0].advancedAcceleration
                    self.userData[i].advancedAngle = self.userData[0].advancedAngle
                    self.userData[i].advancedOffset = self.userData[0].advancedOffset
                    self.userData[i].advancedPower = self.userData[0].advancedPower
                    self.userData[i].advancedSensCap = self.userData[0].advancedSensCap
                    self.userData[i].advancedPostscaleX = self.userData[0].advancedPostscaleX
                    self.userData[i].advancedPostscaleY = self.userData[0].advancedPostscaleY
                    self.userData[i].invert = self.userData[0].invert
                    self.userData[i].sensitivityScale = self.userData[0].sensitivityScale
                    self.userData[i].sensEnabled = false
                end
            end
        end
    end

    function editZoom(weaponIndex, x, y)
        local widthFov = 450
        local heightFov = 200
        local btnwidthFov = 60
        local spacingFov = 100
        x = x + 100
        uiWindow("Edit zoom for " .. weaponNamesFov[weaponIndex], x, y + 40, widthFov, heightFov)
        uiLabel("Enable", x + 10, y + 80)
        self.userData[weaponIndex].zoom = ui2RowCheckbox(x, y + 110, 15, "", self.userData[weaponIndex].zoom)
        if self.userData[weaponIndex].zoom then
            y = y + 80
            spacingFov = spacingFov
            uiLabel("Zoom key", x + spacingFov, y)
            spacingFov = spacingFov + spacingFov
            uiLabel("Zoom FOV", x + spacingFov, y)
            spacingFov = spacingFov + 100
            uiLabel("Sensitivity scale", x + spacingFov, y)
            y = y + 30
            uiLabel("Hold", x + 10, y + 50)
            uiLabel("Keep", x + 75, y + 50)
            m = mouseRegion(x + 75, y + 55, 75, 65, optionalId);
            if m.mouseInside then
                nvgText(110, 45 - 260, "Keeps your zoomed-in FOV when switching weapons")
            end
            uiLabel("Same key", x + 140, y + 50)
            spacingFov = spacingFov - 200
            self.userData[weaponIndex].zoomHold = ui2RowCheckbox(x, y + 80, 20, "", self.userData[weaponIndex].zoomHold)
            if self.userData[weaponIndex].zoomHold then
                self.userData[weaponIndex].zoomKeep = false
            end
            self.userData[weaponIndex].zoomKeep = ui2RowCheckbox(x + 65, y + 80, 20, "", self.userData[weaponIndex].zoomKeep)
            self.userData[weaponIndex].sameKey = ui2RowCheckbox(x + 130, y + 80, 20, "", self.userData[weaponIndex].sameKey)
            input = inputGrabRegion(x + spacingFov, y + 3, 110, 30)
            nvgBeginPath()
            nvgRoundedRect(x + spacingFov, y + 3, 80, 30, 3)
            nvgFillColor(Color(62,63,67,255))
            nvgFill()
            nvgStroke()
            nvgFillColor(Color(255,255,255,255))
            nvgText(x + spacingFov + 10, y + 27, self.userData[0].zoomKey)
            if input.nameKeyPressed ~= nil then
                if self.userData[0].zoomKey ~= nil then
                    consolePerformCommand("unbind game " .. self.userData[0].zoomKey)
                end
                self.userData[0].zoomKey = input.nameKeyPressed
            end
            spacingFov = spacingFov + 100
            self.userData[weaponIndex].zoomFOV = uiEditBox(self.userData[weaponIndex].zoomFOV, x + spacingFov, y, 60)
            spacingFov = spacingFov + 100
            self.userData[weaponIndex].zoomSens = uiEditBox2Decimals(self.userData[weaponIndex].zoomSens, x + spacingFov, y, 60)
            btnspacingFov = 110
        else
            btnspacingFov = 0
        end
        if (uiButton("Ok", nil, x + widthFov - btnwidthFov - 5, y + heightFov - btnspacingFov, btnwidthFov, 35)) then
            editZoomIndexFov[weaponIndex] = false
        end
        if (uiButton("Apply to all", nil, x + widthFov - btnwidthFov - 120, y + heightFov - btnspacingFov, 110, 35)) then
            if self.userData[weaponIndex].zoom ~= nil and self.userData[0].zoomKey ~= nil 
            and self.userData[weaponIndex].zoomSens ~= nil and self.userData[weaponIndex].zoomHold ~= nil
            and self.userData[weaponIndex].zoomFOV ~= nil then
                for i = 1, 9 do
                    if i ~= weaponIndex then
                        self.userData[i].zoom = self.userData[weaponIndex].zoom
                        self.userData[i].zoomSens = self.userData[weaponIndex].zoomSens
                        self.userData[i].zoomHold = self.userData[weaponIndex].zoomHold
                        self.userData[i].zoomFOV = self.userData[weaponIndex].zoomFOV
                        self.userData[i].zoomKeep = self.userData[weaponIndex].zoomKeep
                        self.userData[i].sameKey = self.userData[weaponIndex].sameKey
                    end
                end
            end
        end
        if self.userData[0].zoomKey ~= nil then
            if (uiButton("Unbind", nil, x + widthFov - btnwidthFov - 195, y + heightFov - btnspacingFov, 70, 35)) then
                consolePerformCommand("unbind game " .. self.userData[0].zoomKey)
                self.userData[0].zoomKey = nil
            end
        end
    end

    function editSensitivity(weaponIndex, x, y)
        local widthFov = 830
        local heightFov = 240
        local btnwidthFov = 60
        local spacingFov = 100
        x = x + 30
        uiWindow("Edit sensitivity settings for " .. weaponNamesFov[weaponIndex], x, y + 40, widthFov, heightFov)
        y = y + 80
        uiLabel("Change", x + 10, y)
        self.userData[weaponIndex].sensEnabled = ui2RowCheckbox(x + 10, y + 30, 0, "", self.userData[weaponIndex].sensEnabled)   
        if self.userData[weaponIndex].sensEnabled then
            --uiLabel(self.userData[weaponIndex].sensitivity, x, y)
            uiLabel("Sensitivity", x + spacingFov, y)
            spacingFov = spacingFov + 115
            uiLabel("Scale", x + spacingFov, y)
            spacingFov = spacingFov + 95
            uiLabel("Invert", x + spacingFov, y)
            spacingFov = spacingFov + 95
            uiLabel("Advanced", x + spacingFov, y)
            spacingFov = spacingFov + 45
            spacingFov = spacingFov + 135
            spacingFov = spacingFov + 145
            spacingFov = spacingFov + 145
            y = y + 30
            spacingFov = spacingFov - 770
            self.userData[weaponIndex].sensitivity = uiEditBox2Decimals(self.userData[weaponIndex].sensitivity, x + spacingFov, y, 60)
            spacingFov = spacingFov + 110
            self.userData[weaponIndex].sensitivityScale = uiEditBox2Decimals(self.userData[weaponIndex].sensitivityScale, x + spacingFov, y, 60)
            spacingFov = spacingFov + 95
            if self.userData[weaponIndex].invert == nil or self.userData[weaponIndex].invert == "nil" or self.userData[weaponIndex].invert == 0 or self.userData[weaponIndex].invert == "0" or self.userData[weaponIndex].invert == false or self.userData[weaponIndex].invert == "false" then
                self.userData[weaponIndex].invert = false
            else
                self.userData[weaponIndex].invert = true
            end
            self.userData[weaponIndex].invert = ui2RowCheckbox(x + spacingFov, y, 0, "", self.userData[weaponIndex].invert)   
            spacingFov = spacingFov + 95
            if self.userData[weaponIndex].advancedSens == nil or self.userData[weaponIndex].advancedSens == "nil" or self.userData[weaponIndex].advancedSens == 0 or self.userData[weaponIndex].advancedSens == "0" or self.userData[weaponIndex].advancedSens == false or self.userData[weaponIndex].advancedSens == "false" then
                self.userData[weaponIndex].advancedSens = false
            else
                self.userData[weaponIndex].advancedSens = true
            end
            self.userData[weaponIndex].advancedSens = ui2RowCheckbox(x + spacingFov, y, 0, "", self.userData[weaponIndex].advancedSens)
            spacingFov = spacingFov + 150
            if self.userData[weaponIndex].advancedSens then
                y = y + 80
                spacingFov = spacingFov - 435
                uiLabel("Acceleration", x + 10, y - 30)
                self.userData[weaponIndex].advancedAcceleration = uiEditBox2Decimals(self.userData[weaponIndex].advancedAcceleration, x + 10, y, 60)
                uiLabel("Sensitivity cap", x + spacingFov + 25,  y - 30)
                self.userData[weaponIndex].advancedSensCap = uiEditBox2Decimals(self.userData[weaponIndex].advancedSensCap, x + spacingFov + 25, y, 60)
                spacingFov = spacingFov + 170
                uiLabel("Offset", x + spacingFov,  y - 30)
                self.userData[weaponIndex].advancedOffset = uiEditBox2Decimals(self.userData[weaponIndex].advancedOffset, x + spacingFov, y, 60)
                spacingFov = spacingFov + 85
                uiLabel("Power", x + spacingFov, y - 30)
                self.userData[weaponIndex].advancedPower = uiEditBox2Decimals(self.userData[weaponIndex].advancedPower, x + spacingFov, y, 60)
                spacingFov = spacingFov + 90
                uiLabel("Post-Scale X", x + spacingFov, y - 30)
                self.userData[weaponIndex].advancedPostscaleX = uiEditBox2Decimals(self.userData[weaponIndex].advancedPostscaleX, x + spacingFov, y, 60) 
                spacingFov = spacingFov + 145
                uiLabel("Post-Scale Y", x + spacingFov, y - 30)
                self.userData[weaponIndex].advancedPostscaleY = uiEditBox2Decimals(self.userData[weaponIndex].advancedPostscaleY, x + spacingFov, y, 60)  
                spacingFov = spacingFov + 145
                uiLabel("Angle", x + spacingFov, y - 30)
                self.userData[weaponIndex].advancedAngle = uiEditBox2Decimals(self.userData[weaponIndex].advancedAngle, x + spacingFov, y, 60)                                            
                if (uiButton("Set as default", nil, x + 10, y + heightFov - 190, btnwidthFov * 2 + 5, 35)) then
                    newDefaultSensitivity(weaponIndex)
                end
            else
                if (uiButton("Set as default", nil, x + 10, y + heightFov - 110, btnwidthFov * 2 + 5, 35)) then
                    newDefaultSensitivity(weaponIndex)
                end
            end
        end
        if self.userData[weaponIndex].sensEnabled == false then
            btnspacingFov = 80
        elseif self.userData[weaponIndex].sensEnabled and self.userData[weaponIndex].advancedSens == false then
            btnspacingFov = 110
        else
            btnspacingFov = 190
        end
        if (uiButton("Ok", nil, x + widthFov - btnwidthFov - 5, y + heightFov - btnspacingFov, btnwidthFov, 35)) then
            editSensitivityIndexFov[weaponIndex] = false
        end
    end

    function weaponOptionsFov(weaponIndex, x, y)
        local spacingFov = 100
        -- weapon name
        uiLabel(weaponNamesFov[weaponIndex], x, y)
        -- edit FOV
        if self.userData[0].FOV == nil then
            self.userData[0].FOV = consoleGetVariable("r_fov")
        end
        if self.userData[weaponIndex].FOV ~= self.userData[0].FOV and self.userData[weaponIndex].FOV ~= tostring(self.userData[0].FOV) then
            nvgFillColor(Color(255, 0, 0, 20))
        else
            nvgFillColor(Color(255, 255, 255, 20))
        end
        self.userData[weaponIndex].FOV = uiEditBox(self.userData[weaponIndex].FOV, x + 170, y, 60)
        nvgFill()
        spacingFov = spacingFov + 160
        --edit zoom
        if self.userData[weaponIndex].zoom then
            col = Color(255, 0, 0, 50)
        else
            col = Color(255, 255, 255, 50)
        end
        if (uiButton("Edit", nil, x + spacingFov, y, 60, 35, col)) then
			editZoomIndexFov[weaponIndex] = true
            for i = 1, 9, 1 do
                editSensitivityIndexFov[i] = false
                if i ~= weaponIndex then                    
                    editZoomIndexFov[i] = false
                end                
            end
	    end
        if editZoomIndexFov[weaponIndex] then
            editZoom(weaponIndex, x, y)
        end
        spacingFov = spacingFov + 85
        --edit sensitivity
        if self.userData[weaponIndex].sensEnabled then
            col = Color(255, 0, 0, 50)
        else
            col = Color(255, 255, 255, 50)
        end
        defaultSensitivity(weaponIndex)
        if (uiButton("Edit", nil, x + spacingFov, y, 60, 35, col)) then
			editSensitivityIndexFov[weaponIndex] = true
            for i = 1, 9, 1 do
                editZoomIndexFov[i] = false
                if i ~= weaponIndex then                    
                    editSensitivityIndexFov[i] = false
                end                
            end
	    end
        if editSensitivityIndexFov[weaponIndex] then
            editSensitivity(weaponIndex, x, y)
        end
        --draw line at the bottom
        y = y + 40
        nvgBeginPath()
	    nvgMoveTo(x, y)
	    nvgLineTo(x + 810, y)
	    nvgStrokeWidth(1)
	    nvgStrokeColor(Color(150, 150, 150, 80))
	    nvgStroke()
        y = y + 10
    end
end

function Nice_FovSettings:drawOptions(x, y)
    local userFov = self.userData
    local spacingFov = 100
    local widthFov = 60
    
    nvgFontSize(22)
	nvgFontFace(FONT_TEXT)
	nvgTextAlign(NVG_ALIGN_LEFT, NVG_ALIGN_BOTTOM)

    nvgBeginPath()
	nvgMoveTo(x, y)
	nvgLineTo(x + 810, y)
	nvgStrokeWidth(1)
	nvgStrokeColor(Color(150, 150, 150, 80))
	nvgStroke()
    uiLabel("Weapon", x, y)
    spacingFov = spacingFov + 80
    uiLabel("FOV", x + spacingFov, y)
    spacingFov = spacingFov + 75
    uiLabel("Zoom", x + spacingFov, y)
    spacingFov = spacingFov + 80
    uiLabel("Sensitivity", x + spacingFov, y)

    y = y + 35

    nvgBeginPath()
	nvgMoveTo(x, y)
	nvgLineTo(x + 810, y)
	nvgStrokeWidth(1)
	nvgStrokeColor(Color(150, 150, 150, 80))
	nvgStroke()
    y = y + 10

    local spacingFov = 170
    local widthFov = 60

    nvgFontSize(22)
	nvgFontFace(FONT_TEXT)
	nvgTextAlign(NVG_ALIGN_LEFT, NVG_ALIGN_BOTTOM)
    ------------------------------------------------------------------------------------------------------------------------------
    
    weaponOptionsFov(9, x, y + 400)
    weaponOptionsFov(8, x, y + 350)
    weaponOptionsFov(7, x, y + 300)
    weaponOptionsFov(6, x, y + 250)
    weaponOptionsFov(5, x, y + 200)
    weaponOptionsFov(4, x, y + 150)
    weaponOptionsFov(3, x, y + 100)
    weaponOptionsFov(2, x, y + 50)
    weaponOptionsFov(1, x, y)

    saveUserData(userFov)
end

function Nice_FovSettings:draw()
    if not shouldShowHUD() then
        Nice_FovSettings.index = 0
        return
    end

    local weaponKey = { nil, nil, nil, nil, nil, nil, nil, nil }

    -- get player, reset if not the same
    local player = getPlayer()
    if player == nil or player.index ~= Nice_FovSettings.index then
        Nice_FovSettings.index = player.index
        currentWeapon = -1
        if self.userData[0].zoomKey ~= nil then
            consolePerformCommand("unbind game " .. self.userData[0].zoomKey)
        end
        return
    end

    --zoom
    for i = 1, 9, 1 do
        weaponKey[i] = bindReverseLookup("weapon " .. i, "game")
    end
    if self.userData[player.weaponIndexSelected].zoom and self.userData[0].zoomKey ~= nil and self.userData[player.weaponIndexSelected].sameKey == false then
        for i = 1, 9, 1 do
            consolePerformCommand("unbind game " .. weaponKey[i])
            consolePerformCommand("bind game " .. weaponKey[i] .. " weapon " .. i)
        end
        if self.userData[player.weaponIndexSelected].zoomHold then
            if widgetGetConsoleVariable("zoom") == 1 then
                consolePerformCommand("unbind game " .. self.userData[0].zoomKey)
                consolePerformCommand("bind game " .. self.userData[0].zoomKey .. " ui_Nice_FovSettings_zoom 14; +showScores")
                consolePerformCommand("r_fov " .. self.userData[player.weaponIndexSelected].FOV)
                consolePerformCommand("m_speed " .. (self.userData[player.weaponIndexSelected].sensitivity))
                consolePerformCommand("ui_show_widget scoreboard")
            elseif widgetGetConsoleVariable("zoom") == 14 then
                consolePerformCommand("ui_hide_widget scoreboard")
                if showScores == false then 
                    consolePerformCommand("unbind game " .. self.userData[0].zoomKey)
                    consolePerformCommand("ui_Nice_FovSettings_zoom 1")
                else
                    consolePerformCommand("r_fov " .. self.userData[player.weaponIndexSelected].zoomFOV)
                    consolePerformCommand("m_speed " .. ((self.userData[player.weaponIndexSelected].sensitivity * self.userData[player.weaponIndexSelected].zoomSens) * (math.atan(math.tan(self.userData[player.weaponIndexSelected].zoomFOV * math.pi / 360) * consoleGetVariable("r_resolution_fullscreen")[2] / consoleGetVariable("r_resolution_fullscreen")[1]) * (360 / math.pi) / 75)))
                end
            end
        else
            if widgetGetConsoleVariable("zoom") == 1 then
                consolePerformCommand("bind game " .. self.userData[0].zoomKey .. " ui_Nice_FovSettings_zoom 14")
                currentWeapon = player.weaponIndexSelected
            else
                if currentWeapon ~= player.weaponIndexSelected then
                    if self.userData[player.weaponIndexSelected].zoomKeep == false and currentWeapon ~= -1 then
                        consolePerformCommand("bind game " .. self.userData[0].zoomKey .. " ui_Nice_FovSettings_zoom 14")
                        consolePerformCommand("ui_Nice_FovSettings_zoom 1")                        
                    end
                    currentWeapon = player.weaponIndexSelected
                else
                    consolePerformCommand("bind game " .. self.userData[0].zoomKey .. " ui_Nice_FovSettings_zoom 1")
                end
            end
            if widgetGetConsoleVariable("zoom") == 1 then
                consolePerformCommand("r_fov " .. self.userData[player.weaponIndexSelected].FOV)
                consolePerformCommand("m_speed " .. (self.userData[player.weaponIndexSelected].sensitivity))
            else
                consolePerformCommand("r_fov " .. self.userData[player.weaponIndexSelected].zoomFOV)
                consolePerformCommand("m_speed " .. ((self.userData[player.weaponIndexSelected].sensitivity * self.userData[player.weaponIndexSelected].zoomSens) * (math.atan(math.tan(self.userData[player.weaponIndexSelected].zoomFOV * math.pi / 360) * consoleGetVariable("r_resolution_fullscreen")[2] / consoleGetVariable("r_resolution_fullscreen")[1]) * (360 / math.pi) / 75)))
            end
        end
    elseif self.userData[player.weaponIndexSelected].zoom and self.userData[player.weaponIndexSelected].sameKey then
        if self.userData[player.weaponIndexSelected].zoomHold then
            if widgetGetConsoleVariable("key") == 1 then
                for i = 1, 9, 1 do
                    consolePerformCommand("unbind game " .. weaponKey[i])
                    if i ~= player.weaponIndexSelected then
                        consolePerformCommand("bind game " .. weaponKey[i] .. " weapon " .. i)
                    else
                        consolePerformCommand("bind game " .. weaponKey[i] .. " ui_Nice_FovSettings_key 14; +showScores; weapon " .. player.weaponIndexSelected)
                    end
                end
                consolePerformCommand("r_fov " .. self.userData[player.weaponIndexSelected].FOV)
                consolePerformCommand("m_speed " .. (self.userData[player.weaponIndexSelected].sensitivity))
                consolePerformCommand("ui_show_widget scoreboard")
            elseif widgetGetConsoleVariable("key") == 14 then
                consolePerformCommand("ui_hide_widget scoreboard")
                if showScores == false then 
                    for i = 1, 9, 1 do
                        consolePerformCommand("unbind game " .. weaponKey[i])
                        if i ~= player.weaponIndexSelected then
                            consolePerformCommand("bind game " .. weaponKey[i] .. " weapon " .. i)
                        else
                            consolePerformCommand("bind game " .. weaponKey[i] .. " ui_Nice_FovSettings_key 1; weapon " .. player.weaponIndexSelected)
                        end
                    end
                    consolePerformCommand("ui_Nice_FovSettings_key 1")
                else
                    consolePerformCommand("r_fov " .. self.userData[player.weaponIndexSelected].zoomFOV)
                    consolePerformCommand("m_speed " .. ((self.userData[player.weaponIndexSelected].sensitivity * self.userData[player.weaponIndexSelected].zoomSens) * (self.userData[player.weaponIndexSelected].zoomFOV/ self.userData[player.weaponIndexSelected].FOV)))
                end
            end
        else
            if widgetGetConsoleVariable("key") == 1 then
                for i = 1, 9, 1 do
                    consolePerformCommand("unbind game " .. weaponKey[i])
                    if i ~= player.weaponIndexSelected then
                        consolePerformCommand("bind game " .. weaponKey[i] .. " weapon " .. i)
                    else
                        consolePerformCommand("bind game " .. weaponKey[i] .. " ui_Nice_FovSettings_key 14; weapon " .. player.weaponIndexSelected)
                    end
                end
                currentWeapon = player.weaponIndexSelected
            else
                if currentWeapon ~= player.weaponIndexSelected then
                    if self.userData[player.weaponIndexSelected].zoomKeep == false and currentWeapon ~= -1 then
                        for i = 1, 9, 1 do
                            consolePerformCommand("unbind game " .. weaponKey[i])
                            if i ~= player.weaponIndexSelected then
                                consolePerformCommand("bind game " .. weaponKey[i] .. " weapon " .. i)
                            else
                                consolePerformCommand("bind game " .. weaponKey[i] .. " ui_Nice_FovSettings_key 14; weapon " .. player.weaponIndexSelected)
                            end
                        end
                        consolePerformCommand("ui_Nice_FovSettings_key 1")                        
                    end
                    currentWeapon = player.weaponIndexSelected
                else
                    for i = 1, 9, 1 do
                        consolePerformCommand("unbind game " .. weaponKey[i])
                        if i ~= player.weaponIndexSelected then
                            consolePerformCommand("bind game " .. weaponKey[i] .. " weapon " .. i)
                        else
                            consolePerformCommand("bind game " .. weaponKey[i] .. " ui_Nice_FovSettings_key 1; weapon " .. player.weaponIndexSelected)
                        end
                    end
                end
            end
            if widgetGetConsoleVariable("key") == 1 then
                consolePerformCommand("r_fov " .. self.userData[player.weaponIndexSelected].FOV)
                consolePerformCommand("m_speed " .. (self.userData[player.weaponIndexSelected].sensitivity))
            else
                consolePerformCommand("r_fov " .. self.userData[player.weaponIndexSelected].zoomFOV)
                consolePerformCommand("m_speed " .. ((self.userData[player.weaponIndexSelected].sensitivity * self.userData[player.weaponIndexSelected].zoomSens) * (self.userData[player.weaponIndexSelected].zoomFOV/ self.userData[player.weaponIndexSelected].FOV)))
            end
        end
    elseif self.userData[player.weaponIndexSelected].zoom == false or self.userData[player.weaponIndexSelected].zoomFOV == self.userData[player.weaponIndexSelected].FOV or self.userData[0].zoomKey == "(none)" then
        if self.userData[0].zoomKey ~= nil then
            consolePerformCommand("unbind game " .. self.userData[0].zoomKey)
        end
        for i = 1, 9, 1 do
            consolePerformCommand("unbind game " .. weaponKey[i])
            consolePerformCommand("bind game " .. weaponKey[i] .. " weapon " .. i)
        end
        consolePerformCommand("ui_Nice_FovSettings_key 1")
        consolePerformCommand("ui_Nice_FovSettings_zoom 1")
        consolePerformCommand("ui_show_widget scoreboard")
    end

    -- FOV
    if self.userData[player.weaponIndexSelected].FOV ~= consoleGetVariable("r_fov") and self.userData[player.weaponIndexSelected].zoom == false  then
        consolePerformCommand("r_fov " .. self.userData[player.weaponIndexSelected].FOV)
    end
    --sensitivity
    if self.userData[player.weaponIndexSelected].sensEnabled then
        if self.userData[player.weaponIndexSelected].sensitivity  ~= consoleGetVariable("m_speed") and widgetGetConsoleVariable("zoom") ~= 14 then
            consolePerformCommand("m_speed " .. self.userData[player.weaponIndexSelected].sensitivity )
        end

        --sensitivity scale
        if self.userData[player.weaponIndexSelected].sensitivityScale  ~= 1 and self.userData[player.weaponIndexSelected].sensitivity * self.userData[player.weaponIndexSelected].sensitivityScale ~= consoleGetVariable("m_speed") and widgetGetConsoleVariable("zoom") ~= 14 then
            consolePerformCommand("m_speed " .. (self.userData[player.weaponIndexSelected].sensitivity * self.userData[player.weaponIndexSelected].sensitivityScale) )
        end

        --invert
        if self.userData[player.weaponIndexSelected].invert == nil or self.userData[player.weaponIndexSelected].invert == "nil" or self.userData[player.weaponIndexSelected].invert == 0 or self.userData[player.weaponIndexSelected].invert == "0" or self.userData[player.weaponIndexSelected].invert == false or self.userData[player.weaponIndexSelected].invert == "false" then
            invert = 0
        else
            invert = 1
        end
        if invert ~= consoleGetVariable("m_invert") then
            consolePerformCommand("m_invert " .. invert)
        end

        if self.userData[player.weaponIndexSelected].advancedSens == nil or self.userData[player.weaponIndexSelected].advancedSens == "nil" or self.userData[player.weaponIndexSelected].advancedSens == 0 or self.userData[player.weaponIndexSelected].advancedSens == "0" or self.userData[player.weaponIndexSelected].advancedSens == false or self.userData[player.weaponIndexSelected].advancedSens == "false" then
            advancedSens = 0
        else
            advancedSens = 1
        end
        if advancedSens ~= consoleGetVariable("m_advanced") then
            consolePerformCommand("m_advanced " .. advancedSens)
        end

        --advanced sensitivity
        if advancedSens == 1 then
            --advanced acceleration
            if self.userData[player.weaponIndexSelected].advancedAcceleration ~= consoleGetVariable("m_advanced_acceleration") then
                consolePerformCommand("m_advanced_acceleration " .. self.userData[player.weaponIndexSelected].advancedAcceleration)
            end

            --advanced cap
            if self.userData[player.weaponIndexSelected].advancedSensCap ~= consoleGetVariable("m_advanced_sensitivity_cap") then
                consolePerformCommand("m_advanced_sensitivity_cap " .. self.userData[player.weaponIndexSelected].advancedSensCap)
            end

            --advanced offset
            if self.userData[player.weaponIndexSelected].advancedOffset ~= consoleGetVariable("m_advanced_offset") then
                consolePerformCommand("m_advanced_offset " .. self.userData[player.weaponIndexSelected].advancedOffset)
            end

            --advanced power
            if self.userData[player.weaponIndexSelected].advancedPower ~= consoleGetVariable("m_advanced_power") then
                consolePerformCommand("m_advanced_power " .. self.userData[player.weaponIndexSelected].advancedPower)
            end

            --advanced postscale X
            if self.userData[player.weaponIndexSelected].advancedPostscaleX ~= consoleGetVariable("m_advanced_postscale_x") then
                consolePerformCommand("m_advanced_postscale_x " .. self.userData[player.weaponIndexSelected].advancedPostscaleX)
            end

            --advanced postscale Y
            if self.userData[player.weaponIndexSelected].advancedPostscaleY ~= consoleGetVariable("m_advanced_postscale_y") then
                consolePerformCommand("m_advanced_postscale_y " .. self.userData[player.weaponIndexSelected].advancedPostscaleY)
            end

            --advanced angle
            if self.userData[player.weaponIndexSelected].advancedAngle ~= consoleGetVariable("m_advanced_angle") then
                consolePerformCommand("m_advanced_angle " .. self.userData[player.weaponIndexSelected].advancedAngle)
            end
        end
    else
        if self.userData[0].sensitivity  ~= consoleGetVariable("m_speed") and widgetGetConsoleVariable("zoom") ~= 14 then
            consolePerformCommand("m_speed " .. self.userData[0].sensitivity )
        end

        --sensitivity scale
        if self.userData[0].sensitivityScale  ~= 1 and self.userData[0].sensitivity * self.userData[0].sensitivityScale ~= consoleGetVariable("m_speed") and widgetGetConsoleVariable("zoom") ~= 14 then
            consolePerformCommand("m_speed " .. (self.userData[0].sensitivity * self.userData[0].sensitivityScale) )
        end

        --invert
        if self.userData[0].invert == nil or self.userData[0].invert == "nil" or self.userData[0].invert == 0 or self.userData[0].invert == "0" or self.userData[0].invert == false or self.userData[0].invert == "false" then
            invert = 0
        else
            invert = 1
        end
        if invert ~= consoleGetVariable("m_invert") then
            consolePerformCommand("m_invert " .. invert)
        end

        if self.userData[0].advancedSens == nil or self.userData[0].advancedSens == "nil" or self.userData[0].advancedSens == 0 or self.userData[0].advancedSens == "0" or self.userData[0].advancedSens == false or self.userData[0].advancedSens == "false" then
            advancedSens = 0
        else
            advancedSens = 1
        end
        if advancedSens ~= consoleGetVariable("m_advanced") then
            consolePerformCommand("m_advanced " .. advancedSens)
        end

        --advanced sensitivity
        if advancedSens == 1 then
            --advanced acceleration
            if self.userData[0].advancedAcceleration ~= consoleGetVariable("m_advanced_acceleration") then
                consolePerformCommand("m_advanced_acceleration " .. self.userData[0].advancedAcceleration)
            end

            --advanced cap
            if self.userData[0].advancedSensCap ~= consoleGetVariable("m_advanced_sensitivity_cap") then
                consolePerformCommand("m_advanced_sensitivity_cap " .. self.userData[0].advancedSensCap)
            end

            --advanced offset
            if self.userData[0].advancedOffset ~= consoleGetVariable("m_advanced_offset") then
                consolePerformCommand("m_advanced_offset " .. self.userData[0].advancedOffset)
            end

            --advanced power
            if self.userData[0].advancedPower ~= consoleGetVariable("m_advanced_power") then
                consolePerformCommand("m_advanced_power " .. self.userData[0].advancedPower)
            end

            --advanced postscale X
            if self.userData[0].advancedPostscaleX ~= consoleGetVariable("m_advanced_postscale_x") then
                consolePerformCommand("m_advanced_postscale_x " .. self.userData[0].advancedPostscaleX)
            end

            --advanced postscale Y
            if self.userData[0].advancedPostscaleY ~= consoleGetVariable("m_advanced_postscale_y") then
                consolePerformCommand("m_advanced_postscale_y " .. self.userData[0].advancedPostscaleY)
            end

            --advanced angle
            if self.userData[0].advancedAngle ~= consoleGetVariable("m_advanced_angle") then
                consolePerformCommand("m_advanced_angle " .. self.userData[0].advancedAngle)
            end
        end
    end
end
