require "base/internal/ui/reflexcore"

Nice_WeaponSettings = { canPosition = false, index = 0 }
registerWidget("Nice_WeaponSettings")

function Nice_WeaponSettings:initialize()
    self.userData = loadUserData()
    settings = {
        [0] = { dc = 1, strokeRed = nil, strokeBlue = nil, strokeGreen = nil, strokeAlpha = nil, strokeRed2 = nil, strokeBlue2 = nil, strokeGreen2 = nil, strokeAlpha2 = nil, bob = nil; rotation = nil; kickback = nil; showGun = nil; gunX = nil; gunY = nil; gunZ = nil; FOV = nil, damage = nil, type = nil; size = nil; red = nil; green = nil; blue = nil, alpha = nil, health = nil; weight = nil, strokeWeight = nil, stroke = nil; color = nil, strokeColor = nil};
        [1] = { bob = consoleGetVariable("cl_weapon_bob"); rotation = consoleGetVariable("cl_weapon_rotation"); kickback = consoleGetVariable("cl_weapon_kickback"); showGun = consoleGetVariable("cl_show_gun"); gunX = consoleGetVariable("cl_weapon_offset_x"); gunY = consoleGetVariable("cl_weapon_offset_y"); gunZ = consoleGetVariable("cl_weapon_offset_z"); type = consoleGetVariable("ui_nice_crosshairs_type"); size = Nice_Crosshairs.userData.crosshairSize; color = Color(255, 255, 255, 255); strokeColor = Color(255, 255, 255, 255); strokeRed = Nice_Crosshairs.userData.crosshairStrokeColor_r; strokeGreen = Nice_Crosshairs.userData.crosshairStrokeColor_g; strokeBlue = Nice_Crosshairs.userData.crosshairStrokeColor_b; strokeAlpha = Nice_Crosshairs.userData.crosshairStrokeColor_a; red = consoleGetVariable("ui_nice_crosshairs_r"); green = consoleGetVariable("ui_nice_crosshairs_g"); blue = consoleGetVariable("ui_nice_crosshairs_b"), alpha = consoleGetVariable("ui_nice_crosshairs_a"), health = Nice_Crosshairs.userData.colorFillByHealth; weight = Nice_Crosshairs.userData.crosshairWeight, strokeWeight = Nice_Crosshairs.userData.crosshairStrokeWeight, stroke = Nice_Crosshairs.userData.colorStrokeByHealth; type2 = consoleGetVariable("ui_nice_crosshairs_type"); size2 = Nice_Crosshairs.userData.crosshairSize; color2 = Color(255, 255, 255, 255); red2 = consoleGetVariable("ui_nice_crosshairs_r"); green2 = consoleGetVariable("ui_nice_crosshairs_g"); blue2 = consoleGetVariable("ui_nice_crosshairs_b"); alpha2 = consoleGetVariable("ui_nice_crosshairs_a"); health2 = Nice_Crosshairs.userData.colorFillByHealth; weight2 = Nice_Crosshairs.userData.crosshairWeight; strokeWeight2 = Nice_Crosshairs.userData.crosshairStrokeWeight; strokeColor2 = Color(255, 255, 255, 255); strokeRed2 = Nice_Crosshairs2.userData.crosshairStrokeColor_r; strokeGreen2 = Nice_Crosshairs2.userData.crosshairStrokeColor_g; strokeBlue2 = Nice_Crosshairs2.userData.crosshairStrokeColor_b; strokeAlpha2 = Nice_Crosshairs2.userData.crosshairStrokeColor_a; stroke2 = Nice_Crosshairs.userData.colorStrokeByHealth; damage = consoleGetVariable("cl_text_time"); viewEnabled = false; mix = false};
        [2] = { bob = consoleGetVariable("cl_weapon_bob"); rotation = consoleGetVariable("cl_weapon_rotation"); kickback = consoleGetVariable("cl_weapon_kickback"); showGun = consoleGetVariable("cl_show_gun"); gunX = consoleGetVariable("cl_weapon_offset_x"); gunY = consoleGetVariable("cl_weapon_offset_y"); gunZ = consoleGetVariable("cl_weapon_offset_z"); type = consoleGetVariable("ui_nice_crosshairs_type"); size = Nice_Crosshairs.userData.crosshairSize; color = Color(255, 255, 255, 255); strokeColor = Color(255, 255, 255, 255); strokeRed = Nice_Crosshairs.userData.crosshairStrokeColor_r; strokeGreen = Nice_Crosshairs.userData.crosshairStrokeColor_g; strokeBlue = Nice_Crosshairs.userData.crosshairStrokeColor_b; strokeAlpha = Nice_Crosshairs.userData.crosshairStrokeColor_a; red = consoleGetVariable("ui_nice_crosshairs_r"); green = consoleGetVariable("ui_nice_crosshairs_g"); blue = consoleGetVariable("ui_nice_crosshairs_b"), alpha = consoleGetVariable("ui_nice_crosshairs_a"), health = Nice_Crosshairs.userData.colorFillByHealth; weight = Nice_Crosshairs.userData.crosshairWeight, strokeWeight = Nice_Crosshairs.userData.crosshairStrokeWeight, stroke = Nice_Crosshairs.userData.colorStrokeByHealth; type2 = consoleGetVariable("ui_nice_crosshairs_type"); size2 = Nice_Crosshairs.userData.crosshairSize; color2 = Color(255, 255, 255, 255); red2 = consoleGetVariable("ui_nice_crosshairs_r"); green2 = consoleGetVariable("ui_nice_crosshairs_g"); blue2 = consoleGetVariable("ui_nice_crosshairs_b"); alpha2 = consoleGetVariable("ui_nice_crosshairs_a"); health2 = Nice_Crosshairs.userData.colorFillByHealth; weight2 = Nice_Crosshairs.userData.crosshairWeight; strokeWeight2 = Nice_Crosshairs.userData.crosshairStrokeWeight; strokeColor2 = Color(255, 255, 255, 255); strokeRed2 = Nice_Crosshairs2.userData.crosshairStrokeColor_r; strokeGreen2 = Nice_Crosshairs2.userData.crosshairStrokeColor_g; strokeBlue2 = Nice_Crosshairs2.userData.crosshairStrokeColor_b; strokeAlpha2 = Nice_Crosshairs2.userData.crosshairStrokeColor_a; stroke2 = Nice_Crosshairs.userData.colorStrokeByHealth; damage = consoleGetVariable("cl_text_time"); viewEnabled = false; mix = false};
        [3] = { bob = consoleGetVariable("cl_weapon_bob"); rotation = consoleGetVariable("cl_weapon_rotation"); kickback = consoleGetVariable("cl_weapon_kickback"); showGun = consoleGetVariable("cl_show_gun"); gunX = consoleGetVariable("cl_weapon_offset_x"); gunY = consoleGetVariable("cl_weapon_offset_y"); gunZ = consoleGetVariable("cl_weapon_offset_z"); type = consoleGetVariable("ui_nice_crosshairs_type"); size = Nice_Crosshairs.userData.crosshairSize; color = Color(255, 255, 255, 255); strokeColor = Color(255, 255, 255, 255); strokeRed = Nice_Crosshairs.userData.crosshairStrokeColor_r; strokeGreen = Nice_Crosshairs.userData.crosshairStrokeColor_g; strokeBlue = Nice_Crosshairs.userData.crosshairStrokeColor_b; strokeAlpha = Nice_Crosshairs.userData.crosshairStrokeColor_a; red = consoleGetVariable("ui_nice_crosshairs_r"); green = consoleGetVariable("ui_nice_crosshairs_g"); blue = consoleGetVariable("ui_nice_crosshairs_b"), alpha = consoleGetVariable("ui_nice_crosshairs_a"), health = Nice_Crosshairs.userData.colorFillByHealth; weight = Nice_Crosshairs.userData.crosshairWeight, strokeWeight = Nice_Crosshairs.userData.crosshairStrokeWeight, stroke = Nice_Crosshairs.userData.colorStrokeByHealth; type2 = consoleGetVariable("ui_nice_crosshairs_type"); size2 = Nice_Crosshairs.userData.crosshairSize; color2 = Color(255, 255, 255, 255); red2 = consoleGetVariable("ui_nice_crosshairs_r"); green2 = consoleGetVariable("ui_nice_crosshairs_g"); blue2 = consoleGetVariable("ui_nice_crosshairs_b"); alpha2 = consoleGetVariable("ui_nice_crosshairs_a"); health2 = Nice_Crosshairs.userData.colorFillByHealth; weight2 = Nice_Crosshairs.userData.crosshairWeight; strokeWeight2 = Nice_Crosshairs.userData.crosshairStrokeWeight; strokeColor2 = Color(255, 255, 255, 255); strokeRed2 = Nice_Crosshairs2.userData.crosshairStrokeColor_r; strokeGreen2 = Nice_Crosshairs2.userData.crosshairStrokeColor_g; strokeBlue2 = Nice_Crosshairs2.userData.crosshairStrokeColor_b; strokeAlpha2 = Nice_Crosshairs2.userData.crosshairStrokeColor_a; stroke2 = Nice_Crosshairs.userData.colorStrokeByHealth; damage = consoleGetVariable("cl_text_time"); viewEnabled = false; mix = false};
        [4] = { bob = consoleGetVariable("cl_weapon_bob"); rotation = consoleGetVariable("cl_weapon_rotation"); kickback = consoleGetVariable("cl_weapon_kickback"); showGun = consoleGetVariable("cl_show_gun"); gunX = consoleGetVariable("cl_weapon_offset_x"); gunY = consoleGetVariable("cl_weapon_offset_y"); gunZ = consoleGetVariable("cl_weapon_offset_z"); type = consoleGetVariable("ui_nice_crosshairs_type"); size = Nice_Crosshairs.userData.crosshairSize; color = Color(255, 255, 255, 255); strokeColor = Color(255, 255, 255, 255); strokeRed = Nice_Crosshairs.userData.crosshairStrokeColor_r; strokeGreen = Nice_Crosshairs.userData.crosshairStrokeColor_g; strokeBlue = Nice_Crosshairs.userData.crosshairStrokeColor_b; strokeAlpha = Nice_Crosshairs.userData.crosshairStrokeColor_a; red = consoleGetVariable("ui_nice_crosshairs_r"); green = consoleGetVariable("ui_nice_crosshairs_g"); blue = consoleGetVariable("ui_nice_crosshairs_b"), alpha = consoleGetVariable("ui_nice_crosshairs_a"), health = Nice_Crosshairs.userData.colorFillByHealth; weight = Nice_Crosshairs.userData.crosshairWeight, strokeWeight = Nice_Crosshairs.userData.crosshairStrokeWeight, stroke = Nice_Crosshairs.userData.colorStrokeByHealth; type2 = consoleGetVariable("ui_nice_crosshairs_type"); size2 = Nice_Crosshairs.userData.crosshairSize; color2 = Color(255, 255, 255, 255); red2 = consoleGetVariable("ui_nice_crosshairs_r"); green2 = consoleGetVariable("ui_nice_crosshairs_g"); blue2 = consoleGetVariable("ui_nice_crosshairs_b"); alpha2 = consoleGetVariable("ui_nice_crosshairs_a"); health2 = Nice_Crosshairs.userData.colorFillByHealth; weight2 = Nice_Crosshairs.userData.crosshairWeight; strokeWeight2 = Nice_Crosshairs.userData.crosshairStrokeWeight; strokeColor2 = Color(255, 255, 255, 255); strokeRed2 = Nice_Crosshairs2.userData.crosshairStrokeColor_r; strokeGreen2 = Nice_Crosshairs2.userData.crosshairStrokeColor_g; strokeBlue2 = Nice_Crosshairs2.userData.crosshairStrokeColor_b; strokeAlpha2 = Nice_Crosshairs2.userData.crosshairStrokeColor_a; stroke2 = Nice_Crosshairs.userData.colorStrokeByHealth; damage = consoleGetVariable("cl_text_time"); viewEnabled = false; mix = false};
        [5] = { bob = consoleGetVariable("cl_weapon_bob"); rotation = consoleGetVariable("cl_weapon_rotation"); kickback = consoleGetVariable("cl_weapon_kickback"); showGun = consoleGetVariable("cl_show_gun"); gunX = consoleGetVariable("cl_weapon_offset_x"); gunY = consoleGetVariable("cl_weapon_offset_y"); gunZ = consoleGetVariable("cl_weapon_offset_z"); type = consoleGetVariable("ui_nice_crosshairs_type"); size = Nice_Crosshairs.userData.crosshairSize; color = Color(255, 255, 255, 255); strokeColor = Color(255, 255, 255, 255); strokeRed = Nice_Crosshairs.userData.crosshairStrokeColor_r; strokeGreen = Nice_Crosshairs.userData.crosshairStrokeColor_g; strokeBlue = Nice_Crosshairs.userData.crosshairStrokeColor_b; strokeAlpha = Nice_Crosshairs.userData.crosshairStrokeColor_a; red = consoleGetVariable("ui_nice_crosshairs_r"); green = consoleGetVariable("ui_nice_crosshairs_g"); blue = consoleGetVariable("ui_nice_crosshairs_b"), alpha = consoleGetVariable("ui_nice_crosshairs_a"), health = Nice_Crosshairs.userData.colorFillByHealth; weight = Nice_Crosshairs.userData.crosshairWeight, strokeWeight = Nice_Crosshairs.userData.crosshairStrokeWeight, stroke = Nice_Crosshairs.userData.colorStrokeByHealth; type2 = consoleGetVariable("ui_nice_crosshairs_type"); size2 = Nice_Crosshairs.userData.crosshairSize; color2 = Color(255, 255, 255, 255); red2 = consoleGetVariable("ui_nice_crosshairs_r"); green2 = consoleGetVariable("ui_nice_crosshairs_g"); blue2 = consoleGetVariable("ui_nice_crosshairs_b"); alpha2 = consoleGetVariable("ui_nice_crosshairs_a"); health2 = Nice_Crosshairs.userData.colorFillByHealth; weight2 = Nice_Crosshairs.userData.crosshairWeight; strokeWeight2 = Nice_Crosshairs.userData.crosshairStrokeWeight; strokeColor2 = Color(255, 255, 255, 255); strokeRed2 = Nice_Crosshairs2.userData.crosshairStrokeColor_r; strokeGreen2 = Nice_Crosshairs2.userData.crosshairStrokeColor_g; strokeBlue2 = Nice_Crosshairs2.userData.crosshairStrokeColor_b; strokeAlpha2 = Nice_Crosshairs2.userData.crosshairStrokeColor_a; stroke2 = Nice_Crosshairs.userData.colorStrokeByHealth; damage = consoleGetVariable("cl_text_time"); viewEnabled = false; mix = false};
        [6] = { bob = consoleGetVariable("cl_weapon_bob"); rotation = consoleGetVariable("cl_weapon_rotation"); kickback = consoleGetVariable("cl_weapon_kickback"); showGun = consoleGetVariable("cl_show_gun"); gunX = consoleGetVariable("cl_weapon_offset_x"); gunY = consoleGetVariable("cl_weapon_offset_y"); gunZ = consoleGetVariable("cl_weapon_offset_z"); type = consoleGetVariable("ui_nice_crosshairs_type"); size = Nice_Crosshairs.userData.crosshairSize; color = Color(255, 255, 255, 255); strokeColor = Color(255, 255, 255, 255); strokeRed = Nice_Crosshairs.userData.crosshairStrokeColor_r; strokeGreen = Nice_Crosshairs.userData.crosshairStrokeColor_g; strokeBlue = Nice_Crosshairs.userData.crosshairStrokeColor_b; strokeAlpha = Nice_Crosshairs.userData.crosshairStrokeColor_a; red = consoleGetVariable("ui_nice_crosshairs_r"); green = consoleGetVariable("ui_nice_crosshairs_g"); blue = consoleGetVariable("ui_nice_crosshairs_b"), alpha = consoleGetVariable("ui_nice_crosshairs_a"), health = Nice_Crosshairs.userData.colorFillByHealth; weight = Nice_Crosshairs.userData.crosshairWeight, strokeWeight = Nice_Crosshairs.userData.crosshairStrokeWeight, stroke = Nice_Crosshairs.userData.colorStrokeByHealth; type2 = consoleGetVariable("ui_nice_crosshairs_type"); size2 = Nice_Crosshairs.userData.crosshairSize; color2 = Color(255, 255, 255, 255); red2 = consoleGetVariable("ui_nice_crosshairs_r"); green2 = consoleGetVariable("ui_nice_crosshairs_g"); blue2 = consoleGetVariable("ui_nice_crosshairs_b"); alpha2 = consoleGetVariable("ui_nice_crosshairs_a"); health2 = Nice_Crosshairs.userData.colorFillByHealth; weight2 = Nice_Crosshairs.userData.crosshairWeight; strokeWeight2 = Nice_Crosshairs.userData.crosshairStrokeWeight; strokeColor2 = Color(255, 255, 255, 255); strokeRed2 = Nice_Crosshairs2.userData.crosshairStrokeColor_r; strokeGreen2 = Nice_Crosshairs2.userData.crosshairStrokeColor_g; strokeBlue2 = Nice_Crosshairs2.userData.crosshairStrokeColor_b; strokeAlpha2 = Nice_Crosshairs2.userData.crosshairStrokeColor_a; stroke2 = Nice_Crosshairs.userData.colorStrokeByHealth; damage = consoleGetVariable("cl_text_time"); viewEnabled = false; mix = false};
        [7] = { bob = consoleGetVariable("cl_weapon_bob"); rotation = consoleGetVariable("cl_weapon_rotation"); kickback = consoleGetVariable("cl_weapon_kickback"); showGun = consoleGetVariable("cl_show_gun"); gunX = consoleGetVariable("cl_weapon_offset_x"); gunY = consoleGetVariable("cl_weapon_offset_y"); gunZ = consoleGetVariable("cl_weapon_offset_z"); type = consoleGetVariable("ui_nice_crosshairs_type"); size = Nice_Crosshairs.userData.crosshairSize; color = Color(255, 255, 255, 255); strokeColor = Color(255, 255, 255, 255); strokeRed = Nice_Crosshairs.userData.crosshairStrokeColor_r; strokeGreen = Nice_Crosshairs.userData.crosshairStrokeColor_g; strokeBlue = Nice_Crosshairs.userData.crosshairStrokeColor_b; strokeAlpha = Nice_Crosshairs.userData.crosshairStrokeColor_a; red = consoleGetVariable("ui_nice_crosshairs_r"); green = consoleGetVariable("ui_nice_crosshairs_g"); blue = consoleGetVariable("ui_nice_crosshairs_b"), alpha = consoleGetVariable("ui_nice_crosshairs_a"), health = Nice_Crosshairs.userData.colorFillByHealth; weight = Nice_Crosshairs.userData.crosshairWeight, strokeWeight = Nice_Crosshairs.userData.crosshairStrokeWeight, stroke = Nice_Crosshairs.userData.colorStrokeByHealth; type2 = consoleGetVariable("ui_nice_crosshairs_type"); size2 = Nice_Crosshairs.userData.crosshairSize; color2 = Color(255, 255, 255, 255); red2 = consoleGetVariable("ui_nice_crosshairs_r"); green2 = consoleGetVariable("ui_nice_crosshairs_g"); blue2 = consoleGetVariable("ui_nice_crosshairs_b"); alpha2 = consoleGetVariable("ui_nice_crosshairs_a"); health2 = Nice_Crosshairs.userData.colorFillByHealth; weight2 = Nice_Crosshairs.userData.crosshairWeight; strokeWeight2 = Nice_Crosshairs.userData.crosshairStrokeWeight; strokeColor2 = Color(255, 255, 255, 255); strokeRed2 = Nice_Crosshairs2.userData.crosshairStrokeColor_r; strokeGreen2 = Nice_Crosshairs2.userData.crosshairStrokeColor_g; strokeBlue2 = Nice_Crosshairs2.userData.crosshairStrokeColor_b; strokeAlpha2 = Nice_Crosshairs2.userData.crosshairStrokeColor_a; stroke2 = Nice_Crosshairs.userData.colorStrokeByHealth; damage = consoleGetVariable("cl_text_time"); viewEnabled = false; mix = false};
        [8] = { bob = consoleGetVariable("cl_weapon_bob"); rotation = consoleGetVariable("cl_weapon_rotation"); kickback = consoleGetVariable("cl_weapon_kickback"); showGun = consoleGetVariable("cl_show_gun"); gunX = consoleGetVariable("cl_weapon_offset_x"); gunY = consoleGetVariable("cl_weapon_offset_y"); gunZ = consoleGetVariable("cl_weapon_offset_z"); type = consoleGetVariable("ui_nice_crosshairs_type"); size = Nice_Crosshairs.userData.crosshairSize; color = Color(255, 255, 255, 255); strokeColor = Color(255, 255, 255, 255); strokeRed = Nice_Crosshairs.userData.crosshairStrokeColor_r; strokeGreen = Nice_Crosshairs.userData.crosshairStrokeColor_g; strokeBlue = Nice_Crosshairs.userData.crosshairStrokeColor_b; strokeAlpha = Nice_Crosshairs.userData.crosshairStrokeColor_a; red = consoleGetVariable("ui_nice_crosshairs_r"); green = consoleGetVariable("ui_nice_crosshairs_g"); blue = consoleGetVariable("ui_nice_crosshairs_b"), alpha = consoleGetVariable("ui_nice_crosshairs_a"), health = Nice_Crosshairs.userData.colorFillByHealth; weight = Nice_Crosshairs.userData.crosshairWeight, strokeWeight = Nice_Crosshairs.userData.crosshairStrokeWeight, stroke = Nice_Crosshairs.userData.colorStrokeByHealth; type2 = consoleGetVariable("ui_nice_crosshairs_type"); size2 = Nice_Crosshairs.userData.crosshairSize; color2 = Color(255, 255, 255, 255); red2 = consoleGetVariable("ui_nice_crosshairs_r"); green2 = consoleGetVariable("ui_nice_crosshairs_g"); blue2 = consoleGetVariable("ui_nice_crosshairs_b"); alpha2 = consoleGetVariable("ui_nice_crosshairs_a"); health2 = Nice_Crosshairs.userData.colorFillByHealth; weight2 = Nice_Crosshairs.userData.crosshairWeight; strokeWeight2 = Nice_Crosshairs.userData.crosshairStrokeWeight; strokeColor2 = Color(255, 255, 255, 255); strokeRed2 = Nice_Crosshairs2.userData.crosshairStrokeColor_r; strokeGreen2 = Nice_Crosshairs2.userData.crosshairStrokeColor_g; strokeBlue2 = Nice_Crosshairs2.userData.crosshairStrokeColor_b; strokeAlpha2 = Nice_Crosshairs2.userData.crosshairStrokeColor_a; stroke2 = Nice_Crosshairs.userData.colorStrokeByHealth; damage = consoleGetVariable("cl_text_time"); viewEnabled = false; mix = false};
        [9] = { bob = consoleGetVariable("cl_weapon_bob"); rotation = consoleGetVariable("cl_weapon_rotation"); kickback = consoleGetVariable("cl_weapon_kickback"); showGun = consoleGetVariable("cl_show_gun"); gunX = consoleGetVariable("cl_weapon_offset_x"); gunY = consoleGetVariable("cl_weapon_offset_y"); gunZ = consoleGetVariable("cl_weapon_offset_z"); type = consoleGetVariable("ui_nice_crosshairs_type"); size = Nice_Crosshairs.userData.crosshairSize; color = Color(255, 255, 255, 255); strokeColor = Color(255, 255, 255, 255); strokeRed = Nice_Crosshairs.userData.crosshairStrokeColor_r; strokeGreen = Nice_Crosshairs.userData.crosshairStrokeColor_g; strokeBlue = Nice_Crosshairs.userData.crosshairStrokeColor_b; strokeAlpha = Nice_Crosshairs.userData.crosshairStrokeColor_a; red = consoleGetVariable("ui_nice_crosshairs_r"); green = consoleGetVariable("ui_nice_crosshairs_g"); blue = consoleGetVariable("ui_nice_crosshairs_b"), alpha = consoleGetVariable("ui_nice_crosshairs_a"), health = Nice_Crosshairs.userData.colorFillByHealth; weight = Nice_Crosshairs.userData.crosshairWeight, strokeWeight = Nice_Crosshairs.userData.crosshairStrokeWeight, stroke = Nice_Crosshairs.userData.colorStrokeByHealth; type2 = consoleGetVariable("ui_nice_crosshairs_type"); size2 = Nice_Crosshairs.userData.crosshairSize; color2 = Color(255, 255, 255, 255); red2 = consoleGetVariable("ui_nice_crosshairs_r"); green2 = consoleGetVariable("ui_nice_crosshairs_g"); blue2 = consoleGetVariable("ui_nice_crosshairs_b"); alpha2 = consoleGetVariable("ui_nice_crosshairs_a"); health2 = Nice_Crosshairs.userData.colorFillByHealth; weight2 = Nice_Crosshairs.userData.crosshairWeight; strokeWeight2 = Nice_Crosshairs.userData.crosshairStrokeWeight; strokeColor2 = Color(255, 255, 255, 255); strokeRed2 = Nice_Crosshairs2.userData.crosshairStrokeColor_r; strokeGreen2 = Nice_Crosshairs2.userData.crosshairStrokeColor_g; strokeBlue2 = Nice_Crosshairs2.userData.crosshairStrokeColor_b; strokeAlpha2 = Nice_Crosshairs2.userData.crosshairStrokeColor_a; stroke2 = Nice_Crosshairs.userData.colorStrokeByHealth; damage = consoleGetVariable("cl_text_time"); viewEnabled = false; mix = false}
    } 
    consolePerformCommand("ui_hide_widget Crosshairs")
    consolePerformCommand("ui_show_widget Nice_Crosshairs")
    CheckSetDefaultValue(self, "userData", "table", settings)

    local weaponNames = { "Melee", "Burst gun", "Shotgun", "Grenade launcher", "Plasma gun", "Rocket launcher", "Ion cannon", "Bolt rifle", "Stake gun" }
    local editViewModelIndex = { false, false, false, false, false, false, false, false, false }
    local editCrosshairIndex = { false, false, false, false, false, false, false, false, false }
    local editStroke = false
    local editFill = true
    local colrr = Color(255, 0, 0, 50)

    function defaultCrosshair(weaponIndex)
        if self.userData[0].type == nil then
             self.userData[0].type = consoleGetVariable("ui_nice_crosshairs_type")
             self.userData[0].size = Nice_Crosshairs.userData.crosshairSize
             self.userData[0].red = consoleGetVariable("ui_nice_crosshairs_r")
             self.userData[0].green = consoleGetVariable("ui_nice_crosshairs_g")
             self.userData[0].blue = consoleGetVariable("ui_nice_crosshairs_b")
             self.userData[0].alpha = consoleGetVariable("ui_nice_crosshairs_a")
             self.userData[0].strokeRed = consoleGetVariable("ui_nice_crosshairs_ra")
             self.userData[0].strokeGreen = consoleGetVariable("ui_nice_crosshairs_ga")
             self.userData[0].strokeBlue = consoleGetVariable("ui_nice_crosshairs_ba")
             self.userData[0].strokeAlpha = consoleGetVariable("ui_nice_crosshairs_aa")
             self.userData[0].health = Nice_Crosshairs.userData.colorFillByHealth
             self.userData[0].weight = Nice_Crosshairs.userData.crosshairWeight
             self.userData[0].strokeWeight = Nice_Crosshairs.userData.crosshairStrokeWeight
             self.userData[0].stroke = Nice_Crosshairs.userData.colorStrokeByHealth
             self.userData[0].color = Color(self.userData[0].red, self.userData[0].green, self.userData[0].blue, self.userData[0].alpha)
             self.userData[0].strokeColor = Color(self.userData[0].strokeRed, self.userData[0].strokeGreen, self.userData[0].blue, self.userData[0].strokeAlpha)
        end
        if self.userData[weaponIndex].type == nil then
             self.userData[weaponIndex].type = self.userData[0].type
             self.userData[weaponIndex].size = self.userData[0].size
             self.userData[weaponIndex].red = self.userData[0].red
             self.userData[weaponIndex].green = self.userData[0].green
             self.userData[weaponIndex].blue = self.userData[0].blue
             self.userData[weaponIndex].alpha = self.userData[0].alpha
             self.userData[weaponIndex].strokeRed = self.userData[0].strokeRed
             self.userData[weaponIndex].strokeGreen = self.userData[0].strokeGreen
             self.userData[weaponIndex].strokeBlue = self.userData[0].strokeBlue
             self.userData[weaponIndex].strokeAlpha = self.userData[0].strokeAlpha
             self.userData[weaponIndex].health = self.userData[0].health
             self.userData[weaponIndex].weight = self.userData[0].weight
             self.userData[weaponIndex].strokeWeight = self.userData[0].strokeWeight
             self.userData[weaponIndex].stroke = self.userData[0].stroke
             self.userData[weaponIndex].color = self.userData[0].color
             self.userData[weaponIndex].strokeColor = self.userData[0].strokeColor
             self.userData[weaponIndex].strokeColor = self.userData[0].strokeColor
             self.userData[weaponIndex].type2 = self.userData[0].type
             self.userData[weaponIndex].size2 = self.userData[0].size
             self.userData[weaponIndex].red2 = self.userData[0].red
             self.userData[weaponIndex].green2 = self.userData[0].green
             self.userData[weaponIndex].blue2 = self.userData[0].blue
             self.userData[weaponIndex].alpha2 = self.userData[0].alpha
             self.userData[weaponIndex].strokeRed2 = self.userData[0].strokeRed
             self.userData[weaponIndex].strokeGreen2 = self.userData[0].strokeGreen
             self.userData[weaponIndex].strokeBlue2 = self.userData[0].strokeBlue
             self.userData[weaponIndex].strokeAlpha2 = self.userData[0].strokeAlpha
             self.userData[weaponIndex].health2 = self.userData[0].health
             self.userData[weaponIndex].weight2 = self.userData[0].weight
             self.userData[weaponIndex].strokeWeight2 = self.userData[0].strokeWeight
             self.userData[weaponIndex].stroke2 = self.userData[0].stroke
             self.userData[weaponIndex].color2 = self.userData[0].color
             self.userData[weaponIndex].strokeColor2 = self.userData[0].strokeColor
        end
        if self.userData[weaponIndex].red == nil or self.userData[weaponIndex].green == nil or self.userData[weaponIndex].blue == nil or self.userData[weaponIndex].alpha == nil or self.userData[weaponIndex].color == nil or self.userData[weaponIndex].strokeColor == nil or self.userData[weaponIndex].strokeRed == nil or self.userData[weaponIndex].strokeBlue == nil or self.userData[weaponIndex].strokeGreen == nil then
            self.userData[weaponIndex].red = consoleGetVariable("ui_nice_crosshairs_r")
            self.userData[weaponIndex].green = consoleGetVariable("ui_nice_crosshairs_g")
            self.userData[weaponIndex].blue = consoleGetVariable("ui_nice_crosshairs_b")
            self.userData[weaponIndex].alpha = consoleGetVariable("ui_nice_crosshairs_a")
            self.userData[weaponIndex].color = Color(self.userData[weaponIndex].red, self.userData[weaponIndex].green, self.userData[weaponIndex].blue, self.userData[weaponIndex].alpha)
            self.userData[weaponIndex].red2 = consoleGetVariable("ui_nice_crosshairs_r")
            self.userData[weaponIndex].green2 = consoleGetVariable("ui_nice_crosshairs_g")
            self.userData[weaponIndex].blue2 = consoleGetVariable("ui_nice_crosshairs_b")
            self.userData[weaponIndex].alpha2 = consoleGetVariable("ui_nice_crosshairs_a")
            self.userData[weaponIndex].color2 = Color(self.userData[weaponIndex].red, self.userData[weaponIndex].green, self.userData[weaponIndex].blue, self.userData[weaponIndex].alpha)
            self.userData[weaponIndex].strokeRed = consoleGetVariable("ui_nice_crosshairs_r")
            self.userData[weaponIndex].strokeGreen = consoleGetVariable("ui_nice_crosshairs_g")
            self.userData[weaponIndex].strokeBlue = consoleGetVariable("ui_nice_crosshairs_b")
            self.userData[weaponIndex].strokeAlpha = consoleGetVariable("ui_nice_crosshairs_a")
            self.userData[weaponIndex].strokeColor = Color(self.userData[weaponIndex].strokeRed, self.userData[weaponIndex].strokeGreen, self.userData[weaponIndex].strokeBlue, self.userData[weaponIndex].strokeAlpha)
            self.userData[weaponIndex].strokeRed2 = consoleGetVariable("ui_nice_crosshairs_r")
            self.userData[weaponIndex].strokeGreen2 = consoleGetVariable("ui_nice_crosshairs_g")
            self.userData[weaponIndex].strokeBlue2 = consoleGetVariable("ui_nice_crosshairs_b")
            self.userData[weaponIndex].strokeAlpha2 = consoleGetVariable("ui_nice_crosshairs_a")
            self.userData[weaponIndex].strokeColor2 = Color(self.userData[weaponIndex].strokeRed, self.userData[weaponIndex].strokeGreen, self.userData[weaponIndex].strokeBlue, self.userData[weaponIndex].strokeAlpha)
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
                       self.userData[i].stroke == self.userData[0].stroke and
                       (self.userData[i].health == self.userData[0].health or
                       (self.userData[i].red == self.userData[0].red and
                       self.userData[i].green == self.userData[0].green and
                       self.userData[i].blue == self.userData[0].blue and
                       self.userData[i].alpha == self.userData[0].alpha) or 
                       (self.userData[i].strokeRed == self.userData[0].strokeRed and
                       self.userData[i].strokeGreen == self.userData[0].strokeGreen and
                       self.userData[i].strokeBlue == self.userData[0].strokeBlue and
                       self.userData[i].strokeAlpha == self.userData[0].strokeAlpha)) 
                       then
                    self.userData[i].type = self.userData[weaponIndex].type
                    self.userData[i].size = self.userData[weaponIndex].size
                    self.userData[i].red = self.userData[weaponIndex].red
                    self.userData[i].green = self.userData[weaponIndex].green
                    self.userData[i].blue = self.userData[weaponIndex].blue
                    self.userData[i].alpha = self.userData[weaponIndex].alpha
                    self.userData[i].strokeRed = self.userData[weaponIndex].strokeRed
                    self.userData[i].strokeGreen = self.userData[weaponIndex].strokeGreen
                    self.userData[i].strokeBlue = self.userData[weaponIndex].strokeBlue
                    self.userData[i].strokeAlpha = self.userData[weaponIndex].strokeAlpha
                    self.userData[i].health = self.userData[weaponIndex].health
                    self.userData[i].weight = self.userData[weaponIndex].weight
                    self.userData[i].strokeWeight = self.userData[weaponIndex].strokeWeight
                    self.userData[i].stroke = self.userData[weaponIndex].stroke
                    self.userData[i].color = self.userData[weaponIndex].color
                    self.userData[i].strokeColor = self.userData[weaponIndex].strokeColor
                    self.userData[i].type2 = self.userData[weaponIndex].type
                    self.userData[i].size2 = self.userData[weaponIndex].size
                    self.userData[i].red2 = self.userData[weaponIndex].red
                    self.userData[i].green2 = self.userData[weaponIndex].green
                    self.userData[i].blue2 = self.userData[weaponIndex].blue
                    self.userData[i].alpha2 = self.userData[weaponIndex].alpha
                    self.userData[i].strokeRed2 = self.userData[weaponIndex].strokeRed
                    self.userData[i].strokeGreen2 = self.userData[weaponIndex].strokeGreen
                    self.userData[i].strokeBlue2 = self.userData[weaponIndex].strokeBlue
                    self.userData[i].strokeAlpha2 = self.userData[weaponIndex].strokeAlpha
                    self.userData[i].health2 = self.userData[weaponIndex].health
                    self.userData[i].weight2 = self.userData[weaponIndex].weight
                    self.userData[i].strokeWeight2 = self.userData[weaponIndex].strokeWeight
                    self.userData[i].stroke2 = self.userData[weaponIndex].stroke
                    self.userData[i].color2 = self.userData[weaponIndex].color
                    self.userData[i].strokeColor2 = self.userData[weaponIndex].strokeColor
                end
            end
            self.userData[0].type = self.userData[weaponIndex].type
            self.userData[0].size = self.userData[weaponIndex].size
            self.userData[0].red = self.userData[weaponIndex].red
            self.userData[0].green = self.userData[weaponIndex].green
            self.userData[0].blue = self.userData[weaponIndex].blue
            self.userData[0].alpha = self.userData[weaponIndex].alpha
            self.userData[0].strokeRed = self.userData[weaponIndex].strokeRed
            self.userData[0].strokeGreen = self.userData[weaponIndex].strokeGreen
            self.userData[0].strokeBlue = self.userData[weaponIndex].strokeBlue
            self.userData[0].strokeAlpha = self.userData[weaponIndex].strokeAlpha
            self.userData[0].health = self.userData[weaponIndex].health
            self.userData[0].weight = self.userData[weaponIndex].weight
            self.userData[0].strokeWeight = self.userData[weaponIndex].strokeWeight
            self.userData[0].stroke = self.userData[weaponIndex].stroke
            self.userData[0].color = Color(
                                       self.userData[weaponIndex].red, 
                                       self.userData[weaponIndex].green, 
                                       self.userData[weaponIndex].blue,
                                       self.userData[weaponIndex].alpha)
            self.userData[0].strokeColor = Color(
                                       self.userData[weaponIndex].strokeRed, 
                                       self.userData[weaponIndex].strokeGreen, 
                                       self.userData[weaponIndex].strokeBlue,
                                       self.userData[weaponIndex].strokeAlpha)
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
            self.userData[weaponIndex].gunX = uiEditBox(self.userData[weaponIndex].gunX, x + spacing, y, 60)
            spacing = spacing + 110
            self.userData[weaponIndex].gunY = uiEditBox(self.userData[weaponIndex].gunY, x + spacing, y, 60)
            spacing = spacing + 100
            self.userData[weaponIndex].gunZ = uiEditBox(self.userData[weaponIndex].gunZ, x + spacing, y, 60)
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
        local height = 280
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
        uiLabel("Type", x + 10, y)
        defaultCrosshair(weaponIndex)
        m = mouseRegion(x + 5, y, 80, 65, optionalId);
        if m.mouseInside then
            for i = 1, 16 do
                if self.userData[0].dc == 1 then
                    if i == tonumber(self.userData[weaponIndex].type) then
                        nvgFillColor(Color(200, 0, 0, 255))
                    else
                        nvgFillColor(Color(180, 180, 180, 255))
                    end
                else
                    if i == tonumber(self.userData[weaponIndex].type2) then
                        nvgFillColor(Color(200, 0, 0, 255))
                    else
                        nvgFillColor(Color(180, 180, 180, 255))
                    end
                end
                nvgTextAlign(NVG_ALIGN_CENTER, NVG_ALIGN_BOTTOM)
                nvgText(i * 36 - 10, 55 - 260, i)
                local crosshairHalfSize = 10
                local crosshairHalfWeight = self.userData[0].weight / 2
                local crosshairWeight = self.userData[0].weight
                local crosshairStrokeWeight = self.userData[0].strokeWeight
                local crosshairSize = 20
                local crosshairFillColor = Color(0, 160, 0, 255)
                local crosshairStrokeColor = Color(0, 0, 0, 255)
                if i == 1 then
                    nvgBeginPath();
                    nvgRect(-crosshairHalfSize + i * 36 - 10, -crosshairHalfWeight + 55 - 300, crosshairSize, crosshairWeight) -- horizontal
                    nvgRect(-crosshairHalfWeight + i * 36 - 10, -crosshairHalfSize + 55 - 300, crosshairWeight, crosshairSize) -- vertical
                    nvgStrokeColor(crosshairStrokeColor);
                    nvgStrokeWidth(crosshairStrokeWeight);
                    nvgStroke();
                    nvgFillColor(crosshairFillColor); 
                    nvgFill();
                elseif i == 2 then
                    local innerSpace = 0.65;
                    nvgBeginPath();
                    nvgRect(-crosshairHalfSize + i * 36 - 10, -crosshairHalfWeight + 55 - 300, crosshairHalfSize * innerSpace, crosshairWeight) -- left
                    nvgRect(-crosshairHalfWeight + i * 36 - 10, -crosshairHalfSize + 55 - 300, crosshairWeight, crosshairHalfSize * innerSpace) -- top
                    nvgRect(crosshairHalfSize + i * 36 - 10, crosshairHalfWeight + 55 - 300, -crosshairHalfSize * innerSpace, -crosshairWeight) -- right
                    nvgRect(crosshairHalfWeight + i * 36 - 10, crosshairHalfSize + 55 - 300, -crosshairWeight, -crosshairHalfSize * innerSpace) -- bottom
                    nvgStrokeColor(crosshairStrokeColor);
                    nvgStrokeWidth(crosshairStrokeWeight);
                    nvgStroke();
                    nvgFillColor(crosshairFillColor); 
                    nvgFill();
                elseif i == 3 then
                    local innerSpace = 0.65;
                    nvgBeginPath();
                    nvgRect(-crosshairHalfSize + i * 36 - 10, -crosshairHalfWeight + 55 - 300, crosshairHalfSize * innerSpace, crosshairWeight) -- left
                    nvgRect(-crosshairHalfWeight + i * 36 - 10, -crosshairHalfSize + 55 - 300, crosshairWeight, crosshairHalfSize * innerSpace) -- top
                    nvgRect(crosshairHalfSize + i * 36 - 10, crosshairHalfWeight + 55 - 300, -crosshairHalfSize * innerSpace, -crosshairWeight) -- right
                    nvgRect(crosshairHalfWeight + i * 36 - 10, crosshairHalfSize + 55 - 300, -crosshairWeight, -crosshairHalfSize * innerSpace) -- bottom
                    nvgRect(-crosshairHalfWeight + i * 36 - 10, -crosshairHalfWeight + 55 - 300, crosshairWeight, crosshairWeight) -- dot
                    nvgStrokeColor(crosshairStrokeColor);
                    nvgStrokeWidth(crosshairStrokeWeight);
                    nvgStroke();
                    nvgFillColor(crosshairFillColor); 
                    nvgFill();
                elseif i == 4 then
                    nvgBeginPath();
                    nvgCircle(i * 36 - 10, 55 - 300, crosshairSize / 8)
                    nvgStrokeColor(crosshairStrokeColor);
                    nvgStrokeWidth(crosshairStrokeWeight);
                    nvgStroke();
                    nvgFillColor(crosshairFillColor); 
                    nvgFill();
                elseif i == 5 then
                    nvgBeginPath();
                    nvgCircle(i * 36 - 10, 55 - 300, crosshairSize / 4)
                    nvgStrokeColor(crosshairFillColor);
                    nvgStrokeWidth(crosshairStrokeWeight / 2);
                    nvgStroke();
                elseif i >= 6 then
                    nvgBeginPath();
                    nvgFillColor(crosshairFillColor);
                    nvgSvg("internal/ui/crosshairs/crosshair" .. i, i * 36 - 10, 55 - 300, crosshairSize - 8);
                end
            end
        end
        uiLabel("Size", x + 10, y + 80)
        m = mouseRegion(x + 5, y + 80, 80, 65, optionalId);
        if m.mouseInside then
            if self.userData[0].dc == 1 then
                local size = tonumber(self.userData[weaponIndex].size)
                local type = tonumber(self.userData[weaponIndex].type)
                nvgFillColor(Color(180, 180, 180, 255))
                nvgTextAlign(NVG_ALIGN_CENTER, NVG_ALIGN_BOTTOM)
                local crosshairHalfWeight = self.userData[weaponIndex].weight / 2
                local crosshairWeight = self.userData[weaponIndex].weight
                local crosshairStrokeWeight = self.userData[weaponIndex].strokeWeight
                if size > 5 then
                    crosshairSize = size - 5
                else
                    crosshairSize = 1
                end
                local crosshairFillColor = Color(0, 160, 0, 255)
                local crosshairStrokeColor = Color(0, 0, 0, 255)
                for i = 1, 10 do
                    local crosshairHalfSize = crosshairSize / 2
                    if type == 1 then
                        nvgBeginPath();
                        nvgRect(-crosshairHalfSize + i * 60 - 40, -crosshairHalfWeight + 55 - 300, crosshairSize, crosshairWeight) -- horizontal
                        nvgRect(-crosshairHalfWeight + i * 60 - 40, -crosshairHalfSize + 55 - 300, crosshairWeight, crosshairSize) -- vertical
                        nvgStrokeColor(crosshairStrokeColor);
                        nvgStrokeWidth(crosshairStrokeWeight);
                        nvgStroke();
                        nvgFillColor(crosshairFillColor); 
                        nvgFill();
                    elseif type == 2 then
                        local innerSpace = 0.65;
                        nvgBeginPath();
                        nvgRect(-crosshairHalfSize + i * 60 - 40, -crosshairHalfWeight + 55 - 300, crosshairHalfSize * innerSpace, crosshairWeight) -- left
                        nvgRect(-crosshairHalfWeight + i * 60 - 40, -crosshairHalfSize + 55 - 300, crosshairWeight, crosshairHalfSize * innerSpace) -- top
                        nvgRect(crosshairHalfSize + i * 60 - 40, crosshairHalfWeight + 55 - 300, -crosshairHalfSize * innerSpace, -crosshairWeight) -- right
                        nvgRect(crosshairHalfWeight + i * 60 - 40, crosshairHalfSize + 55 - 300, -crosshairWeight, -crosshairHalfSize * innerSpace) -- bottom
                        nvgStrokeColor(crosshairStrokeColor);
                        nvgStrokeWidth(crosshairStrokeWeight);
                        nvgStroke();
                        nvgFillColor(crosshairFillColor); 
                        nvgFill();
                    elseif type == 3 then
                        local innerSpace = 0.65;
                        nvgBeginPath();
                        nvgRect(-crosshairHalfSize + i * 60 - 40, -crosshairHalfWeight + 55 - 300, crosshairHalfSize * innerSpace, crosshairWeight) -- left
                        nvgRect(-crosshairHalfWeight + i * 60 - 40, -crosshairHalfSize + 55 - 300, crosshairWeight, crosshairHalfSize * innerSpace) -- top
                        nvgRect(crosshairHalfSize + i * 60 - 40, crosshairHalfWeight + 55 - 300, -crosshairHalfSize * innerSpace, -crosshairWeight) -- right
                        nvgRect(crosshairHalfWeight + i * 60 - 40, crosshairHalfSize + 55 - 300, -crosshairWeight, -crosshairHalfSize * innerSpace) -- bottom
                        nvgRect(-crosshairHalfWeight + i * 60 - 40, -crosshairHalfWeight + 55 - 300, crosshairWeight, crosshairWeight) -- dot
                        nvgStrokeColor(crosshairStrokeColor);
                        nvgStrokeWidth(crosshairStrokeWeight);
                        nvgStroke();
                        nvgFillColor(crosshairFillColor); 
                        nvgFill();
                    elseif type == 4 then
                        nvgBeginPath();
                        nvgCircle(i * 60 - 40, 55 - 300, crosshairSize / 8)
                        nvgStrokeColor(crosshairStrokeColor);
                        nvgStrokeWidth(crosshairStrokeWeight);
                        nvgStroke();
                        nvgFillColor(crosshairFillColor); 
                        nvgFill();
                    elseif type == 5 then
                        nvgBeginPath();
                        nvgCircle(i * 60 - 40, 55 - 300, crosshairSize / 4)
                        nvgStrokeColor(crosshairFillColor);
                        nvgStrokeWidth(crosshairStrokeWeight / 2);
                        nvgStroke();
                    elseif type >= 6 then
                        nvgBeginPath();
                        nvgFillColor(crosshairFillColor);
                        nvgSvg("internal/ui/crosshairs/crosshair" .. type, i * 60 - 40, 55 - 300, crosshairSize);
                    end
                    crosshairSize = crosshairSize + 1
                    if self.userData[0].dc == 1 then
                        if crosshairSize == tonumber(self.userData[weaponIndex].size) then
                            nvgFillColor(Color(200, 0, 0, 255))
                        else
                            nvgFillColor(Color(180, 180, 180, 255))
                        end
                    else
                        if crosshairSize == tonumber(self.userData[weaponIndex].size2) then
                            nvgFillColor(Color(200, 0, 0, 255))
                        else
                            nvgFillColor(Color(180, 180, 180, 255))
                        end
                    end
                    nvgTextAlign(NVG_ALIGN_CENTER, NVG_ALIGN_BOTTOM)
                    nvgText(i * 60 - 40, 55 - 250, crosshairSize)
                end
            else
                local size = tonumber(self.userData[weaponIndex].size2)
                local type = tonumber(self.userData[weaponIndex].type2)
                nvgFillColor(Color(180, 180, 180, 255))
                nvgTextAlign(NVG_ALIGN_CENTER, NVG_ALIGN_BOTTOM)
                local crosshairHalfWeight = self.userData[weaponIndex].weight2 / 2
                local crosshairWeight = self.userData[weaponIndex].weight2
                local crosshairStrokeWeight = self.userData[weaponIndex].strokeWeight2
                if size > 5 then
                    crosshairSize = size - 5
                else
                    crosshairSize = 1
                end
                local crosshairFillColor = Color(0, 160, 0, 255)
                local crosshairStrokeColor = Color(0, 0, 0, 255)
                for i = 1, 10 do
                    local crosshairHalfSize = crosshairSize / 2
                    if type == 1 then
                        nvgBeginPath();
                        nvgRect(-crosshairHalfSize + i * 60 - 40, -crosshairHalfWeight + 55 - 300, crosshairSize, crosshairWeight) -- horizontal
                        nvgRect(-crosshairHalfWeight + i * 60 - 40, -crosshairHalfSize + 55 - 300, crosshairWeight, crosshairSize) -- vertical
                        nvgStrokeColor(crosshairStrokeColor);
                        nvgStrokeWidth(crosshairStrokeWeight);
                        nvgStroke();
                        nvgFillColor(crosshairFillColor); 
                        nvgFill();
                    elseif type == 2 then
                        local innerSpace = 0.65;
                        nvgBeginPath();
                        nvgRect(-crosshairHalfSize + i * 60 - 40, -crosshairHalfWeight + 55 - 300, crosshairHalfSize * innerSpace, crosshairWeight) -- left
                        nvgRect(-crosshairHalfWeight + i * 60 - 40, -crosshairHalfSize + 55 - 300, crosshairWeight, crosshairHalfSize * innerSpace) -- top
                        nvgRect(crosshairHalfSize + i * 60 - 40, crosshairHalfWeight + 55 - 300, -crosshairHalfSize * innerSpace, -crosshairWeight) -- right
                        nvgRect(crosshairHalfWeight + i * 60 - 40, crosshairHalfSize + 55 - 300, -crosshairWeight, -crosshairHalfSize * innerSpace) -- bottom
                        nvgStrokeColor(crosshairStrokeColor);
                        nvgStrokeWidth(crosshairStrokeWeight);
                        nvgStroke();
                        nvgFillColor(crosshairFillColor); 
                        nvgFill();
                    elseif type == 3 then
                        local innerSpace = 0.65;
                        nvgBeginPath();
                        nvgRect(-crosshairHalfSize + i * 60 - 40, -crosshairHalfWeight + 55 - 300, crosshairHalfSize * innerSpace, crosshairWeight) -- left
                        nvgRect(-crosshairHalfWeight + i * 60 - 40, -crosshairHalfSize + 55 - 300, crosshairWeight, crosshairHalfSize * innerSpace) -- top
                        nvgRect(crosshairHalfSize + i * 60 - 40, crosshairHalfWeight + 55 - 300, -crosshairHalfSize * innerSpace, -crosshairWeight) -- right
                        nvgRect(crosshairHalfWeight + i * 60 - 40, crosshairHalfSize + 55 - 300, -crosshairWeight, -crosshairHalfSize * innerSpace) -- bottom
                        nvgRect(-crosshairHalfWeight + i * 60 - 40, -crosshairHalfWeight + 55 - 300, crosshairWeight, crosshairWeight) -- dot
                        nvgStrokeColor(crosshairStrokeColor);
                        nvgStrokeWidth(crosshairStrokeWeight);
                        nvgStroke();
                        nvgFillColor(crosshairFillColor); 
                        nvgFill();
                    elseif type == 4 then
                        nvgBeginPath();
                        nvgCircle(i * 60 - 40, 55 - 300, crosshairSize / 8)
                        nvgStrokeColor(crosshairStrokeColor);
                        nvgStrokeWidth(crosshairStrokeWeight);
                        nvgStroke();
                        nvgFillColor(crosshairFillColor); 
                        nvgFill();
                    elseif type == 5 then
                        nvgBeginPath();
                        nvgCircle(i * 60 - 40, 55 - 300, crosshairSize / 4)
                        nvgStrokeColor(crosshairFillColor);
                        nvgStrokeWidth(crosshairStrokeWeight / 2);
                        nvgStroke();
                    elseif type >= 6 then
                        nvgBeginPath();
                        nvgFillColor(crosshairFillColor);
                        nvgSvg("internal/ui/crosshairs/crosshair" .. type, i * 60 - 40, 55 - 300, crosshairSize);
                    end
                    crosshairSize = crosshairSize + 1
                    if self.userData[0].dc == 1 then
                        if crosshairSize == tonumber(self.userData[weaponIndex].size) then
                            nvgFillColor(Color(200, 0, 0, 255))
                        else
                            nvgFillColor(Color(180, 180, 180, 255))
                        end
                    else
                        if crosshairSize == tonumber(self.userData[weaponIndex].size2) then
                            nvgFillColor(Color(200, 0, 0, 255))
                        else
                            nvgFillColor(Color(180, 180, 180, 255))
                        end
                    end
                    nvgTextAlign(NVG_ALIGN_CENTER, NVG_ALIGN_BOTTOM)
                    nvgText(i * 60 - 40, 55 - 250, crosshairSize)
                end
            end
        end
        uiLabel("Weight", x + 10, y + 160)
        m = mouseRegion(x + 5, y + 160, 80, 65, optionalId);
        if m.mouseInside then
            if self.userData[0].dc == 1 then
                crosshairSize = tonumber(self.userData[weaponIndex].size)
                local type = tonumber(self.userData[weaponIndex].type)
                nvgFillColor(Color(180, 180, 180, 255))
                nvgTextAlign(NVG_ALIGN_CENTER, NVG_ALIGN_BOTTOM)
                crosshairHalfWeight = self.userData[weaponIndex].weight / 2
                weight = self.userData[weaponIndex].weight
                crosshairStrokeWeight = self.userData[weaponIndex].strokeWeight
                local crosshairHalfSize = crosshairSize / 2
                if weight >= 1 then
                    crosshairWeight = weight - 1
                else
                    crosshairWeight = 0
                end
                local crosshairFillColor = Color(0, 160, 0, 255)
                local crosshairStrokeColor = Color(0, 0, 0, 255)
                for i = 1, 10 do
                    local crosshairHalfWeight = crosshairWeight / 2
                    if type == 1 then
                        nvgBeginPath();
                        nvgRect(-crosshairHalfSize + i * 60 - 40, -crosshairHalfWeight + 55 - 300, crosshairSize, crosshairWeight) -- horizontal
                        nvgRect(-crosshairHalfWeight + i * 60 - 40, -crosshairHalfSize + 55 - 300, crosshairWeight, crosshairSize) -- vertical
                        nvgStrokeColor(crosshairStrokeColor);
                        nvgStrokeWidth(crosshairStrokeWeight);
                        nvgStroke();
                        nvgFillColor(crosshairFillColor); 
                        nvgFill();
                    elseif type == 2 then
                        local innerSpace = 0.65;
                        nvgBeginPath();
                        nvgRect(-crosshairHalfSize + i * 60 - 40, -crosshairHalfWeight + 55 - 300, crosshairHalfSize * innerSpace, crosshairWeight) -- left
                        nvgRect(-crosshairHalfWeight + i * 60 - 40, -crosshairHalfSize + 55 - 300, crosshairWeight, crosshairHalfSize * innerSpace) -- top
                        nvgRect(crosshairHalfSize + i * 60 - 40, crosshairHalfWeight + 55 - 300, -crosshairHalfSize * innerSpace, -crosshairWeight) -- right
                        nvgRect(crosshairHalfWeight + i * 60 - 40, crosshairHalfSize + 55 - 300, -crosshairWeight, -crosshairHalfSize * innerSpace) -- bottom
                        nvgStrokeColor(crosshairStrokeColor);
                        nvgStrokeWidth(crosshairStrokeWeight);
                        nvgStroke();
                        nvgFillColor(crosshairFillColor); 
                        nvgFill();
                    elseif type == 3 then
                        local innerSpace = 0.65;
                        nvgBeginPath();
                        nvgRect(-crosshairHalfSize + i * 60 - 40, -crosshairHalfWeight + 55 - 300, crosshairHalfSize * innerSpace, crosshairWeight) -- left
                        nvgRect(-crosshairHalfWeight + i * 60 - 40, -crosshairHalfSize + 55 - 300, crosshairWeight, crosshairHalfSize * innerSpace) -- top
                        nvgRect(crosshairHalfSize + i * 60 - 40, crosshairHalfWeight + 55 - 300, -crosshairHalfSize * innerSpace, -crosshairWeight) -- right
                        nvgRect(crosshairHalfWeight + i * 60 - 40, crosshairHalfSize + 55 - 300, -crosshairWeight, -crosshairHalfSize * innerSpace) -- bottom
                        nvgRect(-crosshairHalfWeight + i * 60 - 40, -crosshairHalfWeight + 55 - 300, crosshairWeight, crosshairWeight) -- dot
                        nvgStrokeColor(crosshairStrokeColor);
                        nvgStrokeWidth(crosshairStrokeWeight);
                        nvgStroke();
                        nvgFillColor(crosshairFillColor); 
                        nvgFill();
                    elseif type == 4 then
                        nvgBeginPath();
                        nvgCircle(i * 60 - 40, 55 - 300, crosshairSize / 8)
                        nvgStrokeColor(crosshairStrokeColor);
                        nvgStrokeWidth(crosshairStrokeWeight);
                        nvgStroke();
                        nvgFillColor(crosshairFillColor); 
                        nvgFill();
                    elseif type == 5 then
                        nvgBeginPath();
                        nvgCircle(i * 60 - 40, 55 - 300, crosshairSize / 4)
                        nvgStrokeColor(crosshairFillColor);
                        nvgStrokeWidth(crosshairStrokeWeight / 2);
                        nvgStroke();
                    elseif type >= 6 then
                        nvgBeginPath();
                        nvgFillColor(crosshairFillColor);
                        nvgSvg("internal/ui/crosshairs/crosshair" .. type, i * 60 - 40, 55 - 300, crosshairSize);
                    end
                    crosshairWeight = crosshairWeight + 0.2
                    if i == 5 then
                        nvgFillColor(Color(200, 0, 0, 255))
                    else
                        nvgFillColor(Color(180, 180, 180, 255))
                    end
                    nvgTextAlign(NVG_ALIGN_CENTER, NVG_ALIGN_BOTTOM)
                    nvgText(i * 60 - 40, 55 - 250, crosshairWeight)
                end
            else
                crosshairSize = tonumber(self.userData[weaponIndex].size2)
                local type = tonumber(self.userData[weaponIndex].type2)
                nvgFillColor(Color(180, 180, 180, 255))
                nvgTextAlign(NVG_ALIGN_CENTER, NVG_ALIGN_BOTTOM)
                crosshairHalfWeight = self.userData[weaponIndex].weight2 / 2
                weight = self.userData[weaponIndex].weight2
                crosshairStrokeWeight = self.userData[weaponIndex].strokeWeight2
                local crosshairHalfSize = crosshairSize / 2
                if weight >= 1 then
                    crosshairWeight = weight - 1
                else
                    crosshairWeight = 0
                end
                local crosshairFillColor = Color(0, 160, 0, 255)
                local crosshairStrokeColor = Color(0, 0, 0, 255)
                for i = 1, 10 do
                    local crosshairHalfWeight = crosshairWeight / 2
                    if type == 1 then
                        nvgBeginPath();
                        nvgRect(-crosshairHalfSize + i * 60 - 40, -crosshairHalfWeight + 55 - 300, crosshairSize, crosshairWeight) -- horizontal
                        nvgRect(-crosshairHalfWeight + i * 60 - 40, -crosshairHalfSize + 55 - 300, crosshairWeight, crosshairSize) -- vertical
                        nvgStrokeColor(crosshairStrokeColor);
                        nvgStrokeWidth(crosshairStrokeWeight);
                        nvgStroke();
                        nvgFillColor(crosshairFillColor); 
                        nvgFill();
                    elseif type == 2 then
                        local innerSpace = 0.65;
                        nvgBeginPath();
                        nvgRect(-crosshairHalfSize + i * 60 - 40, -crosshairHalfWeight + 55 - 300, crosshairHalfSize * innerSpace, crosshairWeight) -- left
                        nvgRect(-crosshairHalfWeight + i * 60 - 40, -crosshairHalfSize + 55 - 300, crosshairWeight, crosshairHalfSize * innerSpace) -- top
                        nvgRect(crosshairHalfSize + i * 60 - 40, crosshairHalfWeight + 55 - 300, -crosshairHalfSize * innerSpace, -crosshairWeight) -- right
                        nvgRect(crosshairHalfWeight + i * 60 - 40, crosshairHalfSize + 55 - 300, -crosshairWeight, -crosshairHalfSize * innerSpace) -- bottom
                        nvgStrokeColor(crosshairStrokeColor);
                        nvgStrokeWidth(crosshairStrokeWeight);
                        nvgStroke();
                        nvgFillColor(crosshairFillColor); 
                        nvgFill();
                    elseif type == 3 then
                        local innerSpace = 0.65;
                        nvgBeginPath();
                        nvgRect(-crosshairHalfSize + i * 60 - 40, -crosshairHalfWeight + 55 - 300, crosshairHalfSize * innerSpace, crosshairWeight) -- left
                        nvgRect(-crosshairHalfWeight + i * 60 - 40, -crosshairHalfSize + 55 - 300, crosshairWeight, crosshairHalfSize * innerSpace) -- top
                        nvgRect(crosshairHalfSize + i * 60 - 40, crosshairHalfWeight + 55 - 300, -crosshairHalfSize * innerSpace, -crosshairWeight) -- right
                        nvgRect(crosshairHalfWeight + i * 60 - 40, crosshairHalfSize + 55 - 300, -crosshairWeight, -crosshairHalfSize * innerSpace) -- bottom
                        nvgRect(-crosshairHalfWeight + i * 60 - 40, -crosshairHalfWeight + 55 - 300, crosshairWeight, crosshairWeight) -- dot
                        nvgStrokeColor(crosshairStrokeColor);
                        nvgStrokeWidth(crosshairStrokeWeight);
                        nvgStroke();
                        nvgFillColor(crosshairFillColor); 
                        nvgFill();
                    elseif type == 4 then
                        nvgBeginPath();
                        nvgCircle(i * 60 - 40, 55 - 300, crosshairSize / 8)
                        nvgStrokeColor(crosshairStrokeColor);
                        nvgStrokeWidth(crosshairStrokeWeight);
                        nvgStroke();
                        nvgFillColor(crosshairFillColor); 
                        nvgFill();
                    elseif type == 5 then
                        nvgBeginPath();
                        nvgCircle(i * 60 - 40, 55 - 300, crosshairSize / 4)
                        nvgStrokeColor(crosshairFillColor);
                        nvgStrokeWidth(crosshairStrokeWeight / 2);
                        nvgStroke();
                    elseif type >= 6 then
                        nvgBeginPath();
                        nvgFillColor(crosshairFillColor);
                        nvgSvg("internal/ui/crosshairs/crosshair" .. type, i * 60 - 40, 55 - 300, crosshairSize);
                    end
                    crosshairWeight = crosshairWeight + 0.2
                    if i == 5 then
                        nvgFillColor(Color(200, 0, 0, 255))
                    else
                        nvgFillColor(Color(180, 180, 180, 255))
                    end
                    nvgTextAlign(NVG_ALIGN_CENTER, NVG_ALIGN_BOTTOM)
                    nvgText(i * 60 - 40, 55 - 250, crosshairWeight)
                end
            end
        end
        uiLabel("Stroke weight", x + 95, y)
        m = mouseRegion(x + 90, y, 80, 65, optionalId);
        if m.mouseInside then
            if self.userData[0].dc == 1 then
                crosshairSize = tonumber(self.userData[weaponIndex].size)
                local type = tonumber(self.userData[weaponIndex].type)
                nvgFillColor(Color(180, 180, 180, 255))
                nvgTextAlign(NVG_ALIGN_CENTER, NVG_ALIGN_BOTTOM)
                crosshairHalfWeight = self.userData[weaponIndex].weight / 2
                crosshairWeight = self.userData[weaponIndex].weight
                strokeWeight = self.userData[weaponIndex].strokeWeight
                local crosshairHalfSize = crosshairSize / 2
                if strokeWeight >= 1 then
                    crosshairStrokeWeight = strokeWeight - 1
                else
                    crosshairStrokeWeight = 0
                end
                local crosshairFillColor = Color(0, 160, 0, 255)
                local crosshairStrokeColor = Color(0, 0, 0, 255)
                for i = 1, 10 do
                    if type == 1 then
                        nvgBeginPath();
                        nvgRect(-crosshairHalfSize + i * 60 - 40, -crosshairHalfWeight + 55 - 300, crosshairSize, crosshairWeight) -- horizontal
                        nvgRect(-crosshairHalfWeight + i * 60 - 40, -crosshairHalfSize + 55 - 300, crosshairWeight, crosshairSize) -- vertical
                        nvgStrokeColor(crosshairStrokeColor);
                        nvgStrokeWidth(crosshairStrokeWeight);
                        nvgStroke();
                        nvgFillColor(crosshairFillColor); 
                        nvgFill();
                    elseif type == 2 then
                        local innerSpace = 0.65;
                        nvgBeginPath();
                        nvgRect(-crosshairHalfSize + i * 60 - 40, -crosshairHalfWeight + 55 - 300, crosshairHalfSize * innerSpace, crosshairWeight) -- left
                        nvgRect(-crosshairHalfWeight + i * 60 - 40, -crosshairHalfSize + 55 - 300, crosshairWeight, crosshairHalfSize * innerSpace) -- top
                        nvgRect(crosshairHalfSize + i * 60 - 40, crosshairHalfWeight + 55 - 300, -crosshairHalfSize * innerSpace, -crosshairWeight) -- right
                        nvgRect(crosshairHalfWeight + i * 60 - 40, crosshairHalfSize + 55 - 300, -crosshairWeight, -crosshairHalfSize * innerSpace) -- bottom
                        nvgStrokeColor(crosshairStrokeColor);
                        nvgStrokeWidth(crosshairStrokeWeight);
                        nvgStroke();
                        nvgFillColor(crosshairFillColor); 
                        nvgFill();
                    elseif type == 3 then
                        local innerSpace = 0.65;
                        nvgBeginPath();
                        nvgRect(-crosshairHalfSize + i * 60 - 40, -crosshairHalfWeight + 55 - 300, crosshairHalfSize * innerSpace, crosshairWeight) -- left
                        nvgRect(-crosshairHalfWeight + i * 60 - 40, -crosshairHalfSize + 55 - 300, crosshairWeight, crosshairHalfSize * innerSpace) -- top
                        nvgRect(crosshairHalfSize + i * 60 - 40, crosshairHalfWeight + 55 - 300, -crosshairHalfSize * innerSpace, -crosshairWeight) -- right
                        nvgRect(crosshairHalfWeight + i * 60 - 40, crosshairHalfSize + 55 - 300, -crosshairWeight, -crosshairHalfSize * innerSpace) -- bottom
                        nvgRect(-crosshairHalfWeight + i * 60 - 40, -crosshairHalfWeight + 55 - 300, crosshairWeight, crosshairWeight) -- dot
                        nvgStrokeColor(crosshairStrokeColor);
                        nvgStrokeWidth(crosshairStrokeWeight);
                        nvgStroke();
                        nvgFillColor(crosshairFillColor); 
                        nvgFill();
                    elseif type == 4 then
                        nvgBeginPath();
                        nvgCircle(i * 60 - 40, 55 - 300, crosshairSize / 8)
                        nvgStrokeColor(crosshairStrokeColor);
                        nvgStrokeWidth(crosshairStrokeWeight);
                        nvgStroke();
                        nvgFillColor(crosshairFillColor); 
                        nvgFill();
                    elseif type == 5 then
                        nvgBeginPath();
                        nvgCircle(i * 60 - 40, 55 - 300, crosshairSize / 4)
                        nvgStrokeColor(crosshairFillColor);
                        nvgStrokeWidth(crosshairStrokeWeight / 2);
                        nvgStroke();
                    elseif type >= 6 then
                        nvgBeginPath();
                        nvgFillColor(crosshairFillColor);
                        nvgSvg("internal/ui/crosshairs/crosshair" .. type, i * 60 - 40, 55 - 300, crosshairSize);
                    end
                    crosshairStrokeWeight = crosshairStrokeWeight + 0.2
                    if i == 5 then
                        nvgFillColor(Color(200, 0, 0, 255))
                    else
                        nvgFillColor(Color(180, 180, 180, 255))
                    end
                    nvgTextAlign(NVG_ALIGN_CENTER, NVG_ALIGN_BOTTOM)
                    nvgText(i * 60 - 40, 55 - 250, crosshairStrokeWeight)
                end
            else
                crosshairSize = tonumber(self.userData[weaponIndex].size2)
                local type = tonumber(self.userData[weaponIndex].type2)
                nvgFillColor(Color(180, 180, 180, 255))
                nvgTextAlign(NVG_ALIGN_CENTER, NVG_ALIGN_BOTTOM)
                crosshairHalfWeight = self.userData[weaponIndex].weight2 / 2
                crosshairWeight = self.userData[weaponIndex].weight2
                strokeWeight = self.userData[weaponIndex].strokeWeight2
                local crosshairHalfSize = crosshairSize / 2
                if strokeWeight >= 1 then
                    crosshairStrokeWeight = strokeWeight - 1
                else
                    crosshairStrokeWeight = 0
                end
                local crosshairFillColor = Color(0, 160, 0, 255)
                local crosshairStrokeColor = Color(0, 0, 0, 255)
                for i = 1, 10 do
                    if type == 1 then
                        nvgBeginPath();
                        nvgRect(-crosshairHalfSize + i * 60 - 40, -crosshairHalfWeight + 55 - 300, crosshairSize, crosshairWeight) -- horizontal
                        nvgRect(-crosshairHalfWeight + i * 60 - 40, -crosshairHalfSize + 55 - 300, crosshairWeight, crosshairSize) -- vertical
                        nvgStrokeColor(crosshairStrokeColor);
                        nvgStrokeWidth(crosshairStrokeWeight);
                        nvgStroke();
                        nvgFillColor(crosshairFillColor); 
                        nvgFill();
                    elseif type == 2 then
                        local innerSpace = 0.65;
                        nvgBeginPath();
                        nvgRect(-crosshairHalfSize + i * 60 - 40, -crosshairHalfWeight + 55 - 300, crosshairHalfSize * innerSpace, crosshairWeight) -- left
                        nvgRect(-crosshairHalfWeight + i * 60 - 40, -crosshairHalfSize + 55 - 300, crosshairWeight, crosshairHalfSize * innerSpace) -- top
                        nvgRect(crosshairHalfSize + i * 60 - 40, crosshairHalfWeight + 55 - 300, -crosshairHalfSize * innerSpace, -crosshairWeight) -- right
                        nvgRect(crosshairHalfWeight + i * 60 - 40, crosshairHalfSize + 55 - 300, -crosshairWeight, -crosshairHalfSize * innerSpace) -- bottom
                        nvgStrokeColor(crosshairStrokeColor);
                        nvgStrokeWidth(crosshairStrokeWeight);
                        nvgStroke();
                        nvgFillColor(crosshairFillColor); 
                        nvgFill();
                    elseif type == 3 then
                        local innerSpace = 0.65;
                        nvgBeginPath();
                        nvgRect(-crosshairHalfSize + i * 60 - 40, -crosshairHalfWeight + 55 - 300, crosshairHalfSize * innerSpace, crosshairWeight) -- left
                        nvgRect(-crosshairHalfWeight + i * 60 - 40, -crosshairHalfSize + 55 - 300, crosshairWeight, crosshairHalfSize * innerSpace) -- top
                        nvgRect(crosshairHalfSize + i * 60 - 40, crosshairHalfWeight + 55 - 300, -crosshairHalfSize * innerSpace, -crosshairWeight) -- right
                        nvgRect(crosshairHalfWeight + i * 60 - 40, crosshairHalfSize + 55 - 300, -crosshairWeight, -crosshairHalfSize * innerSpace) -- bottom
                        nvgRect(-crosshairHalfWeight + i * 60 - 40, -crosshairHalfWeight + 55 - 300, crosshairWeight, crosshairWeight) -- dot
                        nvgStrokeColor(crosshairStrokeColor);
                        nvgStrokeWidth(crosshairStrokeWeight);
                        nvgStroke();
                        nvgFillColor(crosshairFillColor); 
                        nvgFill();
                    elseif type == 4 then
                        nvgBeginPath();
                        nvgCircle(i * 60 - 40, 55 - 300, crosshairSize / 8)
                        nvgStrokeColor(crosshairStrokeColor);
                        nvgStrokeWidth(crosshairStrokeWeight);
                        nvgStroke();
                        nvgFillColor(crosshairFillColor); 
                        nvgFill();
                    elseif type == 5 then
                        nvgBeginPath();
                        nvgCircle(i * 60 - 40, 55 - 300, crosshairSize / 4)
                        nvgStrokeColor(crosshairFillColor);
                        nvgStrokeWidth(crosshairStrokeWeight / 2);
                        nvgStroke();
                    elseif type >= 6 then
                        nvgBeginPath();
                        nvgFillColor(crosshairFillColor);
                        nvgSvg("internal/ui/crosshairs/crosshair" .. type, i * 60 - 40, 55 - 300, crosshairSize);
                    end
                    crosshairStrokeWeight = crosshairStrokeWeight + 0.2
                    if i == 5 then
                        nvgFillColor(Color(200, 0, 0, 255))
                    else
                        nvgFillColor(Color(180, 180, 180, 255))
                    end
                    nvgTextAlign(NVG_ALIGN_CENTER, NVG_ALIGN_BOTTOM)
                    nvgText(i * 60 - 40, 55 - 250, crosshairStrokeWeight)
                end
            end
        end
        uiLabel("Stroke by health", x + 95, y + 80)
        uiLabel("Fill by health", x + 95, y + 160)
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
            self.userData[weaponIndex].stroke = ui2RowCheckbox(x + 85, y + 80, 20, "", self.userData[weaponIndex].stroke)
            if self.userData[weaponIndex].stroke == false then
                if (uiButton("Edit", nil, x + 160, y + 38 + 45, btnWidth - 15, 32, colr)) then 
                    if editStroke then
                        editStroke = false
                        colr = Color(255, 255, 255, 50)
                    else
                        editStroke = true   
                        editFill = false                 
                        colr = Color(255, 0, 0, 50)
                        colrr = Color(255, 255, 255, 50)
                    end
                end
            end
            spacing = spacing + 160
            self.userData[weaponIndex].health = ui2RowCheckbox(x + 85, y + 160, 20, "", self.userData[weaponIndex].health)
            if self.userData[weaponIndex].health == false then
                if (uiButton("Edit", nil, x + 160, y + 163, btnWidth - 15, 32, colrr)) then 
                    if editFill then
                        editFill = false
                        colrr = Color(255, 255, 255, 50)
                    else
                        editFill = true   
                        editStroke = false
                        colrr = Color(255, 0, 0, 50)
                        colr = Color(255, 255, 255, 50)
                    end
                end
            end
            if self.userData[weaponIndex].health == false and editFill then
                y = y + 50
                spacing = 100
                uiColorPicker(x + 250, y - 80, self.userData[weaponIndex].color, {})
                self.userData[weaponIndex].red = self.userData[weaponIndex].color.r
                self.userData[weaponIndex].green = self.userData[weaponIndex].color.g
                self.userData[weaponIndex].blue = self.userData[weaponIndex].color.b
                self.userData[weaponIndex].alpha = self.userData[weaponIndex].color.a
                btnSpacing = 160
            elseif self.userData[weaponIndex].stroke == false and editStroke then
                y = y + 50
                spacing = 100
                uiColorPicker(x + 250, y - 80, self.userData[weaponIndex].strokeColor, {})
                self.userData[weaponIndex].strokeRed = self.userData[weaponIndex].strokeColor.r
                self.userData[weaponIndex].strokeGreen = self.userData[weaponIndex].strokeColor.g
                self.userData[weaponIndex].strokeBlue = self.userData[weaponIndex].strokeColor.b
                self.userData[weaponIndex].strokeAlpha = self.userData[weaponIndex].strokeColor.a
                btnSpacing = 160
            else
                btnSpacing = 110
            end
            if (uiButton("Ok", nil, x + width - btnWidth - 5, y - btnSpacing + 43, btnWidth, 32)) then
                    editCrosshairIndex[weaponIndex] = false
                end
            if (uiButton("Default", nil, x + width - 2 * btnWidth - 35, y - btnSpacing + 43, btnWidth + 20, 32)) then
                self.userData[weaponIndex].type = self.userData[0].type
                self.userData[weaponIndex].size = self.userData[0].size
                self.userData[weaponIndex].red = self.userData[0].red
                self.userData[weaponIndex].green = self.userData[0].green
                self.userData[weaponIndex].blue = self.userData[0].blue
                self.userData[weaponIndex].alpha = self.userData[0].alpha
                self.userData[weaponIndex].strokeRed = self.userData[0].strokeRed
                self.userData[weaponIndex].strokeGreen = self.userData[0].strokeGreen
                self.userData[weaponIndex].strokeBlue = self.userData[0].strokeBlue
                self.userData[weaponIndex].strokeAlpha = self.userData[0].strokeAlpha
                self.userData[weaponIndex].health = self.userData[0].health
                self.userData[weaponIndex].weight = self.userData[0].weight
                self.userData[weaponIndex].strokeWeight = self.userData[0].strokeWeight
                self.userData[weaponIndex].stroke = self.userData[0].stroke
                self.userData[weaponIndex].color = Color(self.userData[0].red, self.userData[0].green, self.userData[0].blue, self.userData[0].alpha)
                self.userData[weaponIndex].strokeColor = Color(self.userData[0].strokeRed, self.userData[0].strokeGreen, self.userData[0].strokeBlue, self.userData[0].strokeAlpha)
            end
            if (uiButton("Set as default", nil, x + 10, y - btnSpacing + 43, btnWidth * 2 + 5, 32)) then
                newDefaultCrosshair(weaponIndex)
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
            self.userData[weaponIndex].stroke2 = ui2RowCheckbox(x + 85, y + 80, 20, "", self.userData[weaponIndex].stroke2)
            if self.userData[weaponIndex].stroke2 == false then
                if (uiButton("Edit", nil, x + 160, y + 38 + 45, btnWidth - 15, 32, colr)) then 
                    if editStroke then
                        editStroke = false
                        colr = Color(255, 255, 255, 50)
                    else
                        editStroke = true   
                        editFill = false                 
                        colr = Color(255, 0, 0, 50)
                        colrr = Color(255, 255, 255, 50)
                    end
                end
            end
            spacing = spacing + 160
            self.userData[weaponIndex].health2 = ui2RowCheckbox(x + 85, y + 160, 20, "", self.userData[weaponIndex].health2)
            if self.userData[weaponIndex].health2 == false then
                if (uiButton("Edit", nil, x + 160, y + 163, btnWidth - 15, 32, colrr)) then 
                    if editFill then
                        editFill = false
                        colrr = Color(255, 255, 255, 50)
                    else
                        editFill = true   
                        editStroke = false
                        colrr = Color(255, 0, 0, 50)
                        colr = Color(255, 255, 255, 50)
                    end
                end
            end
            if self.userData[weaponIndex].health2 == false and editFill then
                y = y + 50
                spacing = 100
                uiColorPicker(x + 250, y - 80, self.userData[weaponIndex].color2, {})
                self.userData[weaponIndex].red2 = self.userData[weaponIndex].color2.r
                self.userData[weaponIndex].green2 = self.userData[weaponIndex].color2.g
                self.userData[weaponIndex].blue2 = self.userData[weaponIndex].color2.b
                self.userData[weaponIndex].alpha2 = self.userData[weaponIndex].color2.a
                btnSpacing = 160
            elseif self.userData[weaponIndex].stroke2 == false and editStroke then
                y = y + 50
                spacing = 100
                uiColorPicker(x + 250, y - 80, self.userData[weaponIndex].strokeColor, {})
                self.userData[weaponIndex].strokeRed2 = self.userData[weaponIndex].strokeColor2.r
                self.userData[weaponIndex].strokeGreen2 = self.userData[weaponIndex].strokeColor2.g
                self.userData[weaponIndex].strokeBlue2 = self.userData[weaponIndex].strokeColor2.b
                self.userData[weaponIndex].strokeAlpha2 = self.userData[weaponIndex].strokeColor2.a
                btnSpacing = 160
            else
                btnSpacing = 110
            end
            if (uiButton("Ok", nil, x + width - btnWidth - 5, y - btnSpacing + 43, btnWidth, 32)) then
                    editCrosshairIndex[weaponIndex] = false
                end
            if (uiButton("Default", nil, x + width - 2 * btnWidth - 35, y - btnSpacing + 43, btnWidth + 20, 32)) then
                self.userData[weaponIndex].type2 = self.userData[0].type
                self.userData[weaponIndex].size2 = self.userData[0].size
                self.userData[weaponIndex].red2 = self.userData[0].red
                self.userData[weaponIndex].green2 = self.userData[0].green
                self.userData[weaponIndex].blue2 = self.userData[0].blue
                self.userData[weaponIndex].alpha2 = self.userData[0].alpha
                self.userData[weaponIndex].strokeRed2 = self.userData[0].strokeRed2
                self.userData[weaponIndex].strokeGreen2 = self.userData[0].strokeGreen2
                self.userData[weaponIndex].strokeBlue2 = self.userData[0].strokeBlue2
                self.userData[weaponIndex].strokeAlpha2 = self.userData[0].strokeAlpha2
                self.userData[weaponIndex].health2 = self.userData[0].health
                self.userData[weaponIndex].weight2 = self.userData[0].weight
                self.userData[weaponIndex].strokeWeight2 = self.userData[0].strokeWeight
                self.userData[weaponIndex].stroke2 = self.userData[0].stroke
                self.userData[weaponIndex].color2 = Color(self.userData[0].red, self.userData[0].green, self.userData[0].blue, self.userData[0].alpha)
                self.userData[weaponIndex].strokeColor2 = Color(self.userData[0].strokeRed2, self.userData[0].strokeGreen2, self.userData[0].strokeBlue2, self.userData[0].strokeAlpha2)
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
            self.userData[weaponIndex].stroke == self.userData[0].stroke and
            self.userData[weaponIndex].mix == false and
            (self.userData[weaponIndex].health or (
                self.userData[weaponIndex].red == self.userData[0].red and
                self.userData[weaponIndex].green == self.userData[0].green and
                self.userData[weaponIndex].blue == self.userData[0].blue and
                self.userData[weaponIndex].alpha == self.userData[0].alpha
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
        if self.userData[weaponIndex].stroke then
            crosshairStrokeColor = Color(2,167,46, 255) 
        else
            crosshairStrokeColor = self.userData[weaponIndex].strokeColor
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
                if self.userData[weaponIndex].stroke2 then
                    crosshairStrokeColor2 = Color(2,167,46, 255) 
                else
                    crosshairStrokeColor2 = self.userData[weaponIndex].strokeColor2
                end 
                if crosshairType == 1 then
                    nvgBeginPath();
                    nvgRect(-crosshairHalfSize + 120, -crosshairHalfWeight + y + 15, crosshairSize, crosshairWeight) -- horizontal
                    nvgRect(-crosshairHalfWeight + 120, -crosshairHalfSize + y + 15, crosshairWeight, crosshairSize) -- vertical
                    nvgStrokeColor(crosshairStrokeColor2);
                    nvgStrokeWidth(crosshairStrokeWeight);
                    nvgStroke();
                    nvgFillColor(crosshairFillColor); 
                    nvgFill();
                end
                if crosshairType == 2 then
                    local innerSpace = 0.65;
                    nvgBeginPath();
                    nvgRect(-crosshairHalfSize + 120, -crosshairHalfWeight + y + 15, crosshairHalfSize * innerSpace, crosshairWeight) -- left
                    nvgRect(-crosshairHalfWeight + 120, -crosshairHalfSize + y + 15, crosshairWeight, crosshairHalfSize * innerSpace) -- top
                    nvgRect(crosshairHalfSize + 120, crosshairHalfWeight + y + 15, -crosshairHalfSize * innerSpace, -crosshairWeight) -- right
                    nvgRect(crosshairHalfWeight + 120, crosshairHalfSize + y + 15, -crosshairWeight, -crosshairHalfSize * innerSpace) -- bottom
                    nvgStrokeColor(crosshairStrokeColor2);
                    nvgStrokeWidth(crosshairStrokeWeight);
                    nvgStroke();
                    nvgFillColor(crosshairFillColor); 
                    nvgFill();
                end
                if crosshairType == 3 then
                    local innerSpace = 0.65;
                    nvgBeginPath();
                    nvgRect(-crosshairHalfSize + 120, -crosshairHalfWeight + y + 15, crosshairHalfSize * innerSpace, crosshairWeight) -- left
                    nvgRect(-crosshairHalfWeight + 120, -crosshairHalfSize + y + 15, crosshairWeight, crosshairHalfSize * innerSpace) -- top
                    nvgRect(crosshairHalfSize + 120, crosshairHalfWeight + y + 15, -crosshairHalfSize * innerSpace, -crosshairWeight) -- right
                    nvgRect(crosshairHalfWeight + 120, crosshairHalfSize + y + 15, -crosshairWeight, -crosshairHalfSize * innerSpace) -- bottom
                    nvgRect(-crosshairHalfWeight + 120, -crosshairHalfWeight + y + 15, crosshairWeight, crosshairWeight) -- dot
                    nvgStrokeColor(crosshairStrokeColor2);
                    nvgStrokeWidth(crosshairStrokeWeight);
                    nvgStroke();
                    nvgFillColor(crosshairFillColor); 
                    nvgFill();
                end
                if crosshairType == 4 then
                    nvgBeginPath();
                    nvgCircle(120,  y + 15, crosshairSize / 8)
                    nvgStrokeColor(crosshairStrokeColor2);
                    nvgStrokeWidth(crosshairStrokeWeight);
                    nvgStroke();
                    nvgFillColor(crosshairFillColor); 
                    nvgFill();
                end
                if crosshairType == 5 then
                    nvgBeginPath();
                    nvgCircle(120,  y + 15, crosshairSize / 4)
                    nvgStrokeColor(crosshairFillColor);
                    nvgStrokeWidth(crosshairStrokeWeight / 2);
                    nvgStroke();
                end
                if crosshairType >= 6 and crosshairType <= 16 then
                    nvgBeginPath();
                    nvgFillColor(crosshairFillColor);
                    nvgSvg("internal/ui/crosshairs/crosshair" .. crosshairType, 120,  y + 15, crosshairSize);
                end
            end
            local crosshairHalfSize = self.userData[weaponIndex].size / 2
            local crosshairHalfWeight = self.userData[weaponIndex].weight / 2
	        local crosshairType = tonumber(self.userData[weaponIndex].type)
            local crosshairWeight = self.userData[weaponIndex].weight
            local crosshairStrokeWeight = self.userData[weaponIndex].strokeWeight
            local crosshairSize = self.userData[weaponIndex].size
            if crosshairType == 1 then
                nvgBeginPath();
                nvgRect(-crosshairHalfSize + 120, -crosshairHalfWeight + y + 15, crosshairSize, crosshairWeight) -- horizontal
                nvgRect(-crosshairHalfWeight + 120, -crosshairHalfSize + y + 15, crosshairWeight, crosshairSize) -- vertical
                nvgStrokeColor(crosshairStrokeColor);
                nvgStrokeWidth(crosshairStrokeWeight);
                nvgStroke();
                nvgFillColor(crosshairFillColor); 
                nvgFill();
            end
            if crosshairType == 2 then
                local innerSpace = 0.65;
                nvgBeginPath();
                nvgRect(-crosshairHalfSize + 120, -crosshairHalfWeight + y + 15, crosshairHalfSize * innerSpace, crosshairWeight) -- left
                nvgRect(-crosshairHalfWeight + 120, -crosshairHalfSize + y + 15, crosshairWeight, crosshairHalfSize * innerSpace) -- top
                nvgRect(crosshairHalfSize + 120, crosshairHalfWeight + y + 15, -crosshairHalfSize * innerSpace, -crosshairWeight) -- right
                nvgRect(crosshairHalfWeight + 120, crosshairHalfSize + y + 15, -crosshairWeight, -crosshairHalfSize * innerSpace) -- bottom
                nvgStrokeColor(crosshairStrokeColor);
                nvgStrokeWidth(crosshairStrokeWeight);
                nvgStroke();
                nvgFillColor(crosshairFillColor); 
                nvgFill();
            end
            if crosshairType == 3 then
                local innerSpace = 0.65;
                nvgBeginPath();
                nvgRect(-crosshairHalfSize + 120, -crosshairHalfWeight + y + 15, crosshairHalfSize * innerSpace, crosshairWeight) -- left
                nvgRect(-crosshairHalfWeight + 120, -crosshairHalfSize + y + 15, crosshairWeight, crosshairHalfSize * innerSpace) -- top
                nvgRect(crosshairHalfSize + 120, crosshairHalfWeight + y + 15, -crosshairHalfSize * innerSpace, -crosshairWeight) -- right
                nvgRect(crosshairHalfWeight + 120, crosshairHalfSize + y + 15, -crosshairWeight, -crosshairHalfSize * innerSpace) -- bottom
                nvgRect(-crosshairHalfWeight + 120, -crosshairHalfWeight + y + 15, crosshairWeight, crosshairWeight) -- dot
                nvgStrokeColor(crosshairStrokeColor);
                nvgStrokeWidth(crosshairStrokeWeight);
                nvgStroke();
                nvgFillColor(crosshairFillColor); 
                nvgFill();
            end
            if crosshairType == 4 then
                nvgBeginPath();
                nvgCircle(120,  y + 15, crosshairSize / 8)
                nvgStrokeColor(crosshairStrokeColor);
                nvgStrokeWidth(crosshairStrokeWeight);
                nvgStroke();
                nvgFillColor(crosshairFillColor); 
                nvgFill();
            end
            if crosshairType == 5 then
                nvgBeginPath();
                nvgCircle(120,  y + 15, crosshairSize / 4)
                nvgStrokeColor(crosshairFillColor);
                nvgStrokeWidth(crosshairStrokeWeight / 2);
                nvgStroke();
            end
            if crosshairType >= 6 and crosshairType <= 16 then
                nvgBeginPath();
                nvgFillColor(crosshairFillColor);
                nvgSvg("internal/ui/crosshairs/crosshair" .. crosshairType, 120,  y + 15, crosshairSize);
            end
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
        y = y + 10
    end
end

function Nice_WeaponSettings:drawOptions(x, y)
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

function Nice_WeaponSettings:draw()
    if not shouldShowHUD() then
        Nice_WeaponSettings.index = 0
        return
    end

    -- get player, reset if not the same
    local player = getPlayer()
    if player == nil or player.index ~= Nice_WeaponSettings.index then
        Nice_WeaponSettings.index = player.index
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
    if self.userData[player.weaponIndexSelected].type  ~= consoleGetVariable("ui_nice_crosshairs_type") then
        consolePerformCommand("ui_nice_crosshairs_type " .. self.userData[player.weaponIndexSelected].type )
    end
    
    --size
    if Nice_Crosshairs.userData.crosshairSize ~= self.userData[player.weaponIndexSelected].size then
        Nice_Crosshairs.userData.crosshairSize = self.userData[player.weaponIndexSelected].size
    end

    --weight
    if Nice_Crosshairs.userData.crosshairWeight ~= self.userData[player.weaponIndexSelected].weight then
        Nice_Crosshairs.userData.crosshairWeight = self.userData[player.weaponIndexSelected].weight
    end

    --stroke weight
    if Nice_Crosshairs.userData.crosshairStrokeWeight ~= self.userData[player.weaponIndexSelected].strokeWeight then
        Nice_Crosshairs.userData.crosshairStrokeWeight = self.userData[player.weaponIndexSelected].strokeWeight
    end

    --color by health
    if Nice_Crosshairs.userData.colorFillByHealth ~= self.userData[player.weaponIndexSelected].health then
        Nice_Crosshairs.userData.colorFillByHealth = self.userData[player.weaponIndexSelected].health
    elseif self.userData[player.weaponIndexSelected].health == false then
        --red
        if self.userData[player.weaponIndexSelected].red  ~= consoleGetVariable("ui_nice_crosshairs_r") then
            consolePerformCommand("ui_nice_crosshairs_r " .. self.userData[player.weaponIndexSelected].red )
        end
        --green
        if self.userData[player.weaponIndexSelected].green ~= consoleGetVariable("ui_nice_crosshairs_g") then
            consolePerformCommand("ui_nice_crosshairs_g " .. self.userData[player.weaponIndexSelected].green)
        end
        --blue
        if self.userData[player.weaponIndexSelected].blue ~= consoleGetVariable("ui_nice_crosshairs_b") then
            consolePerformCommand("ui_nice_crosshairs_b " .. self.userData[player.weaponIndexSelected].blue)
        end
        --alpha
        if self.userData[player.weaponIndexSelected].alpha ~= consoleGetVariable("ui_nice_crosshairs_a") then
            consolePerformCommand("ui_nice_crosshairs_a " .. self.userData[player.weaponIndexSelected].alpha)
        end
    end

    --stroke by health
    if Nice_Crosshairs.userData.colorStrokeByHealth ~= self.userData[player.weaponIndexSelected].stroke then
        Nice_Crosshairs.userData.colorStrokeByHealth = self.userData[player.weaponIndexSelected].stroke
    elseif self.userData[player.weaponIndexSelected].stroke == false then
        --red
        if self.userData[player.weaponIndexSelected].strokeRed  ~= consoleGetVariable("ui_nice_crosshairs_ra") then
            consolePerformCommand("ui_nice_crosshairs_ra " .. self.userData[player.weaponIndexSelected].strokeRed )
        end
        --green
        if self.userData[player.weaponIndexSelected].strokeGreen ~= consoleGetVariable("ui_nice_crosshairs_ga") then
            consolePerformCommand("ui_nice_crosshairs_ga " .. self.userData[player.weaponIndexSelected].strokeGreen)
        end
        --blue
        if self.userData[player.weaponIndexSelected].strokeBlue ~= consoleGetVariable("ui_nice_crosshairs_ba") then
            consolePerformCommand("ui_nice_crosshairs_ba " .. self.userData[player.weaponIndexSelected].strokeBlue)
        end
        --alpha
        if self.userData[player.weaponIndexSelected].strokeAlpha ~= consoleGetVariable("ui_nice_crosshairs_aa") then
            consolePerformCommand("ui_nice_crosshairs_aa " .. self.userData[player.weaponIndexSelected].strokeAlpha)
        end
    end

    if self.userData[player.weaponIndexSelected].mix then
        consolePerformCommand("ui_show_widget Nice_Crosshairs2")
        --type
        if self.userData[player.weaponIndexSelected].type2  ~= consoleGetVariable("ui_Nice_Crosshairs2_type") then
            consolePerformCommand("ui_Nice_Crosshairs2_type " .. self.userData[player.weaponIndexSelected].type2 )
        end
    
        --size
        if Nice_Crosshairs2.userData.crosshairSize ~= self.userData[player.weaponIndexSelected].size2 then
            Nice_Crosshairs2.userData.crosshairSize = self.userData[player.weaponIndexSelected].size2
        end

        --weight
        if Nice_Crosshairs2.userData.crosshairWeight ~= self.userData[player.weaponIndexSelected].weight2 then
            Nice_Crosshairs2.userData.crosshairWeight = self.userData[player.weaponIndexSelected].weight2
        end

        --stroke weight
        if Nice_Crosshairs2.userData.crosshairStrokeWeight ~= self.userData[player.weaponIndexSelected].strokeWeight2 then
            Nice_Crosshairs2.userData.crosshairStrokeWeight = self.userData[player.weaponIndexSelected].strokeWeight2
        end

        --color by health
        if Nice_Crosshairs2.userData.colorFillByHealth ~= self.userData[player.weaponIndexSelected].health2 then
            Nice_Crosshairs2.userData.colorFillByHealth = self.userData[player.weaponIndexSelected].health2
        elseif self.userData[player.weaponIndexSelected].health2 == false then
            --red
            if self.userData[player.weaponIndexSelected].red2  ~= consoleGetVariable("ui_Nice_Crosshairs2_r") then
                consolePerformCommand("ui_Nice_Crosshairs2_r " .. self.userData[player.weaponIndexSelected].red2 )
            end
            --green
            if self.userData[player.weaponIndexSelected].green2 ~= consoleGetVariable("ui_Nice_Crosshairs2_g") then
                consolePerformCommand("ui_Nice_Crosshairs2_g " .. self.userData[player.weaponIndexSelected].green2)
            end
            --blue
            if self.userData[player.weaponIndexSelected].blue2 ~= consoleGetVariable("ui_Nice_Crosshairs2_b") then
                consolePerformCommand("ui_Nice_Crosshairs2_b " .. self.userData[player.weaponIndexSelected].blue2)
            end
            --alpha
            if self.userData[player.weaponIndexSelected].alpha2 ~= consoleGetVariable("ui_Nice_Crosshairs2_a") then
                consolePerformCommand("ui_Nice_Crosshairs2_a " .. self.userData[player.weaponIndexSelected].alpha2)
            end
        end

        --stroke by health
        if Nice_Crosshairs2.userData.colorStrokeByHealth ~= self.userData[player.weaponIndexSelected].stroke2 then
            Nice_Crosshairs2.userData.colorStrokeByHealth = self.userData[player.weaponIndexSelected].stroke2
        elseif self.userData[player.weaponIndexSelected].stroke2 == false then
            --red
            if self.userData[player.weaponIndexSelected].strokeRed2  ~= consoleGetVariable("ui_Nice_Crosshairs2_ra") then
                consolePerformCommand("ui_Nice_Crosshairs2_ra " .. self.userData[player.weaponIndexSelected].strokeRed2 )
            end
            --green
            if self.userData[player.weaponIndexSelected].strokeGreen2 ~= consoleGetVariable("ui_Nice_Crosshairs2_ga") then
                consolePerformCommand("ui_Nice_Crosshairs2_ga " .. self.userData[player.weaponIndexSelected].strokeGreen2)
            end
            --blue
            if self.userData[player.weaponIndexSelected].strokeBlue2 ~= consoleGetVariable("ui_Nice_Crosshairs2_ba") then
                consolePerformCommand("ui_Nice_Crosshairs2_ba " .. self.userData[player.weaponIndexSelected].strokeBlue2)
            end
            --alpha
            if self.userData[player.weaponIndexSelected].strokeAlpha2 ~= consoleGetVariable("ui_Nice_Crosshairs2_aa") then
                consolePerformCommand("ui_Nice_Crosshairs2_aa " .. self.userData[player.weaponIndexSelected].strokeAlpha2)
            end
        end
    elseif self.userData[player.weaponIndexSelected].mix == false then
        for k = 1, 9, 1 do
            if k ~= player.weaponIndexSelected and self.userData[k].mix then
                consolePerformCommand("ui_hide_widget Nice_Crosshairs2")
            end
        end
    end

    --damage numbers
    if self.userData[player.weaponIndexSelected].damage ~= consoleGetVariable("cl_text_time") then
        consolePerformCommand("cl_text_time " .. self.userData[player.weaponIndexSelected].damage)
    end
end
