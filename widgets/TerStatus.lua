--------------------------------------------------------------------------------
-- This is an official Reflex script. Do not modify.
--
-- If you wish to customize this widget, please:
--  * clone this file to a new file
--  * rename the widget MyWidget
--  * set this widget to not visible (via options menu)
--  * set your new widget to visible (via options menu)
--
--------------------------------------------------------------------------------

require "base/internal/ui/reflexcore"

TerStatus =
{
};
registerWidget("TerStatus");


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function TerStatus:initialize()
	-- load data stored in engine
	self.userData = loadUserData();
	
	-- ensure it has what we need
	CheckSetDefaultValue(self, "userData", "table", {});
	CheckSetDefaultValue(self.userData, "iconAlpha", "number", 255);
    CheckSetDefaultValue(self.userData, "iconSize", "number", 32);		
    CheckSetDefaultValue(self.userData, "numberSpacing", "number", 80);
    CheckSetDefaultValue(self.userData, "numberOutline", "number", 2000);
end


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function TerStatus:drawOptions(x, y)

	local sliderWidth = 215;
	local sliderStart = 248;
	local user = self.userData;
	
	uiLabel("Icon Alpha:", x, y);
	user.iconAlpha = clampTo2Decimal(uiSlider(x + sliderStart, y, sliderWidth, 1, 255, user.iconAlpha));
	user.iconAlpha = clampTo2Decimal(uiEditBox(user.iconAlpha, x + sliderStart + sliderWidth + 30, y, 60));
	y = y + 40;
    
    uiLabel("Icon Size:", x, y);
	user.iconSize = uiSlider(x + sliderStart, y, sliderWidth, 1, 40, user.iconSize);
	user.iconSize = uiEditBox(user.iconSize, x + sliderStart + sliderWidth + 30, y, 60);
	y = y + 40;
    
    uiLabel("Number spacing:", x, y);
	user.numberSpacing = clampTo2Decimal(uiSlider(x + sliderStart, y, sliderWidth, 1, 255, user.numberSpacing));
	user.numberSpacing = clampTo2Decimal(uiEditBox(user.numberSpacing, x + sliderStart + sliderWidth + 30, y, 60));
    y = y + 40

    uiLabel("Number outline:", x, y);
	user.numberOutline = clampTo2Decimal(uiSlider(x + sliderStart, y, sliderWidth, 0, 10000, user.numberOutline));
	user.numberOutline = clampTo2Decimal(uiEditBox(user.numberOutline, x + sliderStart + sliderWidth + 30, y, 60));    
	
	saveUserData(user);
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function TerStatus:draw()

    -- Early out if HUD shouldn't be shown.
    if not shouldShowHUD() then return end;
	if isRaceMode() then return end;
    
    local user = self.userData;

	local player = getPlayer();

    local iconColor;
    if player.armorProtection == 0 then iconColor = Color(2,167,46, user.iconAlpha) end
    if player.armorProtection == 1 then iconColor = Color(245,215,50, user.iconAlpha) end
    if player.armorProtection == 2 then iconColor = Color(236,0,0, user.iconAlpha) end
	if player.armor == 0 then iconColor = Color(128,128,128,barAlpha) end
          
    -- Draw numbers
    local fontColor = Color(230,230,230);
    local blackIntensive = Color(0, 0, 0, user.numberOutline);

    nvgFontSize(64);
	nvgFontFace(FONT_HUD);
	nvgTextAlign(NVG_ALIGN_CENTER, NVG_ALIGN_MIDDLE);
    
    nvgFontBlur(1);
    nvgFillColor(blackIntensive);
	nvgText(user.numberSpacing, 0, player.armor);

	nvgFontBlur(0);
	nvgFillColor(fontColor);
	nvgText(user.numberSpacing, 0, player.armor);
    
    nvgFontBlur(1);
    nvgFillColor(blackIntensive);
    nvgText(-user.numberSpacing, 0, player.health);

    nvgFontBlur(0);
    nvgFillColor(fontColor);
    nvgText(-user.numberSpacing, 0, player.health);
        
    -- Draw icon
	local iconX = 0;
	local iconY = 0;

	nvgFillColor(iconColor);
	nvgSvg("internal/ui/icons/armor", iconX, iconY, user.iconSize);

end
