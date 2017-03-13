require "base/internal/ui/reflexcore"

Nice_WeaponSettings_Mgli = { canPosition = false, index = 0 }
registerWidget("Nice_WeaponSettings_Mgli")

    local editC = true
    local editS = false
    local editC2 = true
    local editS2 = false

function Nice_WeaponSettings_Mgli:initialize()
    self.userData = loadUserData()
    settings = {
        [0] = { dc = 1, bob = nil; rotation = nil; kickback = nil; showGun = nil; gunX = nil; gunY = nil; gunZ = nil; damage = nil, type = nil; size = nil; red = nil; green = nil; blue = nil, sred = nil; sgreen = nil; sblue = nil, health = nil; weight = nil, strokeWeight = nil, color = nil; scolor = nil; };
        [1] = { bob = consoleGetVariable("cl_weapon_bob"); rotation = consoleGetVariable("cl_weapon_rotation"); kickback = consoleGetVariable("cl_weapon_kickback"); showGun = consoleGetVariable("cl_show_gun"); gunX = consoleGetVariable("cl_weapon_offset_x"); gunY = consoleGetVariable("cl_weapon_offset_y"); gunZ = consoleGetVariable("cl_weapon_offset_z"); type = mgli_crosshairs.userData.crosshairGap; size = Crosshairs.userData.crosshairSize; color = Color(255, 255, 255, 255); red = mgli_crosshairs.userData.fill.r; green = mgli_crosshairs.userData.fill.g; blue = mgli_crosshairs.userData.fill.b, scolor = Color(255, 255, 255, 255); sred = mgli_crosshairs.userData.stroke.r; sgreen = mgli_crosshairs.userData.stroke.g; sblue = mgli_crosshairs.userData.stroke.b; health = mgli_crosshairs.userData.dot; weight = Crosshairs.userData.crosshairWeight, strokeWeight = Crosshairs.userData.crosshairStrokeWeight, type2 = mgli_crosshairs.userData.crosshairGap; size2 = Crosshairs.userData.crosshairSize; color2 = Color(255, 255, 255, 255); scolor2 = Color(255, 255, 255, 255); red2 = mgli_crosshairs.userData.fill.r; green2 = mgli_crosshairs.userData.fill.g; blue2 = mgli_crosshairs.userData.fill.b, sred2 = mgli_crosshairs.userData.stroke.r; sgreen2 = mgli_crosshairs.userData.stroke.g; sblue2 = mgli_crosshairs.userData.stroke.b; health2 = Crosshairs.userData.colorFillByHealth; weight2 = Crosshairs.userData.crosshairWeight, strokeWeight2 = Crosshairs.userData.crosshairStrokeWeight, stroke2 = Crosshairs.userData.colorStrokeByHealth; damage = consoleGetVariable("cl_text_time"); viewEnabled = false; mix = false};
        [2] = { bob = consoleGetVariable("cl_weapon_bob"); rotation = consoleGetVariable("cl_weapon_rotation"); kickback = consoleGetVariable("cl_weapon_kickback"); showGun = consoleGetVariable("cl_show_gun"); gunX = consoleGetVariable("cl_weapon_offset_x"); gunY = consoleGetVariable("cl_weapon_offset_y"); gunZ = consoleGetVariable("cl_weapon_offset_z"); type = mgli_crosshairs.userData.crosshairGap; size = Crosshairs.userData.crosshairSize; color = Color(255, 255, 255, 255); red = mgli_crosshairs.userData.fill.r; green = mgli_crosshairs.userData.fill.g; blue = mgli_crosshairs.userData.fill.b, scolor = Color(255, 255, 255, 255); sred = mgli_crosshairs.userData.stroke.r; sgreen = mgli_crosshairs.userData.stroke.g; sblue = mgli_crosshairs.userData.stroke.b; health = mgli_crosshairs.userData.dot; weight = Crosshairs.userData.crosshairWeight, strokeWeight = Crosshairs.userData.crosshairStrokeWeight, type2 = mgli_crosshairs.userData.crosshairGap; size2 = Crosshairs.userData.crosshairSize; color2 = Color(255, 255, 255, 255); scolor2 = Color(255, 255, 255, 255); red2 = mgli_crosshairs.userData.fill.r; green2 = mgli_crosshairs.userData.fill.g; blue2 = mgli_crosshairs.userData.fill.b, sred2 = mgli_crosshairs.userData.stroke.r; sgreen2 = mgli_crosshairs.userData.stroke.g; sblue2 = mgli_crosshairs.userData.stroke.b; health2 = Crosshairs.userData.colorFillByHealth; weight2 = Crosshairs.userData.crosshairWeight, strokeWeight2 = Crosshairs.userData.crosshairStrokeWeight, stroke2 = Crosshairs.userData.colorStrokeByHealth; damage = consoleGetVariable("cl_text_time"); viewEnabled = false; mix = false};
        [3] = { bob = consoleGetVariable("cl_weapon_bob"); rotation = consoleGetVariable("cl_weapon_rotation"); kickback = consoleGetVariable("cl_weapon_kickback"); showGun = consoleGetVariable("cl_show_gun"); gunX = consoleGetVariable("cl_weapon_offset_x"); gunY = consoleGetVariable("cl_weapon_offset_y"); gunZ = consoleGetVariable("cl_weapon_offset_z"); type = mgli_crosshairs.userData.crosshairGap; size = Crosshairs.userData.crosshairSize; color = Color(255, 255, 255, 255); red = mgli_crosshairs.userData.fill.r; green = mgli_crosshairs.userData.fill.g; blue = mgli_crosshairs.userData.fill.b, scolor = Color(255, 255, 255, 255); sred = mgli_crosshairs.userData.stroke.r; sgreen = mgli_crosshairs.userData.stroke.g; sblue = mgli_crosshairs.userData.stroke.b; health = mgli_crosshairs.userData.dot; weight = Crosshairs.userData.crosshairWeight, strokeWeight = Crosshairs.userData.crosshairStrokeWeight, type2 = mgli_crosshairs.userData.crosshairGap; size2 = Crosshairs.userData.crosshairSize; color2 = Color(255, 255, 255, 255); scolor2 = Color(255, 255, 255, 255); red2 = mgli_crosshairs.userData.fill.r; green2 = mgli_crosshairs.userData.fill.g; blue2 = mgli_crosshairs.userData.fill.b, sred2 = mgli_crosshairs.userData.stroke.r; sgreen2 = mgli_crosshairs.userData.stroke.g; sblue2 = mgli_crosshairs.userData.stroke.b; health2 = Crosshairs.userData.colorFillByHealth; weight2 = Crosshairs.userData.crosshairWeight, strokeWeight2 = Crosshairs.userData.crosshairStrokeWeight, stroke2 = Crosshairs.userData.colorStrokeByHealth; damage = consoleGetVariable("cl_text_time"); viewEnabled = false; mix = false};
        [4] = { bob = consoleGetVariable("cl_weapon_bob"); rotation = consoleGetVariable("cl_weapon_rotation"); kickback = consoleGetVariable("cl_weapon_kickback"); showGun = consoleGetVariable("cl_show_gun"); gunX = consoleGetVariable("cl_weapon_offset_x"); gunY = consoleGetVariable("cl_weapon_offset_y"); gunZ = consoleGetVariable("cl_weapon_offset_z"); type = mgli_crosshairs.userData.crosshairGap; size = Crosshairs.userData.crosshairSize; color = Color(255, 255, 255, 255); red = mgli_crosshairs.userData.fill.r; green = mgli_crosshairs.userData.fill.g; blue = mgli_crosshairs.userData.fill.b, scolor = Color(255, 255, 255, 255); sred = mgli_crosshairs.userData.stroke.r; sgreen = mgli_crosshairs.userData.stroke.g; sblue = mgli_crosshairs.userData.stroke.b; health = mgli_crosshairs.userData.dot; weight = Crosshairs.userData.crosshairWeight, strokeWeight = Crosshairs.userData.crosshairStrokeWeight, type2 = mgli_crosshairs.userData.crosshairGap; size2 = Crosshairs.userData.crosshairSize; color2 = Color(255, 255, 255, 255); scolor2 = Color(255, 255, 255, 255); red2 = mgli_crosshairs.userData.fill.r; green2 = mgli_crosshairs.userData.fill.g; blue2 = mgli_crosshairs.userData.fill.b, sred2 = mgli_crosshairs.userData.stroke.r; sgreen2 = mgli_crosshairs.userData.stroke.g; sblue2 = mgli_crosshairs.userData.stroke.b; health2 = Crosshairs.userData.colorFillByHealth; weight2 = Crosshairs.userData.crosshairWeight, strokeWeight2 = Crosshairs.userData.crosshairStrokeWeight, stroke2 = Crosshairs.userData.colorStrokeByHealth; damage = consoleGetVariable("cl_text_time"); viewEnabled = false; mix = false};
        [5] = { bob = consoleGetVariable("cl_weapon_bob"); rotation = consoleGetVariable("cl_weapon_rotation"); kickback = consoleGetVariable("cl_weapon_kickback"); showGun = consoleGetVariable("cl_show_gun"); gunX = consoleGetVariable("cl_weapon_offset_x"); gunY = consoleGetVariable("cl_weapon_offset_y"); gunZ = consoleGetVariable("cl_weapon_offset_z"); type = mgli_crosshairs.userData.crosshairGap; size = Crosshairs.userData.crosshairSize; color = Color(255, 255, 255, 255); red = mgli_crosshairs.userData.fill.r; green = mgli_crosshairs.userData.fill.g; blue = mgli_crosshairs.userData.fill.b, scolor = Color(255, 255, 255, 255); sred = mgli_crosshairs.userData.stroke.r; sgreen = mgli_crosshairs.userData.stroke.g; sblue = mgli_crosshairs.userData.stroke.b; health = mgli_crosshairs.userData.dot; weight = Crosshairs.userData.crosshairWeight, strokeWeight = Crosshairs.userData.crosshairStrokeWeight, type2 = mgli_crosshairs.userData.crosshairGap; size2 = Crosshairs.userData.crosshairSize; color2 = Color(255, 255, 255, 255); scolor2 = Color(255, 255, 255, 255); red2 = mgli_crosshairs.userData.fill.r; green2 = mgli_crosshairs.userData.fill.g; blue2 = mgli_crosshairs.userData.fill.b, sred2 = mgli_crosshairs.userData.stroke.r; sgreen2 = mgli_crosshairs.userData.stroke.g; sblue2 = mgli_crosshairs.userData.stroke.b; health2 = Crosshairs.userData.colorFillByHealth; weight2 = Crosshairs.userData.crosshairWeight, strokeWeight2 = Crosshairs.userData.crosshairStrokeWeight, stroke2 = Crosshairs.userData.colorStrokeByHealth; damage = consoleGetVariable("cl_text_time"); viewEnabled = false; mix = false};
        [6] = { bob = consoleGetVariable("cl_weapon_bob"); rotation = consoleGetVariable("cl_weapon_rotation"); kickback = consoleGetVariable("cl_weapon_kickback"); showGun = consoleGetVariable("cl_show_gun"); gunX = consoleGetVariable("cl_weapon_offset_x"); gunY = consoleGetVariable("cl_weapon_offset_y"); gunZ = consoleGetVariable("cl_weapon_offset_z"); type = mgli_crosshairs.userData.crosshairGap; size = Crosshairs.userData.crosshairSize; color = Color(255, 255, 255, 255); red = mgli_crosshairs.userData.fill.r; green = mgli_crosshairs.userData.fill.g; blue = mgli_crosshairs.userData.fill.b, scolor = Color(255, 255, 255, 255); sred = mgli_crosshairs.userData.stroke.r; sgreen = mgli_crosshairs.userData.stroke.g; sblue = mgli_crosshairs.userData.stroke.b; health = mgli_crosshairs.userData.dot; weight = Crosshairs.userData.crosshairWeight, strokeWeight = Crosshairs.userData.crosshairStrokeWeight, type2 = mgli_crosshairs.userData.crosshairGap; size2 = Crosshairs.userData.crosshairSize; color2 = Color(255, 255, 255, 255); scolor2 = Color(255, 255, 255, 255); red2 = mgli_crosshairs.userData.fill.r; green2 = mgli_crosshairs.userData.fill.g; blue2 = mgli_crosshairs.userData.fill.b, sred2 = mgli_crosshairs.userData.stroke.r; sgreen2 = mgli_crosshairs.userData.stroke.g; sblue2 = mgli_crosshairs.userData.stroke.b; health2 = Crosshairs.userData.colorFillByHealth; weight2 = Crosshairs.userData.crosshairWeight, strokeWeight2 = Crosshairs.userData.crosshairStrokeWeight, stroke2 = Crosshairs.userData.colorStrokeByHealth; damage = consoleGetVariable("cl_text_time"); viewEnabled = false; mix = false};
        [7] = { bob = consoleGetVariable("cl_weapon_bob"); rotation = consoleGetVariable("cl_weapon_rotation"); kickback = consoleGetVariable("cl_weapon_kickback"); showGun = consoleGetVariable("cl_show_gun"); gunX = consoleGetVariable("cl_weapon_offset_x"); gunY = consoleGetVariable("cl_weapon_offset_y"); gunZ = consoleGetVariable("cl_weapon_offset_z"); type = mgli_crosshairs.userData.crosshairGap; size = Crosshairs.userData.crosshairSize; color = Color(255, 255, 255, 255); red = mgli_crosshairs.userData.fill.r; green = mgli_crosshairs.userData.fill.g; blue = mgli_crosshairs.userData.fill.b, scolor = Color(255, 255, 255, 255); sred = mgli_crosshairs.userData.stroke.r; sgreen = mgli_crosshairs.userData.stroke.g; sblue = mgli_crosshairs.userData.stroke.b; health = mgli_crosshairs.userData.dot; weight = Crosshairs.userData.crosshairWeight, strokeWeight = Crosshairs.userData.crosshairStrokeWeight, type2 = mgli_crosshairs.userData.crosshairGap; size2 = Crosshairs.userData.crosshairSize; color2 = Color(255, 255, 255, 255); scolor2 = Color(255, 255, 255, 255); red2 = mgli_crosshairs.userData.fill.r; green2 = mgli_crosshairs.userData.fill.g; blue2 = mgli_crosshairs.userData.fill.b, sred2 = mgli_crosshairs.userData.stroke.r; sgreen2 = mgli_crosshairs.userData.stroke.g; sblue2 = mgli_crosshairs.userData.stroke.b; health2 = Crosshairs.userData.colorFillByHealth; weight2 = Crosshairs.userData.crosshairWeight, strokeWeight2 = Crosshairs.userData.crosshairStrokeWeight, stroke2 = Crosshairs.userData.colorStrokeByHealth; damage = consoleGetVariable("cl_text_time"); viewEnabled = false; mix = false};
        [8] = { bob = consoleGetVariable("cl_weapon_bob"); rotation = consoleGetVariable("cl_weapon_rotation"); kickback = consoleGetVariable("cl_weapon_kickback"); showGun = consoleGetVariable("cl_show_gun"); gunX = consoleGetVariable("cl_weapon_offset_x"); gunY = consoleGetVariable("cl_weapon_offset_y"); gunZ = consoleGetVariable("cl_weapon_offset_z"); type = mgli_crosshairs.userData.crosshairGap; size = Crosshairs.userData.crosshairSize; color = Color(255, 255, 255, 255); red = mgli_crosshairs.userData.fill.r; green = mgli_crosshairs.userData.fill.g; blue = mgli_crosshairs.userData.fill.b, scolor = Color(255, 255, 255, 255); sred = mgli_crosshairs.userData.stroke.r; sgreen = mgli_crosshairs.userData.stroke.g; sblue = mgli_crosshairs.userData.stroke.b; health = mgli_crosshairs.userData.dot; weight = Crosshairs.userData.crosshairWeight, strokeWeight = Crosshairs.userData.crosshairStrokeWeight, type2 = mgli_crosshairs.userData.crosshairGap; size2 = Crosshairs.userData.crosshairSize; color2 = Color(255, 255, 255, 255); scolor2 = Color(255, 255, 255, 255); red2 = mgli_crosshairs.userData.fill.r; green2 = mgli_crosshairs.userData.fill.g; blue2 = mgli_crosshairs.userData.fill.b, sred2 = mgli_crosshairs.userData.stroke.r; sgreen2 = mgli_crosshairs.userData.stroke.g; sblue2 = mgli_crosshairs.userData.stroke.b; health2 = Crosshairs.userData.colorFillByHealth; weight2 = Crosshairs.userData.crosshairWeight, strokeWeight2 = Crosshairs.userData.crosshairStrokeWeight, stroke2 = Crosshairs.userData.colorStrokeByHealth; damage = consoleGetVariable("cl_text_time"); viewEnabled = false; mix = false};
        [9] = { bob = consoleGetVariable("cl_weapon_bob"); rotation = consoleGetVariable("cl_weapon_rotation"); kickback = consoleGetVariable("cl_weapon_kickback"); showGun = consoleGetVariable("cl_show_gun"); gunX = consoleGetVariable("cl_weapon_offset_x"); gunY = consoleGetVariable("cl_weapon_offset_y"); gunZ = consoleGetVariable("cl_weapon_offset_z"); type = mgli_crosshairs.userData.crosshairGap; size = Crosshairs.userData.crosshairSize; color = Color(255, 255, 255, 255); red = mgli_crosshairs.userData.fill.r; green = mgli_crosshairs.userData.fill.g; blue = mgli_crosshairs.userData.fill.b, scolor = Color(255, 255, 255, 255); sred = mgli_crosshairs.userData.stroke.r; sgreen = mgli_crosshairs.userData.stroke.g; sblue = mgli_crosshairs.userData.stroke.b; health = mgli_crosshairs.userData.dot; weight = Crosshairs.userData.crosshairWeight, strokeWeight = Crosshairs.userData.crosshairStrokeWeight, type2 = mgli_crosshairs.userData.crosshairGap; size2 = Crosshairs.userData.crosshairSize; color2 = Color(255, 255, 255, 255); scolor2 = Color(255, 255, 255, 255); red2 = mgli_crosshairs.userData.fill.r; green2 = mgli_crosshairs.userData.fill.g; blue2 = mgli_crosshairs.userData.fill.b, sred2 = mgli_crosshairs.userData.stroke.r; sgreen2 = mgli_crosshairs.userData.stroke.g; sblue2 = mgli_crosshairs.userData.stroke.b; health2 = Crosshairs.userData.colorFillByHealth; weight2 = Crosshairs.userData.crosshairWeight, strokeWeight2 = Crosshairs.userData.crosshairStrokeWeight, stroke2 = Crosshairs.userData.colorStrokeByHealth; damage = consoleGetVariable("cl_text_time"); viewEnabled = false; mix = false}
    } 
    CheckSetDefaultValue(self, "userData", "table", settings)

    local weaponNames = { "Melee", "Burst gun", "Shotgun", "Grenade launcher", "Plasma gun", "Rocket launcher", "Ion cannon", "Bolt rifle", "Stake gun" }
    local editViewModelIndex = { false, false, false, false, false, false, false, false, false }
    local editCrosshairIndex = { false, false, false, false, false, false, false, false, false }
    
    function defaultCrosshair(weaponIndex)
        if self.userData[0].type == nil then
             self.userData[0].type = mgli_crosshairs.userData.crosshairGap
             self.userData[0].size = mgli_crosshairs.userData.crosshairSize
             self.userData[0].red = mgli_crosshairs.userData.fill.r
             self.userData[0].green = mgli_crosshairs.userData.fill.g
             self.userData[0].blue = mgli_crosshairs.userData.fill.b
             self.userData[0].health = mgli_crosshairs.userData.dot
             self.userData[0].weight = mgli_crosshairs.userData.crosshairWeight
             self.userData[0].strokeWeight = mgli_crosshairs.userData.crosshairStrokeWeight
             self.userData[0].color = Color(self.userData[0].red, self.userData[0].green, self.userData[0].blue, 255)
             self.userData[0].scolor = Color(self.userData[0].sred, self.userData[0].sgreen, self.userData[0].sblue, 255)
        end
        if self.userData[weaponIndex].type == nil then
             self.userData[weaponIndex].type = self.userData[0].type
             self.userData[weaponIndex].size = self.userData[0].size
             self.userData[weaponIndex].red = self.userData[0].red
             self.userData[weaponIndex].green = self.userData[0].green
             self.userData[weaponIndex].blue = self.userData[0].blue
             self.userData[weaponIndex].sred = self.userData[0].sred
             self.userData[weaponIndex].sgreen = self.userData[0].sgreen
             self.userData[weaponIndex].sblue = self.userData[0].sblue
             self.userData[weaponIndex].health = self.userData[0].health
             self.userData[weaponIndex].weight = self.userData[0].weight
             self.userData[weaponIndex].strokeWeight = self.userData[0].strokeWeight
             self.userData[weaponIndex].color = self.userData[0].color
             self.userData[weaponIndex].scolor = self.userData[0].scolor
             self.userData[weaponIndex].type2 = self.userData[0].type
             self.userData[weaponIndex].size2 = self.userData[0].size
             self.userData[weaponIndex].red2 = self.userData[0].red
             self.userData[weaponIndex].green2 = self.userData[0].green
             self.userData[weaponIndex].blue2 = self.userData[0].blue
             self.userData[weaponIndex].sred2 = self.userData[0].sred
             self.userData[weaponIndex].sgreen2 = self.userData[0].sgreen
             self.userData[weaponIndex].sblue2 = self.userData[0].sblue
             self.userData[weaponIndex].health2 = self.userData[0].health
             self.userData[weaponIndex].weight2 = self.userData[0].weight
             self.userData[weaponIndex].strokeWeight2 = self.userData[0].strokeWeight
             self.userData[weaponIndex].color2 = self.userData[0].color
             self.userData[weaponIndex].scolor2 = self.userData[0].scolor
        end
        if self.userData[weaponIndex].red == nil or self.userData[weaponIndex].green == nil or self.userData[weaponIndex].blue == nil or self.userData[weaponIndex].color == nil then
            self.userData[weaponIndex].red = mgli_crosshairs.userData.fill.r
            self.userData[weaponIndex].green = mgli_crosshairs.userData.fill.g
            self.userData[weaponIndex].blue = mgli_crosshairs.userData.fill.b
            self.userData[weaponIndex].color = Color(self.userData[weaponIndex].red, self.userData[weaponIndex].green, self.userData[weaponIndex].blue, 255)
            self.userData[weaponIndex].red2 = mgli_crosshairs.userData.fill.r
            self.userData[weaponIndex].green2 = mgli_crosshairs.userData.fill.g
            self.userData[weaponIndex].blue2 = mgli_crosshairs.userData.fill.r
            self.userData[weaponIndex].color2 = Color(self.userData[weaponIndex].red, self.userData[weaponIndex].green, self.userData[weaponIndex].blue, 255)
        end
        if self.userData[weaponIndex].sred == nil or self.userData[weaponIndex].sgreen == nil or self.userData[weaponIndex].sblue == nil or self.userData[weaponIndex].scolor == nil then
            self.userData[weaponIndex].sred = mgli_crosshairs.userData.stroke.r
            self.userData[weaponIndex].sgreen = mgli_crosshairs.userData.stroke.g
            self.userData[weaponIndex].sblue = mgli_crosshairs.userData.stroke.b
            self.userData[weaponIndex].scolor = Color(self.userData[weaponIndex].sred, self.userData[weaponIndex].sgreen, self.userData[weaponIndex].sblue, 255)
            self.userData[weaponIndex].sred2 = mgli_crosshairs.userData.stroke.r
            self.userData[weaponIndex].sgreen2 = mgli_crosshairs.userData.stroke.g
            self.userData[weaponIndex].sblue2 = mgli_crosshairs.userData.stroke.b
            self.userData[weaponIndex].scolor2 = Color(self.userData[weaponIndex].sred, self.userData[weaponIndex].sgreen, self.userData[weaponIndex].sblue, 255)
        end
    end

    function defaultViewModel(weaponIndex)
        if self.userData[0].bob == nil then
            self.userData[0].bob = consoleGetVariable("cl_weapon_bob"); 
            self.userData[0].rotation = consoleGetVariable("cl_weapon_rotation"); 
            self.userData[0].kickback = consoleGetVariable("cl_weapon_kickback"); 
            self.userData[0].showGun = consoleGetVariable("cl_show_gun"); 
            self.userData[0].gunX = consoleGetVariable("cl_weapon_offset_x"); 
            self.userData[0].gunY = consoleGetVariable("cl_weapon_offset_y"); 
            self.userData[0].gunZ = consoleGetVariable("cl_weapon_offset_z")
            for i = 1, 9 do
                self.userData[i].bob = self.userData[0].bob
                self.userData[i].rotation = self.userData[0].rotation
                self.userData[i].kickback = self.userData[0].kickback
                self.userData[i].showGun = self.userData[0].showGun
                self.userData[i].gunX = self.userData[0].gunX
                self.userData[i].gunY = self.userData[0].gunY
                self.userData[i].gunZ = self.userData[0].gunZ
            end
        end
    end

    function newDefaultCrosshair(weaponIndex)
        if self.userData[0].type ~= nil and self.userData[weaponIndex].type ~= nil then
            for i = 1, 9 do
                if self.userData[i].type == self.userData[0].type and
                       self.userData[i].size == self.userData[0].size and
                       self.userData[i].weight == self.userData[0].weight and
                       self.userData[i].strokeWeight == self.userData[0].strokeWeight and
                       (self.userData[i].health == self.userData[0].health or
                       (self.userData[i].red == self.userData[0].red and
                       self.userData[i].green == self.userData[0].green and
                       self.userData[i].blue == self.userData[0].blue)) 
                       then
                    self.userData[i].type = self.userData[weaponIndex].type
                    self.userData[i].size = self.userData[weaponIndex].size
                    self.userData[i].red = self.userData[weaponIndex].red
                    self.userData[i].green = self.userData[weaponIndex].green
                    self.userData[i].blue = self.userData[weaponIndex].blue
                    self.userData[i].health = self.userData[weaponIndex].health
                    self.userData[i].weight = self.userData[weaponIndex].weight
                    self.userData[i].strokeWeight = self.userData[weaponIndex].strokeWeight
                    self.userData[i].color = self.userData[weaponIndex].color
                    self.userData[i].scolor = self.userData[weaponIndex].scolor
                    self.userData[i].type2 = self.userData[weaponIndex].type
                    self.userData[i].size2 = self.userData[weaponIndex].size
                    self.userData[i].red2 = self.userData[weaponIndex].red
                    self.userData[i].green2 = self.userData[weaponIndex].green
                    self.userData[i].blue2 = self.userData[weaponIndex].blue
                    self.userData[i].health2 = self.userData[weaponIndex].health
                    self.userData[i].weight2 = self.userData[weaponIndex].weight
                    self.userData[i].strokeWeight2 = self.userData[weaponIndex].strokeWeight
                    self.userData[i].color2 = self.userData[weaponIndex].color
                    self.userData[i].scolor2 = self.userData[weaponIndex].scolor
                end
            end
            self.userData[0].type = self.userData[weaponIndex].type
            self.userData[0].size = self.userData[weaponIndex].size
            self.userData[0].red = self.userData[weaponIndex].red
            self.userData[0].green = self.userData[weaponIndex].green
            self.userData[0].blue = self.userData[weaponIndex].blue
            self.userData[0].health = self.userData[weaponIndex].health
            self.userData[0].weight = self.userData[weaponIndex].weight
            self.userData[0].strokeWeight = self.userData[weaponIndex].strokeWeight
            self.userData[0].color = Color(
                                       self.userData[weaponIndex].red, 
                                       self.userData[weaponIndex].green, 
                                       self.userData[weaponIndex].blue, 255)
            self.userData[0].scolor = Color(
                                       self.userData[weaponIndex].sred, 
                                       self.userData[weaponIndex].sgreen, 
                                       self.userData[weaponIndex].sblue, 255)
        end        
    end

    function newDefaultViewModel(weaponIndex)
        if self.userData[0].bob ~= nil and self.userData[weaponIndex].bob ~= nil then
            for i = 1, 9 do
                if self.userData[i].bob == self.userData[0].bob and
                   self.userData[i].rotation == self.userData[0].rotation and
                   self.userData[i].kickback == self.userData[0].kickback and
                   self.userData[i].showGun == self.userData[0].showGun and
                   self.userData[i].gunX == self.userData[0].gunX and
                   self.userData[i].gunY == self.userData[0].gunY and
                   self.userData[i].gunZ == self.userData[0].gunZ then
                        self.userData[i].bob = self.userData[weaponIndex].bob
                        self.userData[i].rotation = self.userData[weaponIndex].rotation
                        self.userData[i].kickback = self.userData[weaponIndex].kickback
                        self.userData[i].showGun = self.userData[weaponIndex].showGun
                        self.userData[i].gunX = self.userData[weaponIndex].gunX
                        self.userData[i].gunY = self.userData[weaponIndex].gunY
                        self.userData[i].gunZ = self.userData[weaponIndex].gunZ
                end
            end
            self.userData[0].bob = self.userData[weaponIndex].bob
            self.userData[0].rotation = self.userData[weaponIndex].rotation
            self.userData[0].kickback = self.userData[weaponIndex].kickback
            self.userData[0].showGun = self.userData[weaponIndex].showGun
            self.userData[0].gunX = self.userData[weaponIndex].gunX
            self.userData[0].gunY = self.userData[weaponIndex].gunY
            self.userData[0].gunZ = self.userData[weaponIndex].gunZ
        end
    end
    
    function editViewModel(weaponIndex, x, y)
        local width = 500
        local height = 230
        local btnWidth = 60
        local spacing = 100
        x = x + 145
        uiWindow("Edit view model for " .. weaponNames[weaponIndex], x, y + 40, width, height)
        y = y + 80
        uiLabel("Change", x + 10, y)
        defaultViewModel(weaponIndex)
        self.userData[weaponIndex].viewEnabled = ui2RowCheckbox(x + 10, y + 30, 20, "", self.userData[weaponIndex].viewEnabled)
        if self.userData[weaponIndex].viewEnabled then
            spacing = spacing + 10
            uiLabel("X", x + spacing, y)
            spacing = spacing + spacing
            uiLabel("Y", x + spacing, y)
            spacing = spacing + 100
            uiLabel("Z", x + spacing, y)
            spacing = spacing + 90
            uiLabel("Show gun", x + spacing, y)
            y = y + 30
            spacing = spacing - 300
            self.userData[weaponIndex].gunX = uiEditBox2Decimals(self.userData[weaponIndex].gunX, x + spacing, y, 60)
            spacing = spacing + 110
            self.userData[weaponIndex].gunY = uiEditBox2Decimals(self.userData[weaponIndex].gunY, x + spacing, y, 60)
            spacing = spacing + 100
            self.userData[weaponIndex].gunZ = uiEditBox2Decimals(self.userData[weaponIndex].gunZ, x + spacing, y, 60)
            spacing = spacing + 100
            self.userData[weaponIndex].showGun = ui2RowCheckbox(x + spacing, y, 00, "", self.userData[weaponIndex].showGun)
            spacing = 110
            y = y + 50
            uiLabel("Weapon bob", x + spacing, y)
            spacing = spacing + 125
            uiLabel("Rotation", x + spacing, y)
            spacing = spacing + 100
            uiLabel("Kickback", x + spacing, y)
            y = y + 30
            spacing = spacing - 200
            self.userData[weaponIndex].bob = ui2RowCheckbox(x + spacing, y, 20, "", self.userData[weaponIndex].bob)
            spacing = spacing + 100
            self.userData[weaponIndex].rotation = ui2RowCheckbox(x + spacing, y, 20, "", self.userData[weaponIndex].rotation)
            spacing = spacing + 100
            self.userData[weaponIndex].kickback = ui2RowCheckbox(x + spacing, y, 20, "", self.userData[weaponIndex].kickback)
            btnSpacing = 190  
            if (uiButton("Set as default", nil, x + 10, y + height - btnSpacing, btnWidth * 2 + 5, 35)) then
                newDefaultViewModel(weaponIndex)
            end
        else
            btnSpacing = 80
        end
        if (uiButton("Ok", nil, x + width - btnWidth - 5, y + height - btnSpacing, btnWidth, 35)) then
            editViewModelIndex[weaponIndex] = false
        end
        if (uiButton("Default", nil, x + width - 2 * btnWidth - 35, y + height - btnSpacing, btnWidth + 20, 35)) then
            if self.userData[0].bob ~= nil then
                self.userData[weaponIndex].bob = self.userData[0].bob
                self.userData[weaponIndex].rotation = self.userData[0].rotation
                self.userData[weaponIndex].kickback = self.userData[0].kickback
                self.userData[weaponIndex].showGun = self.userData[0].showGun
                self.userData[weaponIndex].gunX = self.userData[0].gunX
                self.userData[weaponIndex].gunY = self.userData[0].gunY
                self.userData[weaponIndex].gunZ = self.userData[0].gunZ
            end
        end
    end

    function editCrosshair(weaponIndex, x, y)
        local width = 790
        local height = 320
        local btnWidth = 60
        local spacing = 100
        x = x + 110
        uiWindow("Edit crosshair settings for " .. weaponNames[weaponIndex], x, y + 40, width, height)
        y = y + 80
        if self.userData[weaponIndex].mix then
            col = Color(255, 0, 0, 50)
            if self.userData[0].dc == 1 then
                uiButton("1", nil, x + width, y, btnWidth - 20, 32, Color(255, 0, 0, 50))
                if (uiButton("2", nil, x + width, y + 35, btnWidth - 20, 32)) then
                    self.userData[0].dc = 2
                end
            else
                if (uiButton("1", nil, x + width, y, btnWidth - 20, 32)) then
                    self.userData[0].dc = 1
                end
                uiButton("2", nil, x + width, y + 35, btnWidth - 20, 32, Color(255, 0, 0, 50))
            end
        else
            col = Color(255, 255, 255, 50)
            self.userData[0].dc = 1
        end
        if (uiButton("Mix", nil, x + 145, y - 80 + 43, btnWidth - 20, 32, col)) then
            if self.userData[weaponIndex].mix then
                self.userData[weaponIndex].mix = false
            else
                self.userData[weaponIndex].mix = true
            end
        end
        uiLabel("Gap", x + 10, y)
        defaultCrosshair(weaponIndex)
        m = mouseRegion(x + 5, y, 80, 65, optionalId);
        if m.mouseInside then
            if self.userData[0].dc == 1 then
                local crosshairHalfSize = 10
                local crosshairHalfWeight = self.userData[weaponIndex].weight / 2
	            local crosshairType = tonumber(self.userData[weaponIndex].type) - 2.5
                if crosshairType < 0 then
                    crosshairType = 0
                end
                local crosshairWeight = self.userData[weaponIndex].weight
                local crosshairStrokeWeight = self.userData[weaponIndex].strokeWeight
                local crosshairSize = 20
                local crosshairStrokeColor = self.userData[weaponIndex].scolor
                local crosshairFillColor = self.userData[weaponIndex].color

                for i = 1, 10 do
                    nvgBeginPath();
                    nvgRect(-crosshairHalfSize-crosshairType + i * 60 - 40, -crosshairHalfWeight + 55 - 300, crosshairHalfSize, crosshairWeight) -- left
                    nvgRect(-crosshairHalfWeight + i * 60 - 40, -crosshairHalfSize-crosshairType + 55 - 300, crosshairWeight, crosshairHalfSize) -- top
                    nvgRect(crosshairHalfSize+crosshairType + i * 60 - 40, crosshairHalfWeight + 55 - 300, -crosshairHalfSize, -crosshairWeight) -- right
                    nvgRect(crosshairHalfWeight + i * 60 - 40, crosshairHalfSize+crosshairType + 55 - 300, -crosshairWeight, -crosshairHalfSize)
	                if self.userData[weaponIndex].health then
		                 nvgRect(-crosshairWeight/2 + i * 60 - 40, -crosshairWeight/2 + 55 - 300, crosshairWeight, crosshairWeight) -- dot
		            end
                    nvgStrokeColor(crosshairStrokeColor);
                    nvgStrokeWidth(crosshairStrokeWeight);
                    nvgStroke();
                    nvgFillColor(crosshairFillColor);
                    nvgFill();
                    crosshairType = crosshairType + 0.5
                    nvgTextAlign(NVG_ALIGN_CENTER, NVG_ALIGN_BOTTOM)
                    if crosshairType == tonumber(self.userData[weaponIndex].type) then
                        nvgFillColor(Color(200, 0, 0, 255))
                    else
                        nvgFillColor(Color(180, 180, 180, 255))
                    end
                    nvgText(i * 60 - 40, 55 - 250, crosshairType)                
                end
            else
                local crosshairHalfSize = 10
                local crosshairHalfWeight = self.userData[weaponIndex].weight2 / 2
	            local crosshairType = tonumber(self.userData[weaponIndex].type2) - 2.5
                if crosshairType < 0 then
                    crosshairType = 0
                end
                local crosshairWeight = self.userData[weaponIndex].weight2
                local crosshairStrokeWeight = self.userData[weaponIndex].strokeWeight2
                local crosshairSize = 20
                local crosshairStrokeColor = self.userData[weaponIndex].scolor2
                local crosshairFillColor = self.userData[weaponIndex].color2

                for i = 1, 10 do
                    nvgBeginPath();
                    nvgRect(-crosshairHalfSize-crosshairType + i * 60 - 40, -crosshairHalfWeight + 55 - 300, crosshairHalfSize, crosshairWeight) -- left
                    nvgRect(-crosshairHalfWeight + i * 60 - 40, -crosshairHalfSize-crosshairType + 55 - 300, crosshairWeight, crosshairHalfSize) -- top
                    nvgRect(crosshairHalfSize+crosshairType + i * 60 - 40, crosshairHalfWeight + 55 - 300, -crosshairHalfSize, -crosshairWeight) -- right
                    nvgRect(crosshairHalfWeight + i * 60 - 40, crosshairHalfSize+crosshairType + 55 - 300, -crosshairWeight, -crosshairHalfSize)
	                if self.userData[weaponIndex].health then
		                 nvgRect(-crosshairWeight/2 + i * 60 - 40, -crosshairWeight/2 + 55 - 300, crosshairWeight, crosshairWeight) -- dot
		            end
                    nvgStrokeColor(crosshairStrokeColor);
                    nvgStrokeWidth(crosshairStrokeWeight);
                    nvgStroke();
                    nvgFillColor(crosshairFillColor);
                    nvgFill();
                    crosshairType = crosshairType + 0.5
                    nvgTextAlign(NVG_ALIGN_CENTER, NVG_ALIGN_BOTTOM)
                    if crosshairType == tonumber(self.userData[weaponIndex].type2) then
                        nvgFillColor(Color(200, 0, 0, 255))
                    else
                        nvgFillColor(Color(180, 180, 180, 255))
                    end
                    nvgText(i * 60 - 40, 55 - 250, crosshairType)                
                end
            end
        end
        uiLabel("Size", x + 10, y + 80)
        m = mouseRegion(x + 5, y + 80, 80, 65, optionalId);
        if m.mouseInside then
            if self.userData[0].dc == 1 then
                local crosshairHalfSize = self.userData[weaponIndex].size / 2
                local crosshairHalfWeight = self.userData[weaponIndex].weight / 2
	            local crosshairType = tonumber(self.userData[weaponIndex].type)
                local crosshairWeight = self.userData[weaponIndex].weight
                local crosshairStrokeWeight = self.userData[weaponIndex].strokeWeight
                local crosshairSize = self.userData[weaponIndex].size - 4
                if crosshairSize < 0 then
                    crosshairSize = 0
                end
                local crosshairStrokeColor = self.userData[weaponIndex].scolor
                local crosshairFillColor = self.userData[weaponIndex].color

                for i = 1, 10 do
                    nvgBeginPath();
                    nvgRect(-crosshairHalfSize-crosshairType + i * 60 - 40, -crosshairHalfWeight + 55 - 300, crosshairHalfSize, crosshairWeight) -- left
                    nvgRect(-crosshairHalfWeight + i * 60 - 40, -crosshairHalfSize-crosshairType + 55 - 300, crosshairWeight, crosshairHalfSize) -- top
                    nvgRect(crosshairHalfSize+crosshairType + i * 60 - 40, crosshairHalfWeight + 55 - 300, -crosshairHalfSize, -crosshairWeight) -- right
                    nvgRect(crosshairHalfWeight + i * 60 - 40, crosshairHalfSize+crosshairType + 55 - 300, -crosshairWeight, -crosshairHalfSize)
	                if self.userData[weaponIndex].health then
		                 nvgRect(-crosshairWeight/2 + i * 60 - 40, -crosshairWeight/2 + 55 - 300, crosshairWeight, crosshairWeight) -- dot
		            end
                    nvgStrokeColor(crosshairStrokeColor);
                    nvgStrokeWidth(crosshairStrokeWeight);
                    nvgStroke();
                    nvgFillColor(crosshairFillColor);
                    nvgFill();
                    crosshairSize = crosshairSize + 1
                    crosshairHalfSize = crosshairHalfSize + 0.5
                    nvgTextAlign(NVG_ALIGN_CENTER, NVG_ALIGN_BOTTOM)
                    if crosshairSize == tonumber(self.userData[weaponIndex].size) then
                        nvgFillColor(Color(200, 0, 0, 255))
                    else
                        nvgFillColor(Color(180, 180, 180, 255))
                    end
                    nvgText(i * 60 - 40, 55 - 250, crosshairSize)                
                end
            else
                local crosshairHalfSize = self.userData[weaponIndex].size2 / 2
                local crosshairHalfWeight = self.userData[weaponIndex].weight2 / 2
	            local crosshairType = tonumber(self.userData[weaponIndex].type2) - 2.5
                if crosshairType < 0 then
                    crosshairType = 0
                end
                local crosshairWeight = self.userData[weaponIndex].weight2
                local crosshairStrokeWeight = self.userData[weaponIndex].strokeWeight2
                local crosshairSize = self.userData[weaponIndex].size2 - 4
                if crosshairSize < 0 then
                    crosshairSize = 0
                end
                local crosshairStrokeColor = self.userData[weaponIndex].scolor2
                local crosshairFillColor = self.userData[weaponIndex].color2

                for i = 1, 10 do
                    nvgBeginPath();
                    nvgRect(-crosshairHalfSize-crosshairType + i * 60 - 40, -crosshairHalfWeight + 55 - 300, crosshairHalfSize, crosshairWeight) -- left
                    nvgRect(-crosshairHalfWeight + i * 60 - 40, -crosshairHalfSize-crosshairType + 55 - 300, crosshairWeight, crosshairHalfSize) -- top
                    nvgRect(crosshairHalfSize+crosshairType + i * 60 - 40, crosshairHalfWeight + 55 - 300, -crosshairHalfSize, -crosshairWeight) -- right
                    nvgRect(crosshairHalfWeight + i * 60 - 40, crosshairHalfSize+crosshairType + 55 - 300, -crosshairWeight, -crosshairHalfSize)
	                if self.userData[weaponIndex].health then
		                 nvgRect(-crosshairWeight/2 + i * 60 - 40, -crosshairWeight/2 + 55 - 300, crosshairWeight, crosshairWeight) -- dot
		            end
                    nvgStrokeColor(crosshairStrokeColor);
                    nvgStrokeWidth(crosshairStrokeWeight);
                    nvgStroke();
                    nvgFillColor(crosshairFillColor);
                    nvgFill();
                    crosshairSize = crosshairSize + 1
                    crosshairHalfSize = crosshairHalfSize + 0.5
                    nvgTextAlign(NVG_ALIGN_CENTER, NVG_ALIGN_BOTTOM)
                    if crosshairSize == tonumber(self.userData[weaponIndex].size2) then
                        nvgFillColor(Color(200, 0, 0, 255))
                    else
                        nvgFillColor(Color(180, 180, 180, 255))
                    end
                    nvgText(i * 60 - 40, 55 - 250, crosshairSize)               
                end
            end
        end
        uiLabel("Weight", x + 10, y + 160)
        m = mouseRegion(x + 5, y + 160, 80, 65, optionalId);
        if m.mouseInside then
            if self.userData[0].dc == 1 then
                local crosshairHalfSize = self.userData[weaponIndex].size / 2
                local crosshairHalfWeight = self.userData[weaponIndex].weight / 2 - 0.4
                if crosshairHalfWeight < 0 then
                    crosshairHalfWeight = 0
                end
	            local crosshairType = tonumber(self.userData[weaponIndex].type)
                local crosshairWeight = self.userData[weaponIndex].weight - 0.8
                if crosshairWeight < 0 then
                    crosshairWeight = 0
                end
                local crosshairStrokeWeight = self.userData[weaponIndex].strokeWeight
                local crosshairSize = self.userData[weaponIndex].size
                local crosshairStrokeColor = self.userData[weaponIndex].scolor
                local crosshairFillColor = self.userData[weaponIndex].color

                for i = 1, 10 do
                    nvgBeginPath();
                    nvgRect(-crosshairHalfSize-crosshairType + i * 60 - 40, -crosshairHalfWeight + 55 - 300, crosshairHalfSize, crosshairWeight) -- left
                    nvgRect(-crosshairHalfWeight + i * 60 - 40, -crosshairHalfSize-crosshairType + 55 - 300, crosshairWeight, crosshairHalfSize) -- top
                    nvgRect(crosshairHalfSize+crosshairType + i * 60 - 40, crosshairHalfWeight + 55 - 300, -crosshairHalfSize, -crosshairWeight) -- right
                    nvgRect(crosshairHalfWeight + i * 60 - 40, crosshairHalfSize+crosshairType + 55 - 300, -crosshairWeight, -crosshairHalfSize)
	                if self.userData[weaponIndex].health then
		                 nvgRect(-crosshairWeight/2 + i * 60 - 40, -crosshairWeight/2 + 55 - 300, crosshairWeight, crosshairWeight) -- dot
		            end
                    nvgStrokeColor(crosshairStrokeColor);
                    nvgStrokeWidth(crosshairStrokeWeight);
                    nvgStroke();
                    nvgFillColor(crosshairFillColor);
                    nvgFill();
                    crosshairWeight = crosshairWeight + 0.2
                    crosshairHalfWeight = crosshairHalfWeight + 0.1
                    nvgTextAlign(NVG_ALIGN_CENTER, NVG_ALIGN_BOTTOM)
                    if crosshairWeight == tonumber(self.userData[weaponIndex].weight) then
                        nvgFillColor(Color(200, 0, 0, 255))
                    else
                        nvgFillColor(Color(180, 180, 180, 255))
                    end
                    nvgText(i * 60 - 40, 55 - 250, crosshairWeight)                
                end
            else
                local crosshairHalfSize = self.userData[weaponIndex].size2 / 2
                local crosshairHalfWeight = self.userData[weaponIndex].weight2 / 2 - 0.4
                if crosshairHalfWeight < 0 then
                    crosshairHalfWeight = 0
                end
	            local crosshairType = tonumber(self.userData[weaponIndex].type2)
                local crosshairWeight = self.userData[weaponIndex].weight2 - 0.8
                if crosshairWeight < 0 then
                    crosshairWeight = 0
                end
                local crosshairStrokeWeight = self.userData[weaponIndex].strokeWeight2
                local crosshairSize = self.userData[weaponIndex].size2
                local crosshairStrokeColor = self.userData[weaponIndex].scolor2
                local crosshairFillColor = self.userData[weaponIndex].color2

                for i = 1, 10 do
                    nvgBeginPath();
                    nvgRect(-crosshairHalfSize-crosshairType + i * 60 - 40, -crosshairHalfWeight + 55 - 300, crosshairHalfSize, crosshairWeight) -- left
                    nvgRect(-crosshairHalfWeight + i * 60 - 40, -crosshairHalfSize-crosshairType + 55 - 300, crosshairWeight, crosshairHalfSize) -- top
                    nvgRect(crosshairHalfSize+crosshairType + i * 60 - 40, crosshairHalfWeight + 55 - 300, -crosshairHalfSize, -crosshairWeight) -- right
                    nvgRect(crosshairHalfWeight + i * 60 - 40, crosshairHalfSize+crosshairType + 55 - 300, -crosshairWeight, -crosshairHalfSize)
	                if self.userData[weaponIndex].health then
		                 nvgRect(-crosshairWeight/2 + i * 60 - 40, -crosshairWeight/2 + 55 - 300, crosshairWeight, crosshairWeight) -- dot
		            end
                    nvgStrokeColor(crosshairStrokeColor);
                    nvgStrokeWidth(crosshairStrokeWeight);
                    nvgStroke();
                    nvgFillColor(crosshairFillColor);
                    nvgFill();
                    crosshairWeight = crosshairWeight + 0.2
                    crosshairHalfWeight = crosshairHalfWeight + 0.1
                    nvgTextAlign(NVG_ALIGN_CENTER, NVG_ALIGN_BOTTOM)
                    if crosshairWeight == tonumber(self.userData[weaponIndex].weight2) then
                        nvgFillColor(Color(200, 0, 0, 255))
                    else
                        nvgFillColor(Color(180, 180, 180, 255))
                    end
                    nvgText(i * 60 - 40, 55 - 250, crosshairWeight)                
                end
            end
        end
        uiLabel("Stroke weight", x + 95, y)
        m = mouseRegion(x + 90, y, 80, 65, optionalId);
        if m.mouseInside then
            if self.userData[0].dc == 1 then
                local crosshairHalfSize = self.userData[weaponIndex].size / 2
                local crosshairHalfWeight = self.userData[weaponIndex].weight / 2
	            local crosshairType = tonumber(self.userData[weaponIndex].type)
                local crosshairWeight = self.userData[weaponIndex].weight                
                local crosshairStrokeWeight = self.userData[weaponIndex].strokeWeight - 0.8
                if crosshairStrokeWeight < 0 then
                    crosshairStrokeWeight = 0
                end
                local crosshairSize = self.userData[weaponIndex].size
                local crosshairStrokeColor = self.userData[weaponIndex].scolor
                local crosshairFillColor = self.userData[weaponIndex].color

                for i = 1, 10 do
                    nvgBeginPath();
                    nvgRect(-crosshairHalfSize-crosshairType + i * 60 - 40, -crosshairHalfWeight + 55 - 300, crosshairHalfSize, crosshairWeight) -- left
                    nvgRect(-crosshairHalfWeight + i * 60 - 40, -crosshairHalfSize-crosshairType + 55 - 300, crosshairWeight, crosshairHalfSize) -- top
                    nvgRect(crosshairHalfSize+crosshairType + i * 60 - 40, crosshairHalfWeight + 55 - 300, -crosshairHalfSize, -crosshairWeight) -- right
                    nvgRect(crosshairHalfWeight + i * 60 - 40, crosshairHalfSize+crosshairType + 55 - 300, -crosshairWeight, -crosshairHalfSize)
	                if self.userData[weaponIndex].health then
		                 nvgRect(-crosshairWeight/2 + i * 60 - 40, -crosshairWeight/2 + 55 - 300, crosshairWeight, crosshairWeight) -- dot
		            end
                    nvgStrokeColor(crosshairStrokeColor);
                    nvgStrokeWidth(crosshairStrokeWeight);
                    nvgStroke();
                    nvgFillColor(crosshairFillColor);
                    nvgFill();
                    crosshairStrokeWeight = crosshairStrokeWeight + 0.2
                    nvgTextAlign(NVG_ALIGN_CENTER, NVG_ALIGN_BOTTOM)
                    if crosshairStrokeWeight == tonumber(self.userData[weaponIndex].strokeWeight) then
                        nvgFillColor(Color(200, 0, 0, 255))
                    else
                        nvgFillColor(Color(180, 180, 180, 255))
                    end
                    nvgText(i * 60 - 40, 55 - 250, crosshairStrokeWeight)                
                end
            else
                local crosshairHalfSize = self.userData[weaponIndex].size2 / 2
                local crosshairHalfWeight = self.userData[weaponIndex].weight2 / 2
	            local crosshairType = tonumber(self.userData[weaponIndex].type2)
                local crosshairWeight = self.userData[weaponIndex].weight2                
                local crosshairStrokeWeight = self.userData[weaponIndex].strokeWeight2 - 0.8
                if crosshairStrokeWeight < 0 then
                    crosshairStrokeWeight = 0
                end
                local crosshairSize = self.userData[weaponIndex].size2
                local crosshairStrokeColor = self.userData[weaponIndex].scolor2
                local crosshairFillColor = self.userData[weaponIndex].color2

                for i = 1, 10 do
                    nvgBeginPath();
                    nvgRect(-crosshairHalfSize-crosshairType + i * 60 - 40, -crosshairHalfWeight + 55 - 300, crosshairHalfSize, crosshairWeight) -- left
                    nvgRect(-crosshairHalfWeight + i * 60 - 40, -crosshairHalfSize-crosshairType + 55 - 300, crosshairWeight, crosshairHalfSize) -- top
                    nvgRect(crosshairHalfSize+crosshairType + i * 60 - 40, crosshairHalfWeight + 55 - 300, -crosshairHalfSize, -crosshairWeight) -- right
                    nvgRect(crosshairHalfWeight + i * 60 - 40, crosshairHalfSize+crosshairType + 55 - 300, -crosshairWeight, -crosshairHalfSize)
	                if self.userData[weaponIndex].health then
		                 nvgRect(-crosshairWeight/2 + i * 60 - 40, -crosshairWeight/2 + 55 - 300, crosshairWeight, crosshairWeight) -- dot
		            end
                    nvgStrokeColor(crosshairStrokeColor);
                    nvgStrokeWidth(crosshairStrokeWeight);
                    nvgStroke();
                    nvgFillColor(crosshairFillColor);
                    nvgFill();
                    crosshairStrokeWeight = crosshairStrokeWeight + 0.2
                    nvgTextAlign(NVG_ALIGN_CENTER, NVG_ALIGN_BOTTOM)
                    if crosshairStrokeWeight == tonumber(self.userData[weaponIndex].strokeWeight2) then
                        nvgFillColor(Color(200, 0, 0, 255))
                    else
                        nvgFillColor(Color(180, 180, 180, 255))
                    end
                    nvgText(i * 60 - 40, 55 - 250, crosshairStrokeWeight)                
                end
            end
        end
        uiLabel("Crosshair dot", x + 95, y + 160)
        y = y + 30
        if self.userData[0].dc == 1 then
            self.userData[weaponIndex].type = uiEditBox(self.userData[weaponIndex].type, x + 10, y, 60)
            spacing = spacing - 490
            self.userData[weaponIndex].size = uiEditBox(self.userData[weaponIndex].size, x + 10, y + 80, 60)
            spacing = spacing + 80
            self.userData[weaponIndex].weight = uiEditBox2Decimals(self.userData[weaponIndex].weight, x + 10, y + 160, 60)
            spacing = spacing + 100
            self.userData[weaponIndex].strokeWeight = uiEditBox2Decimals(self.userData[weaponIndex].strokeWeight, x + 95, y, 60)
            spacing = spacing + 150
            spacing = spacing + 160
            self.userData[weaponIndex].health = ui2RowCheckbox(x + 85, y + 160, 20, "", self.userData[weaponIndex].health)
            y = y + 50
            spacing = 100
            btnSpacing = 160
            if (uiButton("Ok", nil, x + width - btnWidth - 5, y - btnSpacing + 43, btnWidth, 32)) then
                    editCrosshairIndex[weaponIndex] = false
                end
            if (uiButton("Default", nil, x + width - 2 * btnWidth - 35, y - btnSpacing + 43, btnWidth + 20, 32)) then
                self.userData[weaponIndex].type = self.userData[0].type
                self.userData[weaponIndex].size = self.userData[0].size
                self.userData[weaponIndex].red = self.userData[0].red
                self.userData[weaponIndex].green = self.userData[0].green
                self.userData[weaponIndex].blue = self.userData[0].blue
                self.userData[weaponIndex].sred = self.userData[0].sred
                self.userData[weaponIndex].sgreen = self.userData[0].sgreen
                self.userData[weaponIndex].sblue = self.userData[0].sblue
                self.userData[weaponIndex].health = self.userData[0].health
                self.userData[weaponIndex].weight = self.userData[0].weight
                self.userData[weaponIndex].strokeWeight = self.userData[0].strokeWeight
                self.userData[weaponIndex].color = Color(self.userData[0].red, self.userData[0].green, self.userData[0].blue, 255)
                self.userData[weaponIndex].scolor = Color(self.userData[0].sred, self.userData[0].sgreen, self.userData[0].sblue, 255)
            end
            if (uiButton("Set as default", nil, x + 10, y - btnSpacing + 43, btnWidth * 2 + 5, 32)) then
                newDefaultCrosshair(weaponIndex)
            end
            y = y - 70
            if (uiButton("Crosshair color", nil, x + 255, y, btnWidth * 2.5, 32)) then
                editC = true
                editS = false
            end
            if editC then
                uiColorPicker(x + 250, y + 40, self.userData[weaponIndex].color, {})
                self.userData[weaponIndex].red = self.userData[weaponIndex].color.r
                self.userData[weaponIndex].green = self.userData[weaponIndex].color.g
                self.userData[weaponIndex].blue = self.userData[weaponIndex].color.b
            end
            if (uiButton("Stroke color", nil, x + 415, y, btnWidth * 2, 32)) then
                editS = true
                editC = false
            end
            if editS then
                uiColorPicker(x + 250, y + 40, self.userData[weaponIndex].scolor, {})
                self.userData[weaponIndex].sred = self.userData[weaponIndex].scolor.r
                self.userData[weaponIndex].sgreen = self.userData[weaponIndex].scolor.g
                self.userData[weaponIndex].sblue = self.userData[weaponIndex].scolor.b
            end
        else
            self.userData[weaponIndex].type2 = uiEditBox(self.userData[weaponIndex].type2, x + 10, y, 60)
            spacing = spacing - 490
            self.userData[weaponIndex].size2 = uiEditBox(self.userData[weaponIndex].size2, x + 10, y + 80, 60)
            spacing = spacing + 80
            self.userData[weaponIndex].weight2 = uiEditBox2Decimals(self.userData[weaponIndex].weight2, x + 10, y + 160, 60)
            spacing = spacing + 100
            self.userData[weaponIndex].strokeWeight2 = uiEditBox2Decimals(self.userData[weaponIndex].strokeWeight2, x + 95, y, 60)
            spacing = spacing + 150
            spacing = spacing + 160
            self.userData[weaponIndex].health2 = ui2RowCheckbox(x + 85, y + 160, 20, "", self.userData[weaponIndex].health2)
            y = y + 50
            spacing = 100
            btnSpacing = 160
            if (uiButton("Ok", nil, x + width - btnWidth - 5, y - btnSpacing + 43, btnWidth, 32)) then
                    editCrosshairIndex[weaponIndex] = false
                end
            if (uiButton("Default", nil, x + width - 2 * btnWidth - 35, y - btnSpacing + 43, btnWidth + 20, 32)) then
                self.userData[weaponIndex].type2 = self.userData[0].type
                self.userData[weaponIndex].size2 = self.userData[0].size
                self.userData[weaponIndex].red2 = self.userData[0].red
                self.userData[weaponIndex].green2 = self.userData[0].green
                self.userData[weaponIndex].blue2 = self.userData[0].blue
                self.userData[weaponIndex].health2 = self.userData[0].health
                self.userData[weaponIndex].weight2 = self.userData[0].weight
                self.userData[weaponIndex].strokeWeight2 = self.userData[0].strokeWeight
                self.userData[weaponIndex].color2 = Color(self.userData[0].red, self.userData[0].green, self.userData[0].blue, 255)
                self.userData[weaponIndex].scolor2 = Color(self.userData[0].sred, self.userData[0].sgreen, self.userData[0].sblue, 255)
            end
            y = y - 70
            if (uiButton("Crosshair color", nil, x + 255, y, btnWidth * 2.5, 32)) then
                editC2 = true
                editS2 = false
            end
            if editC2 then
                uiColorPicker(x + 250, y + 40, self.userData[weaponIndex].color2, {})
                self.userData[weaponIndex].red2 = self.userData[weaponIndex].color2.r
                self.userData[weaponIndex].green2 = self.userData[weaponIndex].color2.g
                self.userData[weaponIndex].blue2 = self.userData[weaponIndex].color2.b
            end
            if (uiButton("Stroke color", nil, x + 415, y, btnWidth * 2, 32)) then
                editS2 = true
                editC2 = false
            end
            if editS2 then
                uiColorPicker(x + 250, y + 40, self.userData[weaponIndex].scolor2, {})
                self.userData[weaponIndex].sred2 = self.userData[weaponIndex].scolor2.r
                self.userData[weaponIndex].sgreen2 = self.userData[weaponIndex].scolor2.g
                self.userData[weaponIndex].sblue2 = self.userData[weaponIndex].scolor2.b
            end
            if (uiButton("Set as default", nil, x + 10, y - btnSpacing + 43, btnWidth * 2 + 5, 32)) then
                newDefaultCrosshair(weaponIndex)
            end
        end
    end

    function weaponOptions(weaponIndex, x, y)
        local spacing = 100
        -- weapon name
        uiLabel(weaponNames[weaponIndex], x, y)
        --edit weapon view model
        if self.userData[weaponIndex].viewEnabled then
            col = Color(255, 0, 0, 50)
        else
            col = Color(255, 255, 255, 50)
        end
        spacing = spacing + 90
        if (uiButton("Edit", nil, x + spacing, y, 60, 35, col)) then
			editViewModelIndex[weaponIndex] = true
            for i = 1, 9, 1 do
                editCrosshairIndex[i] = false
                if i ~= weaponIndex then
                    editViewModelIndex[i] = false
                end                
            end
	    end
        if editViewModelIndex[weaponIndex] then
            editViewModel(weaponIndex, x, y)
        end
        spacing = spacing + 110
        --edit crosshair
        if (self.userData[weaponIndex].type == self.userData[0].type or tonumber(self.userData[weaponIndex].type) == self.userData[0].type) and 
            (self.userData[weaponIndex].size == self.userData[0].size or tonumber(self.userData[weaponIndex].size) == self.userData[0].size) and
            self.userData[weaponIndex].health == self.userData[0].health and
            (self.userData[weaponIndex].weight == self.userData[0].weight or tonumber(self.userData[weaponIndex].weight) == self.userData[0].weight) and
            (self.userData[weaponIndex].strokeWeight == self.userData[0].strokeWeight or tonumber(self.userData[weaponIndex].strokeWeight) == self.userData[0].strokeWeight) and
            self.userData[weaponIndex].mix == false and
            (self.userData[weaponIndex].health or (
                self.userData[weaponIndex].red == self.userData[0].red and
                self.userData[weaponIndex].green == self.userData[0].green and
                self.userData[weaponIndex].blue == self.userData[0].blue
            ))
            then
            col = Color(255, 255, 255, 50)
        else
            col = Color(255, 0, 0, 50)
        end
        if (uiButton("Edit", nil, x + spacing, y, 60, 35, col)) then
			editCrosshairIndex[weaponIndex] = true
            for i = 1, 9, 1 do
                editViewModelIndex[i] = false
                if i ~= weaponIndex then
                    editCrosshairIndex[i] = false
                end                
            end
	    end
        if editCrosshairIndex[weaponIndex] then
            editCrosshair(weaponIndex, x, y)
        end
        defaultCrosshair(weaponIndex)
        if self.userData[weaponIndex].health then
            crosshairFillColor = Color(2,167,46, 255)
        else
            crosshairFillColor = self.userData[weaponIndex].color
        end       
        --dsiplay crosshair preview
        if self.userData[weaponIndex].size ~= nil then
            if self.userData[weaponIndex].mix then
                local crosshairHalfSize = self.userData[weaponIndex].size2 / 2
                local crosshairHalfWeight = self.userData[weaponIndex].weight2 / 2
	            local crosshairType = tonumber(self.userData[weaponIndex].type2)
                local crosshairWeight = self.userData[weaponIndex].weight2
                local crosshairStrokeWeight = self.userData[weaponIndex].strokeWeight2
                local crosshairSize = self.userData[weaponIndex].size2
                local crosshairFillColor = self.userData[weaponIndex].color2
                local crosshairStrokeColor = self.userData[weaponIndex].scolor2
                
                nvgBeginPath();
                nvgRect(-crosshairHalfSize-crosshairType + 120, -crosshairHalfWeight + y + 15, crosshairHalfSize, crosshairWeight) -- left
                nvgRect(-crosshairHalfWeight + 120, -crosshairHalfSize-crosshairType + y + 15, crosshairWeight, crosshairHalfSize) -- top
                nvgRect(crosshairHalfSize+crosshairType + 120, crosshairHalfWeight + y + 15, -crosshairHalfSize, -crosshairWeight) -- right
                nvgRect(crosshairHalfWeight + 120, crosshairHalfSize+crosshairType + y + 15, -crosshairWeight, -crosshairHalfSize)
	            if self.userData[weaponIndex].health then
		             nvgRect(-crosshairWeight/2 + 120, -crosshairWeight/2 + y + 15, crosshairWeight, crosshairWeight) -- dot
		        end
                nvgStrokeColor(crosshairStrokeColor);
                nvgStrokeWidth(crosshairStrokeWeight);
                nvgStroke();
                nvgFillColor(crosshairFillColor);
                nvgFill();

            end
            local crosshairHalfSize = self.userData[weaponIndex].size / 2
            local crosshairHalfWeight = self.userData[weaponIndex].weight / 2
	        local crosshairType = tonumber(self.userData[weaponIndex].type)
            local crosshairWeight = self.userData[weaponIndex].weight
            local crosshairStrokeWeight = self.userData[weaponIndex].strokeWeight
            local crosshairSize = self.userData[weaponIndex].size
            local crosshairStrokeColor = self.userData[weaponIndex].scolor
            local crosshairFillColor = self.userData[weaponIndex].color         

            nvgBeginPath();
            nvgRect(-crosshairHalfSize-crosshairType + 120, -crosshairHalfWeight + y + 15, crosshairHalfSize, crosshairWeight) -- left
            nvgRect(-crosshairHalfWeight + 120, -crosshairHalfSize-crosshairType + y + 15, crosshairWeight, crosshairHalfSize) -- top
            nvgRect(crosshairHalfSize+crosshairType + 120, crosshairHalfWeight + y + 15, -crosshairHalfSize, -crosshairWeight) -- right
            nvgRect(crosshairHalfWeight + 120, crosshairHalfSize+crosshairType + y + 15, -crosshairWeight, -crosshairHalfSize)
	        if self.userData[weaponIndex].health then
		         nvgRect(-crosshairWeight/2 + 120, -crosshairWeight/2 + y + 15, crosshairWeight, crosshairWeight) -- dot
		    end
            nvgStrokeColor(crosshairStrokeColor);
            nvgStrokeWidth(crosshairStrokeWeight);
            nvgStroke();
            nvgFillColor(crosshairFillColor);
            nvgFill();

        end
        spacing = spacing + 145
        --edit damage numbers
        if self.userData[0].damage == nil then
            self.userData[0].damage = consoleGetVariable("cl_text_time")
        end
        if self.userData[weaponIndex].damage ~= self.userData[0].damage then
            nvgFillColor(Color(255, 0, 0, 20))
        else
            nvgFillColor(Color(255, 255, 255, 20))
        end
        self.userData[weaponIndex].damage = uiEditBox2Decimals(self.userData[weaponIndex].damage, x + spacing + 35, y, 60)
        nvgFill()
        spacing = spacing + 160
        --draw line at the bottom
        y = y + 40
        nvgBeginPath()
	    nvgMoveTo(x, y)
	    nvgLineTo(x + 810, y)
	    nvgStrokeWidth(1)
	    nvgStrokeColor(Color(150, 150, 150, 80))
	    nvgStroke()
        --y = y + 10
    end
