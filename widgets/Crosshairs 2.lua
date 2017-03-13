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

Crosshairs2 =
{
	canPosition = false;

	-- user data, we'll save this into engine so it's persistent across loads
	userData = {};
};
registerWidget("Crosshairs2");

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function Crosshairs2:initialize()
	-- load data stored in engine
	self.userData = loadUserData();
	
	-- ensure it has what we need
	CheckSetDefaultValue(self, "userData", "table", {});
	CheckSetDefaultValue(self.userData, "colorFillByHealth", "boolean", false);
	CheckSetDefaultValue(self.userData, "colorStrokeByHealth", "boolean", false);
	CheckSetDefaultValue(self.userData, "crosshairSize", "number", 16);
	CheckSetDefaultValue(self.userData, "crosshairWeight", "number", 3);
	CheckSetDefaultValue(self.userData, "crosshairStrokeWeight", "number", 3);

	widgetCreateConsoleVariable("type", "int", 1);
	widgetCreateConsoleVariable("r", "int", 255);
	widgetCreateConsoleVariable("g", "int", 255);
	widgetCreateConsoleVariable("b", "int", 255);
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function Crosshairs2:finalize()
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function Crosshairs2:draw(forceDraw)
	-- player health, updated if we actually have a player
	local playerHealth = 100;
	
	if not forceDraw then
		-- no player => no crosshair
		local player = getPlayer();
		if player == nil then return end;
		playerHealth = player.health;
		
		-- menu => no crosshair
		if isInMenu() then return end;

		-- editor => no crosshair
		if player.state == PLAYER_STATE_EDITOR then
			return;
		end

		-- spectator => no crosshair
		if player.state == PLAYER_STATE_SPECTATOR then
			return;
		end

		-- dead => no crosshair
		if player.health <= 0 then
			return;
		end
		
		-- menu replay background => no crosshair
		if replayName == "menu" then
			return false;
		end

		if world.gameState == GAME_STATE_GAMEOVER then
			return false;
		end
	end
    
    -- Colors
    local crosshairFillColor = Color(255,255,255,255);
    local crosshairStrokeColor = Color(0,0,0,255);
	crosshairFillColor.r = widgetGetConsoleVariable("r");
	crosshairFillColor.g = widgetGetConsoleVariable("g");
	crosshairFillColor.b = widgetGetConsoleVariable("b");

	-- pull out of self
    local colorFillByHealth = self.userData.colorFillByHealth;
    local colorStrokeByHealth = self.userData.colorStrokeByHealth;
    local crosshairSize = self.userData.crosshairSize;
    local crosshairWeight = self.userData.crosshairWeight;
    local crosshairStrokeWeight = self.userData.crosshairStrokeWeight;

    if colorFillByHealth then
        if playerHealth > 100 then crosshairFillColor = Color(16,116,217, barAlpha) end
        if playerHealth <= 100 then crosshairFillColor = Color(2,167,46, barAlpha) end
        if playerHealth <= 80 then crosshairFillColor = Color(255,176,14, barAlpha) end
        if playerHealth <= 30 then crosshairFillColor = Color(236,0,0, barAlpha) end
    end

    if colorStrokeByHealth then
        if playerHealth > 100 then crosshairStrokeColor = Color(16,116,217, barAlpha) end
        if playerHealth <= 100 then crosshairStrokeColor = Color(2,167,46, barAlpha) end
        if playerHealth <= 80 then crosshairStrokeColor = Color(255,176,14, barAlpha) end
        if playerHealth <= 30 then crosshairStrokeColor = Color(236,0,0, barAlpha) end
    end

    -- Helpers
    local crosshairHalfSize = crosshairSize / 2;
    local crosshairHalfWeight = crosshairWeight / 2;
	local crosshairType = widgetGetConsoleVariable("type");

    -- Crosshair 1
    if crosshairType == 1 then
        nvgBeginPath();
        nvgRect(-crosshairHalfSize, -crosshairHalfWeight, crosshairSize, crosshairWeight) -- horizontal
        nvgRect(-crosshairHalfWeight, -crosshairHalfSize, crosshairWeight, crosshairSize) -- vertical
        nvgStrokeColor(crosshairStrokeColor);
        nvgStrokeWidth(crosshairStrokeWeight);
        nvgStroke();
        nvgFillColor(crosshairFillColor); 
        nvgFill();
    end

    -- Crosshair 2
    if crosshairType == 2 then
        local innerSpace = 0.65;
        nvgBeginPath();
        nvgRect(-crosshairHalfSize, -crosshairHalfWeight, crosshairHalfSize * innerSpace, crosshairWeight) -- left
        nvgRect(-crosshairHalfWeight, -crosshairHalfSize, crosshairWeight, crosshairHalfSize * innerSpace) -- top
        nvgRect(crosshairHalfSize, crosshairHalfWeight, -crosshairHalfSize * innerSpace, -crosshairWeight) -- right
        nvgRect(crosshairHalfWeight, crosshairHalfSize, -crosshairWeight, -crosshairHalfSize * innerSpace) -- bottom
        nvgStrokeColor(crosshairStrokeColor);
        nvgStrokeWidth(crosshairStrokeWeight);
        nvgStroke();
        nvgFillColor(crosshairFillColor); 
        nvgFill();
    end

    -- Crosshair 3
    if crosshairType == 3 then
        local innerSpace = 0.65;
        nvgBeginPath();
        nvgRect(-crosshairHalfSize, -crosshairHalfWeight, crosshairHalfSize * innerSpace, crosshairWeight) -- left
        nvgRect(-crosshairHalfWeight, -crosshairHalfSize, crosshairWeight, crosshairHalfSize * innerSpace) -- top
        nvgRect(crosshairHalfSize, crosshairHalfWeight, -crosshairHalfSize * innerSpace, -crosshairWeight) -- right
        nvgRect(crosshairHalfWeight, crosshairHalfSize, -crosshairWeight, -crosshairHalfSize * innerSpace) -- bottom
        nvgRect(-crosshairHalfWeight, -crosshairHalfWeight, crosshairWeight, crosshairWeight) -- dot
        nvgStrokeColor(crosshairStrokeColor);
        nvgStrokeWidth(crosshairStrokeWeight);
        nvgStroke();
        nvgFillColor(crosshairFillColor); 
        nvgFill();
    end

    -- Crosshair 4
    if crosshairType == 4 then
        nvgBeginPath();
        nvgCircle(0, 0, crosshairSize / 8)
        nvgStrokeColor(crosshairStrokeColor);
        nvgStrokeWidth(crosshairStrokeWeight);
        nvgStroke();
        nvgFillColor(crosshairFillColor); 
        nvgFill();
    end

    -- Crosshair 5
    if crosshairType == 5 then
        nvgBeginPath();
        nvgCircle(0, 0, crosshairSize / 4)
        nvgStrokeColor(crosshairFillColor);
        nvgStrokeWidth(crosshairStrokeWeight / 2);
        nvgStroke();
    end

    -- Crosshair 6-16
    if crosshairType >= 6 and crosshairType <= 16 then
        nvgBeginPath();
        nvgFillColor(crosshairFillColor);
        nvgSvg("internal/ui/crosshairs/crosshair" .. crosshairType, 0, 0, crosshairSize);
    end
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function Crosshairs2:drawOptions(x, y, intensity)
	local optargs = {};
	optargs.intensity = intensity;

	local sliderWidth = 200;
	local sliderStart = 140;
	
	ui2Label("Preview:", x, y);

	nvgSave();
	nvgTranslate(x + WIDGET_PROPERTIES_COL_INDENT + 40, y + 40);
	self:draw(true, x + WIDGET_PROPERTIES_COL_INDENT + 40, y + 40);
	nvgRestore();
	y = y + 130;

	local user = self.userData;
	local crosshairType = widgetGetConsoleVariable("type");
	
	user.colorFillByHealth = ui2RowCheckbox(x, y, WIDGET_PROPERTIES_COL_INDENT, "Color Fill By Health", user.colorFillByHealth, optargs);
	y = y + 60;
	
	user.colorStrokeByHealth = ui2RowCheckbox(x, y, WIDGET_PROPERTIES_COL_INDENT, "Color Stroke By Health", user.colorStrokeByHealth, optargs);
	y = y + 60;
	
	local newType = ui2RowSliderEditBox0Decimals(x, y, WIDGET_PROPERTIES_COL_INDENT, WIDGET_PROPERTIES_COL_WIDTH, 80, "Type", crosshairType, 1, 16, optargs);
	if newType ~= crosshairType then
		widgetSetConsoleVariable("type", newType);
	end
	y = y + 60;
	
	user.crosshairSize = ui2RowSliderEditBox2Decimals(x, y, WIDGET_PROPERTIES_COL_INDENT, WIDGET_PROPERTIES_COL_WIDTH, 80, "Size", user.crosshairSize, 1, 90, optargs);
	y = y + 60;
	
	user.crosshairWeight = ui2RowSliderEditBox2Decimals(x, y, WIDGET_PROPERTIES_COL_INDENT, WIDGET_PROPERTIES_COL_WIDTH, 80, "Weight", user.crosshairWeight, 1, 10, optargs);
	y = y + 60;
	
	user.crosshairStrokeWeight = ui2RowSliderEditBox2Decimals(x, y, WIDGET_PROPERTIES_COL_INDENT, WIDGET_PROPERTIES_COL_WIDTH, 80, "Stroke Weight", user.crosshairStrokeWeight, 1, 10, optargs);
	y = y + 60;

	saveUserData(user);
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function Crosshairs2:getOptionsHeight()
	return 470; -- debug with: ui_menu_show_widget_properties_height 1
end
