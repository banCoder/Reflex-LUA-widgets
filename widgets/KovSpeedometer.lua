require "base/internal/ui/reflexcore"

KovSpeedometer =
{
};
registerWidget("KovSpeedometer");

function degreesToRadians(angle)
    return angle * (math.pi / 180)
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
function KovSpeedometer:draw()
 
    -- Early out if HUD shouldn't be shown.
    if not shouldShowHUD() then return end;

    -- Find player 
    local player = getPlayer()
    local speed = math.ceil(player.speed)
	local fillSpeed = speed -- used for the 2nd, 3rd, and 4th fill colors

    local fontSize = 45;
    local gaugeMaxUPS = 500
	local rectHeight = 20
	local rectWidth = gaugeMaxUPS

    -- Colors
	local transparency = 120
    local textColor = Color(255,255,255,255);

    local BackgroundColor = Color(0,0,0,120);
    local SpeedColor1 = Color(0,128,0,transparency);
    local SpeedColor2 = Color(196,196,0,transparency);
    local SpeedColor3 = Color(128,0,0,transparency);
    local SpeedColor4 = Color(0,0,128,transparency);
   
    local gaugeTickColor = Color(255,255,255,80);

    -- Draw gauge background
    nvgBeginPath();
	nvgRect(-rectWidth/2,-rectHeight/2,rectWidth,rectHeight)
    nvgFillColor(BackgroundColor);
    nvgFill();

	-- Draw the first color
    nvgBeginPath();
	nvgRect(-rectWidth/2,-rectHeight/2,math.min(fillSpeed,gaugeMaxUPS),rectHeight)
    nvgFillColor(SpeedColor1);
    nvgFill();
	
	if (fillSpeed > gaugeMaxUPS) then
		fillSpeed = fillSpeed - gaugeMaxUPS
	end

	if (speed > gaugeMaxUPS) then
		-- Draw the second color
		nvgBeginPath();
		nvgRect(-rectWidth/2,-rectHeight/2+5,math.min(fillSpeed,gaugeMaxUPS),rectHeight-10)
		nvgFillColor(SpeedColor2);
		nvgFill();
		if (fillSpeed > gaugeMaxUPS) then
			fillSpeed = fillSpeed - gaugeMaxUPS
		end
	end


	if (speed > gaugeMaxUPS*2) then
		-- Draw the third color
		nvgBeginPath();
		nvgRect(-rectWidth/2,-rectHeight/2+5,math.min(fillSpeed,gaugeMaxUPS),rectHeight-10)
		nvgFillColor(SpeedColor3);
		nvgFill();
		if (fillSpeed > gaugeMaxUPS) then
			fillSpeed = fillSpeed - gaugeMaxUPS
		end
	end
	
	if (speed > gaugeMaxUPS*3) then
		-- Draw the forth color
		nvgBeginPath();
		nvgRect(-rectWidth/2,-rectHeight/2+5,math.min(fillSpeed,gaugeMaxUPS),rectHeight-10)
		nvgFillColor(SpeedColor4);
		nvgFill();
	end

    -- Draw gauge tick line at the edge at each 100 ups
    for i=0, gaugeMaxUPS, 100 do
        nvgBeginPath();
		nvgRect(-rectWidth/2+i-2,-rectHeight/2,4,rectHeight)
        nvgFillColor(gaugeTickColor);
        nvgFill();
    end

    -- UPS Text output

    nvgFontSize(fontSize);
    nvgFontFace("TitilliumWeb-Bold");
    nvgTextAlign(NVG_ALIGN_CENTER, NVG_ALIGN_MIDDLE);
    nvgFontBlur(0);
    nvgFillColor(textColor);
    nvgText(0, 0, speed .. "ups");




end