end

function Nice_WeaponSettings_Mgli:drawOptions(x, y)
    local user = self.userData
    local spacing = 100
    local width = 60
    
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
    spacing = spacing + 80
    uiLabel("View model", x + spacing, y)
    spacing = spacing + 115
    uiLabel("Crosshair", x + spacing, y)
    spacing = spacing + 155
    uiLabel("Damage numbers", x + spacing, y)

    y = y + 35

    nvgBeginPath()
	nvgMoveTo(x, y)
	nvgLineTo(x + 810, y)
	nvgStrokeWidth(1)
	nvgStrokeColor(Color(150, 150, 150, 80))
	nvgStroke()
    y = y + 10

    local spacing = 170
    local width = 60

    nvgFontSize(22)
	nvgFontFace(FONT_TEXT)
	nvgTextAlign(NVG_ALIGN_LEFT, NVG_ALIGN_BOTTOM)
    ------------------------------------------------------------------------------------------------------------------------------
    
    weaponOptions(9, x, y + 360)
    weaponOptions(8, x, y + 315)
    weaponOptions(7, x, y + 270)
    weaponOptions(6, x, y + 225)
    weaponOptions(5, x, y + 180)
    weaponOptions(4, x, y + 135)
    weaponOptions(3, x, y + 90)
    weaponOptions(2, x, y + 45)
    weaponOptions(1, x, y)

    saveUserData(user)
