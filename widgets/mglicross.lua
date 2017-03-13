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

mgli_crosshairs =
{
	canPosition = true;

	-- user data, we'll save this into engine so it's persistent across loads
	userData = {};
};
registerWidget("mgli_crosshairs");

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function mgli_crosshairs:initialize()
	-- load data stored in engine
	self.userData = loadUserData();
	-- ensure it has what we need
	CheckSetDefaultValue(self, "userData", "table", {});
	CheckSetDefaultValue(self.userData, "crosshairSize", "number", 16);
	CheckSetDefaultValue(self.userData, "crosshairGap", "number", 5);
	CheckSetDefaultValue(self.userData, "crosshairWeight", "number", 3);
	CheckSetDefaultValue(self.userData, "crosshairStrokeWeight", "number", 3);
		CheckSetDefaultValue(self.userData, "dot", "boolean", false);
		CheckSetDefaultValue(self.userData, "stroke", "table", Color(0,0,0,255));
			CheckSetDefaultValue(self.userData, "fill", "table", Color(255,255,255,255));
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function mgli_crosshairs:finalize()
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function mgli_crosshairs:draw(forceDraw)

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
    local crosshairFillColor = self.userData.fill;
    local crosshairStrokeColor = self.userData.stroke;
	-- pull out of self
    local crosshairSize = self.userData.crosshairSize;
    local crosshairWeight = self.userData.crosshairWeight;
    local crosshairStrokeWeight = self.userData.crosshairStrokeWeight;
    local crosshairGap = self.userData.crosshairGap;
    local dot = self.userData.dot;


    -- Helpers
    local crosshairHalfSize = crosshairSize / 2;
    local crosshairHalfWeight = crosshairWeight / 2;

    -- Crosshair
	  local gap = crosshairGap
        nvgBeginPath();
        nvgRect(-crosshairHalfSize-gap, -crosshairHalfWeight, crosshairHalfSize, crosshairWeight) -- left
        nvgRect(-crosshairHalfWeight, -crosshairHalfSize-gap, crosshairWeight, crosshairHalfSize) -- top
        nvgRect(crosshairHalfSize+gap, crosshairHalfWeight, -crosshairHalfSize, -crosshairWeight) -- right
        nvgRect(crosshairHalfWeight, crosshairHalfSize+gap, -crosshairWeight, -crosshairHalfSize)
	   if dot then
		     nvgRect(-crosshairWeight/2, -crosshairWeight/2, crosshairWeight, crosshairWeight) -- dot
		end
        nvgStrokeColor(crosshairStrokeColor);
        nvgStrokeWidth(crosshairStrokeWeight);
        nvgStroke();
        nvgFillColor(crosshairFillColor);
        nvgFill();

end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function mgli_crosshairs:drawOptions(x, y, intensity)
	local optargs = {};
	optargs.intensity = intensity;
	local user = self.userData;
	local sliderWidth = 200;
	local sliderStart = 140;

	ui2Label("Preview:", x, y);

	nvgSave();
	nvgTranslate(x + WIDGET_PROPERTIES_COL_INDENT + 40, y + 40);
	self:draw(true, x + WIDGET_PROPERTIES_COL_INDENT + 40, y + 40);
	nvgRestore();
	y = y + 70;
	strokecol = uiCheckBox(strokecol, "stroke", x, y);
	if strokecol then
		y = y+30
		user.stroke = uiColorPicker(x,y,user.stroke,{});
		goto skip
	end
	y = y+30

	fillcol = uiCheckBox(fillcol, "fill", x, y);

	if fillcol then
				y = y+30
		user.fill = uiColorPicker(x,y,user.fill,{});
		goto skip
	end
	y=y+30
	user.dot = uiCheckBox(user.dot, "dot", x, y);
	y=y+30
	user.crosshairSize = ui2RowSliderEditBox2Decimals(x, y, WIDGET_PROPERTIES_COL_INDENT, WIDGET_PROPERTIES_COL_WIDTH, 80, "Size", user.crosshairSize, 1, 120, optargs);
	y = y + 60;
	user.crosshairGap = ui2RowSliderEditBox2Decimals(x, y, WIDGET_PROPERTIES_COL_INDENT, WIDGET_PROPERTIES_COL_WIDTH, 80, "gap", user.crosshairGap, 0, 120, optargs);
	y = y + 60;

	user.crosshairWeight = ui2RowSliderEditBox2Decimals(x, y, WIDGET_PROPERTIES_COL_INDENT, WIDGET_PROPERTIES_COL_WIDTH, 80, "Weight", user.crosshairWeight, 1, 50, optargs);
	y = y + 60;

	user.crosshairStrokeWeight = ui2RowSliderEditBox2Decimals(x, y, WIDGET_PROPERTIES_COL_INDENT, WIDGET_PROPERTIES_COL_WIDTH, 80, "Stroke Weight", user.crosshairStrokeWeight, 1, 20, optargs);
	y = y + 60;


		::skip::
	saveUserData(user);
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function mgli_crosshairs:getOptionsHeight()
	return 470; -- debug with: ui_menu_show_widget_properties_height 1
end