end

function Nice_WeaponSettings_Mgli:draw()
    if not shouldShowHUD() then
        Nice_WeaponSettings_Mgli.index = 0
        return
    end

    local weaponKey = { nil, nil, nil, nil, nil, nil, nil, nil }

    -- get player, reset if not the same
    local player = getPlayer()
    if player == nil or player.index ~= Nice_WeaponSettings_Mgli.index then
        Nice_WeaponSettings_Mgli.index = player.index
        return
    end

    -- bob
    if self.userData[player.weaponIndexSelected].bob == false then
        bob = 0
    else
        bob = 1
    end
    if bob ~= consoleGetVariable("cl_weapon_bob") then
        consolePerformCommand("cl_weapon_bob " .. bob)
    end

    --rotation
    if self.userData[player.weaponIndexSelected].rotation == false then
        rotation = 0
    else
        rotation = 1
    end
    if rotation ~= consoleGetVariable("cl_weapon_rotation") then
        consolePerformCommand("cl_weapon_rotation " .. rotation)
    end

    --kickback
    if self.userData[player.weaponIndexSelected].kickback == false then
        kickback = 0
    else
        kickback = 1
    end
    if kickback ~= consoleGetVariable("cl_weapon_kickback") then
        consolePerformCommand("cl_weapon_kickback " .. kickback)
    end

    --show gun
    if self.userData[player.weaponIndexSelected].showGun == false then
        showGun = 0
    else
        showGun = 1
    end
    if showGun ~= consoleGetVariable("cl_show_gun") then
        consolePerformCommand("cl_show_gun " .. showGun)
    end

    --X offset
    if self.userData[player.weaponIndexSelected].gunX  ~= consoleGetVariable("cl_weapon_offset_x") then
        consolePerformCommand("cl_weapon_offset_x " .. self.userData[player.weaponIndexSelected].gunX )
    end
    
    --Y offset
    if self.userData[player.weaponIndexSelected].gunY ~= consoleGetVariable("cl_weapon_offset_y") then
        consolePerformCommand("cl_weapon_offset_y " .. self.userData[player.weaponIndexSelected].gunY)
    end
    
    --Z offset
    if self.userData[player.weaponIndexSelected].gunZ ~= consoleGetVariable("cl_weapon_offset_z") then
        consolePerformCommand("cl_weapon_offset_z " .. self.userData[player.weaponIndexSelected].gunZ)
    end

    --type
    if self.userData[player.weaponIndexSelected].type  ~= mgli_crosshairs.userData.crosshairGap then
        mgli_crosshairs.userData.crosshairGap = self.userData[player.weaponIndexSelected].type
    end
    
    --size
    if mgli_crosshairs.userData.crosshairSize ~= self.userData[player.weaponIndexSelected].size then
        mgli_crosshairs.userData.crosshairSize = self.userData[player.weaponIndexSelected].size
    end

    --weight
    if mgli_crosshairs.userData.crosshairWeight ~= self.userData[player.weaponIndexSelected].weight then
        mgli_crosshairs.userData.crosshairWeight = self.userData[player.weaponIndexSelected].weight
    end

    --stroke weight
    if mgli_crosshairs.userData.crosshairStrokeWeight ~= self.userData[player.weaponIndexSelected].strokeWeight then
        mgli_crosshairs.userData.crosshairStrokeWeight = self.userData[player.weaponIndexSelected].strokeWeight
    end

    --color by health
    if mgli_crosshairs.userData.dot ~= self.userData[player.weaponIndexSelected].health then
        mgli_crosshairs.userData.dot = self.userData[player.weaponIndexSelected].health
    end

    --red
    if self.userData[player.weaponIndexSelected].red  ~= mgli_crosshairs.userData.fill.r then
        mgli_crosshairs.userData.fill.r = self.userData[player.weaponIndexSelected].red
    end
    --green
    if self.userData[player.weaponIndexSelected].green  ~= mgli_crosshairs.userData.fill.g then
        mgli_crosshairs.userData.fill.g = self.userData[player.weaponIndexSelected].green
    end
    --blue
    if self.userData[player.weaponIndexSelected].blue  ~= mgli_crosshairs.userData.fill.b then
        mgli_crosshairs.userData.fill.b = self.userData[player.weaponIndexSelected].blue
    end

    --red
    if self.userData[player.weaponIndexSelected].sred  ~= mgli_crosshairs.userData.stroke.r then
        mgli_crosshairs.userData.stroke.r = self.userData[player.weaponIndexSelected].sred
    end
    --green
    if self.userData[player.weaponIndexSelected].sgreen  ~= mgli_crosshairs.userData.stroke.g then
        mgli_crosshairs.userData.stroke.g = self.userData[player.weaponIndexSelected].sgreen
    end
    --blue
    if self.userData[player.weaponIndexSelected].sblue  ~= mgli_crosshairs.userData.stroke.b then
        mgli_crosshairs.userData.stroke.b = self.userData[player.weaponIndexSelected].sblue
    end

    if self.userData[player.weaponIndexSelected].mix then
        consolePerformCommand("ui_show_widget mgli_crosshairs2")
        --type
        if self.userData[player.weaponIndexSelected].type2  ~= mgli_crosshairs2.userData.crosshairGap then
            mgli_crosshairs2.userData.crosshairGap = self.userData[player.weaponIndexSelected].type2
        end
        
        --size
        if mgli_crosshairs2.userData.crosshairSize ~= self.userData[player.weaponIndexSelected].size2 then
            mgli_crosshairs2.userData.crosshairSize = self.userData[player.weaponIndexSelected].size2
        end

        --weight
        if mgli_crosshairs2.userData.crosshairWeight ~= self.userData[player.weaponIndexSelected].weight2 then
            mgli_crosshairs2.userData.crosshairWeight = self.userData[player.weaponIndexSelected].weight2
        end

        --stroke weight
        if mgli_crosshairs2.userData.crosshairStrokeWeight ~= self.userData[player.weaponIndexSelected].strokeWeight2 then
            mgli_crosshairs2.userData.crosshairStrokeWeight = self.userData[player.weaponIndexSelected].strokeWeight2
        end

        --color by health
        if mgli_crosshairs2.userData.dot ~= self.userData[player.weaponIndexSelected].health2 then
            mgli_crosshairs2.userData.dot = self.userData[player.weaponIndexSelected].health2
        end

        --red
        if self.userData[player.weaponIndexSelected].red2  ~= mgli_crosshairs2.userData.fill.r then
            mgli_crosshairs2.userData.fill.r = self.userData[player.weaponIndexSelected].red2
        end
        --green
        if self.userData[player.weaponIndexSelected].green2  ~= mgli_crosshairs2.userData.fill.g then
            mgli_crosshairs2.userData.fill.g = self.userData[player.weaponIndexSelected].green2
        end
        --blue
        if self.userData[player.weaponIndexSelected].blue2  ~= mgli_crosshairs2.userData.fill.b then
            mgli_crosshairs2.userData.fill.b = self.userData[player.weaponIndexSelected].blue2
        end

        --red
        if self.userData[player.weaponIndexSelected].sred2 ~= mgli_crosshairs2.userData.stroke.r then
            mgli_crosshairs2.userData.stroke.r = self.userData[player.weaponIndexSelected].sred2
        end
        --green
        if self.userData[player.weaponIndexSelected].sgreen2  ~= mgli_crosshairs2.userData.stroke.g then
            mgli_crosshairs2.userData.stroke.g = self.userData[player.weaponIndexSelected].sgreen2
        end
        --blue
        if self.userData[player.weaponIndexSelected].sblue2  ~= mgli_crosshairs2.userData.stroke.b then
            mgli_crosshairs2.userData.stroke.b = self.userData[player.weaponIndexSelected].sblue2
        end
    elseif self.userData[player.weaponIndexSelected].mix == false then
        for k = 1, 9, 1 do
            if k ~= player.weaponIndexSelected and self.userData[k].mix then
                consolePerformCommand("ui_hide_widget mgli_crosshairs2")
            end
        end
    end

    --damage numbers
    if self.userData[player.weaponIndexSelected].damage ~= consoleGetVariable("cl_text_time") then
        consolePerformCommand("cl_text_time " .. self.userData[player.weaponIndexSelected].damage)
    end
end
