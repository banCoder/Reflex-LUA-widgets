require "base/internal/ui/reflexcore"
require "base/internal/ui/gamestrings"

local PI = 3.1415926535;
local DEG2RAD = PI / 180;
local RAD2DEG = 180 / PI;

local THEME_OPTIONS = {
    "None",
    "Hex",
    "Banner",
    "Shield",
    "Lines"
};

local ALIGN_OPTIONS = {
    "Left",
    "Center",
    "Right"
};

local br_THEME_HEX = "Hex";
local br_THEME_BANNER = "Banner";
local br_THEME_SHIELD = "Shield";
local br_THEME_OUTLINE = "Lines";
local br_THEME_NONE = "None";

local draw_example_banner;
local draw_example_hex;
local draw_example_shield;
local draw_example_outline;
local draw_example_none;

br_Awards = {
    canPosition = true,
    canHide = true,
    ud = {},
    last_awards_count = 0,
    total_awards_count = 0,
    theme_combo_box = {},
    align_combo_box = {},
    color_combo_box = {},
    selected_color_type = "Primary",
    cpicker = {
        color = {},
        colorHsv = {},
        flags = {}
    }
};

local awards = {};

registerWidget("br_Awards");

function br_Awards:initialize()

    self.ud = loadUserData();

    CheckSetDefaultValue(self, "ud", "table", {});
    CheckSetDefaultValue(self.ud, "show_award_name", "boolean", true);
    CheckSetDefaultValue(self.ud, "show_xp", "boolean", true);
    CheckSetDefaultValue(self.ud, "theme", "string", "None");
    CheckSetDefaultValue(self.ud, "align", "string", "Center");
    CheckSetDefaultValue(self.ud, "none_col1", "string", "FFC80000");
    CheckSetDefaultValue(self.ud, "banner_col1", "string", "FFFFFFFF");
    CheckSetDefaultValue(self.ud, "banner_col2", "string", "FF000000");
    CheckSetDefaultValue(self.ud, "shield_col1", "string", "FFDD0000");
    CheckSetDefaultValue(self.ud, "shield_col2", "string", "FF000000");
    CheckSetDefaultValue(self.ud, "hex_col1", "string", "FFFFFFFF");
    CheckSetDefaultValue(self.ud, "hex_col2", "string", "FF4488DD");
    CheckSetDefaultValue(self.ud, "outline_col1", "string", "FFFF0000");
    CheckSetDefaultValue(self.ud, "outline_col2", "string", "FF000000");

end

local function nvg_diamond(x, y, size)

    local sc30 = math.cos(30 * DEG2RAD) * size;
    local ss30 = math.sin(30 * DEG2RAD) * size;

    nvgBeginPath();
    nvgMoveTo(x - sc30, y - ss30);
    nvgLineTo(x, y - size);
    nvgLineTo(x + sc30, y - ss30);
    nvgLineTo(x + sc30, y + ss30);
    nvgLineTo(x, y + size);
    nvgLineTo(x - sc30, y + ss30);
    nvgClosePath();
end

local function nvg_banner(x,y,size)
    
    nvgBeginPath();
    nvgMoveTo(x - size, y - size);
    nvgLineTo(x + size, y - size);
    nvgLineTo(x + size, y + size * 1.7);
    nvgLineTo(x, y + size);
    nvgLineTo(x - size, y + size * 1.7);
    nvgClosePath();
end

local function nvg_shield(x,y,size)
    nvgBeginPath();
    nvgMoveTo(x - size, y - size);
    nvgLineTo(x + size, y - size);
    nvgLineTo(x + size, y + size);
    nvgLineTo(x, y + size * 1.7);
    nvgLineTo(x - size, y + size);
    nvgClosePath();
end


function br_Awards:draw()
    -- Early out if HUD shouldn't be shown.
    local optargs = {};
    optargs.showWhenDead = true;
    if not shouldShowHUD(optargs) then return end;

    local player = getPlayer();

    local count = 0;

    local ud = self.ud;


    for i, v in ipairs(log) do
        if(v.type == LOG_TYPE_AWARD and v.awardPlayerIndex == player.index and v.age < 3.5) then
            count = count + 1;
        else
            if(ud.align == "Center")then
                if(awards[v.id] ~= nil)then
                    awards[v.id] = nil;
                end
            end
        end
    end

    -- used for left and right aligns
    if(ud.align ~= "Center" and count < self.total_awards_count)then
        self.last_awards_count = self.last_awards_count - (self.total_awards_count - count);
    end
    self.total_awards_count = count;

    count = 0;

    for i, v in ipairs(log) do
        if(v.type == LOG_TYPE_AWARD and v.awardPlayerIndex == player.index and v.age < 3.5) then
            
            local info = awardDefinitions[v.awardType];

            local side_slide_pct = 0;
            local fade_in_pct = 0;
            local fade_out_pct = 0;
            if(v.age > 3)then
                fade_out_pct = (v.age - 3) / 0.5;
            end

            local explosion_pct = 0;

            local x = 0;
            local y = 0;

            local award_width = (self.total_awards_count - 1) * 110;

            if(ud.align == "Center")then
                if(awards[v.id] == nil)then
                    awards[v.id] = {
                        pos = 0,
                        dest = 0
                    };
                end
                local award = awards[v.id];

                local new_dest = -award_width / 2 + count * 110;
                if(award.dest ~= new_dest)then
                    award.dest = new_dest;
                end
                award.pos = lerp(award.pos, award.dest, deltaTime * 6);
                x = award.pos;
            elseif(ud.align == "Left")then
                if(self.total_awards_count > self.last_awards_count)then
                    x = math.max(0, count * 110 - (self.total_awards_count - self.last_awards_count) * 110);
                else
                    x = count * 110;
                end
            elseif(ud.align == "Right")then
                if(self.total_awards_count > self.last_awards_count)then
                    x = math.min(0, count * -110 + (self.total_awards_count - self.last_awards_count) * 110);
                else
                    x = count * -110; 
                end
            end

            local fade_a = 255;

            local size = 0;

            if(ud.theme == br_THEME_HEX)then
                local col1 = hexArgbToCol(ud.hex_col1);
                local col2 = hexArgbToCol(ud.hex_col2);

                if(v.age <= 0.4)then
                    fade_in_pct = v.age / 0.4;
                end

                if(v.age > 0.4 and v.age < 0.7)then
                    explosion_pct = (v.age - 0.4) / 0.3;
                end

                if(fade_in_pct > 0)then
                    fade_a = (fade_in_pct * 255);
                elseif(fade_out_pct > 0)then
                    fade_a = (1 - fade_out_pct) * 255;
                end

                size = 43;
                if(fade_in_pct > 0)then
                    size = 63 - (fade_in_pct * 20);
                end

                local hex_bg_col = Color(0,0,0);
                if(fade_in_pct > 0) then
                    local z = 255 - (fade_in_pct * 255);
                    hex_bg_col.r = z;
                    hex_bg_col.g = z;
                    hex_bg_col.b = z;
                end

                if(fade_in_pct > 0)then
                   -- hex_bg_col.a = fade_in_pct * 255;
                elseif(fade_out_pct > 0)then
                    hex_bg_col.a = fade_a; --(1 - fade_out_pct) * 255;
                end

                local a = hex_bg_col.a;

                nvgSave();
                nvgTranslate(x, -y);
                nvgRotate(fade_in_pct * 360 * DEG2RAD);
                nvgTranslate(-x, y);
                -- complete diamond black bg
                nvg_diamond(x,y,size);
                nvgFillColor(hex_bg_col);
                nvgFill();

                --left outline white
                nvgScissor(x - size, y - size, size / 2, size * 2);
                nvg_diamond(x,y,size);
                nvgStrokeColor(Color(100,100,100,a));
                nvgStroke();

                nvg_diamond(x,y,size - 3);
                nvgStrokeColor(Color(200,200,200,a));
                nvgStrokeWidth(1);
                nvgStroke();
                nvgResetScissor();
                
                --right outline white
                nvgScissor(x + size / 2, y - size, size / 2, size * 2);
                nvg_diamond(x,y,size);
                nvgStrokeColor(Color(100,100,100,a));

                nvgStroke();

                nvg_diamond(x,y,size - 3);
                nvgStrokeColor(Color(200,200,200,a));
                nvgStroke();
                nvgResetScissor();

                -- inner blue diamond
                nvg_diamond(x,y,size - 8);
                col2.a = a;
                nvgStrokeColor(col2);
                nvgStrokeWidth(3);
                nvgStroke();

                nvgRestore();
                
                if(explosion_pct > 0)then
                    nvg_diamond(x,y,size + (explosion_pct * size * 2));
                    --nvgStrokeWidth(10 - (explosion_pct * 9));
                    nvgStrokeColor(Color(255,255,255, (1 - explosion_pct) * 255));
                    nvgStroke();
                end

                -- icon
                col1.a = fade_a;
                nvgFillColor(col1);
                nvgSvg(info.icon, x, y, size - 25);
            
                size = 43;
            elseif(ud.theme == br_THEME_SHIELD)then
                local col1 = hexArgbToCol(ud.shield_col1);
                local col2 = hexArgbToCol(ud.shield_col2);

                if(v.age <= 0.2)then
                    fade_in_pct = v.age / 0.2;
                end

                if(v.age > 0.2 and v.age < 0.5)then
                    explosion_pct = (v.age - 0.2) / 0.3;
                end

                if(fade_in_pct > 0)then
                    fade_a = (fade_in_pct * 255);
                elseif(fade_out_pct > 0)then
                    fade_a = (1 - fade_out_pct) * 255;
                end

                size = 33;
                if(fade_in_pct > 0)then
                    --size = 43 * fade_in_pct;
                    size = 53 - (fade_in_pct * 20);
                end

                if(fade_in_pct > 0)then
                    col1 = Color(255 - ((255 - col1.r) * fade_in_pct),255 - ((255 - col1.g) * fade_in_pct),255 - ((255 - col1.b) * fade_in_pct));
                    col2 = col1;
                elseif(fade_out_pct > 0)then
                    col1.a = fade_a;
                    col2.a = fade_a;
                end

                --main bg shield
                nvg_shield(x, y, size);
                nvgFillColor(col1);
                nvgFill();

                --outline shield
                nvg_shield(x, y, size - 3);
                nvgStrokeWidth(2);
                nvgStrokeColor(col2);
                nvgStroke();

                nvgBeginPath();
                nvgRect(x - (size - 3), y - (size - 3), size * 2 - 6, 10);
                nvgFillColor(col2);
                nvgFill();

                if(explosion_pct > 0)then
                    nvg_shield(x,y,size + (explosion_pct * size * 2));
                    nvgStrokeColor(Color(255,255,255, (1 - explosion_pct) * 255));
                    nvgStroke();
                end

                if(fade_in_pct == 0)then
                    col2.a = fade_a;
                    nvgFillColor(col2);
                    nvgSvg(info.icon, x, y + 8, size - 13);
                end
            elseif(ud.theme == br_THEME_BANNER)then
                local col1 = hexArgbToCol(ud.banner_col1);
                local col2 = hexArgbToCol(ud.banner_col2);
                  
                if(v.age > 0.2 and v.age <= 0.5)then
                    fade_in_pct = (v.age - 0.2) / 0.3;
                end

                if(v.age > 0.5 and v.age < 0.8)then
                    explosion_pct = (v.age - 0.5) / 0.3;
                end

                if(fade_in_pct > 0)then
                    fade_a = (fade_in_pct * 255);
                elseif(fade_out_pct > 0)then
                    fade_a = (1 - fade_out_pct) * 255;
                end

                size = 33;
                if(fade_in_pct > 0)then
                    --size = 53 - (fade_in_pct * 20);
                end


                if(fade_out_pct > 0)then
                    col1.a = (1 - fade_out_pct) * 255;
                end

                if(v.age <= 0.2)then
                    side_slide_pct = v.age / 0.2;
                end


                -- corner slides in
                local side_x = size + 5;
                if(side_slide_pct > 0)then
                    side_x = (size + 5) * side_slide_pct;
                    --nvgBeginPath();
                    --nvgRect(x - (size * side_slide_pct), y - size, side_slide_pct * size * 2, 5);
                    --nvgFillColor(bg_col);
                    --nvgFill();
                end


                -- left corner
                nvgLineCap(NVG_ROUND);
                nvgBeginPath();
                nvgMoveTo(x - side_x, y - size - 2);
                nvgLineTo(x - side_x, y - size + 10);
                nvgStrokeColor(col1);
                nvgStrokeWidth(5);
                nvgStroke();

                nvgBeginPath();
                nvgMoveTo(x - side_x - 5, y - size);
                nvgLineTo(x - side_x - 5, y - size + 8);
                nvgLineTo(x - side_x - 10, y - size + 4);
                nvgClosePath();
                nvgFillColor(col1);
                nvgFill();

                -- right corner
                nvgLineCap(NVG_ROUND);
                nvgBeginPath();
                nvgMoveTo(x + side_x, y - size - 2);
                nvgLineTo(x + side_x, y - size + 10);
                nvgStrokeWidth(5);
                nvgStroke();

                nvgBeginPath();
                nvgMoveTo(x + side_x + 5, y - size);
                nvgLineTo(x + side_x + 5, y - size + 8);
                nvgLineTo(x + side_x + 10, y - size + 4);
                nvgClosePath();
                nvgFill();

                -- banner roll down clip
                if(side_slide_pct > 0 or fade_in_pct > 0)then
                    -- top part of scroll, extending two both sides
                    if(side_slide_pct > 0)then
                        nvgScissor(x - size * side_slide_pct, y - size, size * 2 * side_slide_pct, 5 + fade_in_pct * size * 2.8);
                    else -- bottom roll out
                        nvgScissor(x - size, y - size, size * 2, 5 + fade_in_pct * size * 2.8);
                    end
                end

                --black bottom banner
                local scroll_y = 14;
                if(fade_in_pct > 0)then
                    scroll_y = 0;
                end
                
                if(explosion_pct > 0)then
                    scroll_y = 14 * explosion_pct;
                end

                if(fade_out_pct <= 0.2)then
                    col2.a = 255;
                    -- slide inner banner upwards, and fade out before main banner fades
                    if(fade_out_pct > 0)then
                        scroll_y = 14 - (14 * fade_out_pct * 5);
                        col2.a = 200 - (fade_out_pct * 255 * 5);
                    end
                    nvg_banner(x, scroll_y, size - 5);
                    nvgFillColor(col2);
                    nvgFill();
                    nvgStrokeWidth(2);
                    nvgStrokeColor(col1);
                    nvgStroke();
                end

                --main banner
                nvg_banner(x, y, size);
                nvgFillColor(col1);
                nvgFill();

                -- icon
                col2.a = fade_a;
                nvgFillColor(col2);
                nvgSvg(info.icon, x, y + 1, size - 13);

                if(side_slide_pct > 0 or fade_in_pct > 0)then
                    nvgResetScissor();
                end

                --[[if(explosion_pct > 0)then
                    nvg_banner(x,y,size + (explosion_pct * size * 2));
                    nvgStrokeColor(Color(255,255,255, (1 - explosion_pct) * 255));
                    nvgStroke();
                end
                ]]

            elseif(ud.theme == br_THEME_OUTLINE)then
                local col1 = hexArgbToCol(ud.outline_col1);
                local col2 = hexArgbToCol(ud.outline_col2);

                if(v.age <= 0.2)then
                    fade_in_pct = v.age / 0.2;
                end

                local rcornerfade = 1;
                if(v.age <= 0.2)then
                    rcornerfade = v.age / 0.2;
                end

                local lcornerfade = 1;
                if(v.age <= 0.2)then
                    lcornerfade = 0;
                elseif(v.age <= 0.4)then
                    lcornerfade = (v.age - 0.2) / 0.2;
                end

                local diagfade = 1;
                if(v.age <= 0.4)then
                    diagfade = 0;
                elseif(v.age <= 0.8)then
                    diagfade = (v.age - 0.4) / 0.4;
                end
                
                if(fade_out_pct > 0)then
                    fade_a = (1 - fade_out_pct) * 255;
                end

                size = 35;

                if(fade_out_pct > 0)then
                    col2.a = fade_a;
                    col1.a = fade_a;
                end

                -- diagonal bg
                if(diagfade > 0)then
                    nvgScissor(x - size, y - size, size * 2, size * 2);
                    nvgBeginPath();
                    nvgMoveTo(x - size, y - size);
                    nvgLineTo(x - size + (size * 4) * diagfade, y - size);
                    nvgLineTo(x - size, y -size + (size * 4) * diagfade);
                    nvgClosePath();
                    nvgFillColor(col2);
                    nvgFill();

                    if(diagfade < 1)then
                        for d = 0, 1, 0.05 do
                            if(d > diagfade + 0.2)then
                                break;
                            end
                            nvgBeginPath();
                            nvgMoveTo(x - size + (size * 4) * d, y - size - 5);
                            nvgLineTo(x - size + (size * 4) * d, y - size);
                            nvgLineTo(x - size, y -size + (size * 4) * d);
                            nvgLineTo(x - size - 5, y - size + (size * 4) * d);
                            nvgClosePath();
                            col1.a = 255 * (1 - diagfade);
                            nvgFillColor(col1);
                            nvgFill();
                        end
                    end

                    nvgResetScissor();
                end

                col1.a = col2.a;

                -- bottom right corner outline
                nvgFillColor(col1);
                nvgBeginPath();
                nvgRect(x + size - (size * 2) * rcornerfade, y + size - 2, (size * 2) * rcornerfade, 2);
                nvgFill();

                nvgBeginPath();
                nvgRect(x + size, y + size - (size * 2 * rcornerfade), 2, size * 2 * rcornerfade);
                nvgFill();

                -- top left corner outline
                if(lcornerfade > 0)then
                    nvgBeginPath();
                    nvgRect(x + size - (size * 2) * lcornerfade, y - size, (size * 2) * lcornerfade, 2);
                    nvgFill();
                    
                    nvgBeginPath();
                    nvgRect(x - size, y + size - (size * 2 * lcornerfade), 2, size * 2 * lcornerfade);
                    nvgFill();
                end


                if(fade_out_pct == 0)then
                    col2.a = 255 * diagfade;
                    col1.a = col2.a;
                end
                
                nvgFillColor(col1);
                nvgSvg(info.icon, x - 1, y, size - 13);
                nvgSvg(info.icon, x - 1, y + 2, size - 13);
                nvgSvg(info.icon, x + 1, y + 2, size - 13);
                nvgSvg(info.icon, x + 1, y, size - 13);
                nvgFillColor(col2);
                nvgSvg(info.icon, x, y + 1, size - 13);

            elseif(ud.theme == br_THEME_NONE)then

                local col1 = hexArgbToCol(ud.none_col1);

                if(v.age <= 0.25)then
                    fade_in_pct = v.age / 0.25;
                end

                if(fade_in_pct > 0)then
                    fade_a = (fade_in_pct * 255);
                elseif(fade_out_pct > 0)then
                    fade_a = (1 - fade_out_pct) * 255;
                end

                size = 30;

                if(fade_in_pct > 0)then
                    size = 30 - (1 - fade_in_pct) * 20;
                end

                col1.a = fade_a;
                nvgFillColor(col1);
                nvgSvg(info.icon, x, y + 1, size);

                -- reset to full size for text box
                size = 30;
            end

            local ty = y;
            local ta = 255;

            if(side_slide_pct > 0 or fade_in_pct > 0)then
                ty = ty + (1-fade_in_pct) * 30;
                ta = (fade_in_pct * 255);
            elseif(fade_out_pct > 0)then
                ta = (1 - fade_out_pct) * 255; 
            end


            if(ud.theme == br_THEME_HEX)then
                ty = ty + 45;
            elseif(ud.theme == br_THEME_SHIELD)then
                ty = ty + 60;
            elseif(ud.theme == br_THEME_BANNER)then
                ty = ty + 65;
            elseif(ud.theme == br_THEME_OUTLINE)then
                ty = ty + 45;
            elseif(ud.theme == br_THEME_NONE)then
                ty = ty + 45; 
            end

            nvgFontSize(26);
            nvgFontFace(FONT_TEXT2);
            nvgTextAlign(NVG_ALIGN_CENTER, NVG_ALIGN_TOP);

            local text_col = {r=255,g=255,b=255,a=ta};

            -- award name
            if(ud.show_award_name == true)then
                nvgFillColor(text_col);
                nvgTextLineHeight(0.8);
                nvgTextBox(x - size * 1.5, ty, size * 3, info.name);
            end

            -- experience text
            if(ud.show_xp == true)then
                if(ud.show_award_name == true)then
                    local bounds = nvgTextBoxBounds(size * 2.8, info.name);

                    ty = ty + (bounds.maxy - bounds.miny);
                end

                nvgFillColor(Color(255, 235, 175, text_col.a));
                nvgText(x, ty, "+" .. v.awardAmount .. " xp");
            end

            count = count + 1;
         end
    end

    self.last_awards_count = lerp(self.last_awards_count, count, deltaTime * 6);

end

function br_Awards:drawOptions(x, y, intensity)
    local ud = self.ud;

    local optargs = {
        intensity = intensity
    };

    local column2_x = 250;
    ud.show_award_name = ui2RowCheckbox(x, y, column2_x, "Show Award Name", ud.show_award_name, optargs);

    y = y + 45;
    ud.show_xp = ui2RowCheckbox(x, y, column2_x, "Show Xp", ud.show_xp, optargs);

    y = y + 45 * 3;

    if(intensity < 1)then
        return;
    end

    local col_options;
    local col1;
    local col2;

    if(ud.theme == br_THEME_BANNER)then
        col1 = hexArgbToCol(ud.banner_col1);
        col2 = hexArgbToCol(ud.banner_col2);
        col_options = {"Primary", "Secondary"};
        draw_example_banner(x + 100, y + 140, col1, col2);
    elseif(ud.theme == br_THEME_SHIELD)then
        col1 = hexArgbToCol(ud.shield_col1);
        col2 = hexArgbToCol(ud.shield_col2);
        col_options = {"Primary", "Secondary"};
        draw_example_shield(x + 100, y + 140, col1, col2);
    elseif(ud.theme == br_THEME_HEX)then
        col1 = hexArgbToCol(ud.hex_col1);
        col2 = hexArgbToCol(ud.hex_col2);
        col_options = {"Primary", "Secondary"};
        -- draw before for clip fix
        if(self.selected_color_type == "Primary")then
            self:set_picker_color(col1);
        else
            self:set_picker_color(col2);
        end
        self:draw_color_picker(x + column2_x, y);
        draw_example_hex(x + 100, y + 140, col1, col2, Menu.scrollBarDataWidgetProperties.dragOffsetY);
    elseif(ud.theme == br_THEME_OUTLINE)then
        col1 = hexArgbToCol(ud.outline_col1);
        col2 = hexArgbToCol(ud.outline_col2);
        col_options = {"Primary", "Secondary"};
        draw_example_outline(x + 100, y + 140, col1, col2);
    elseif(ud.theme == br_THEME_NONE)then
        col1 = hexArgbToCol(ud.none_col1);
        col_options = {"Primary"};
        draw_example_none(x + 100, y + 140, col1);
    end

    -- scroll clip fix
    if(ud.theme ~= br_THEME_HEX)then
        if(self.selected_color_type == "Primary")then
            self:set_picker_color(col1);
        else
            self:set_picker_color(col2);
        end

        self:draw_color_picker(x + column2_x, y);
    end

    ui2Label("Color", x, y, optargs);
    self.selected_color_type = ui2ComboBox(col_options, self.selected_color_type, x + 70, y, 140, self.color_combo_box, optargs);

    y = y - 45;
    ui2Label("Theme", x, y, optargs);
    local new_theme = ui2ComboBox(THEME_OPTIONS, ud.theme, x + column2_x, y, 140, self.theme_combo_box, optargs);
    if(new_theme ~= ud.theme)then
        ud.theme = new_theme;
        self.selected_color_type = "Primary";
    end

    y = y - 45;
    ui2Label("Alignment", x, y, optargs);
    ud.align = ui2ComboBox(ALIGN_OPTIONS, ud.align, x + column2_x, y, 140, self.align_combo_box, optargs);

    saveUserData(ud);
end

function br_Awards:getOptionsHeight()
	return 470; 
end

function br_Awards:set_picker_color(col) 
    local ud = self.ud;
    local cpicker = self.cpicker;
	cpicker.color = col;
	cpicker.colorHsv = rgbToHsv(col);
	cpicker.colorHexArgb = argbToHex(col);

	if(ud.theme == br_THEME_NONE)then
	    ud.none_col1 = cpicker.colorHexArgb;
    elseif(ud.theme == br_THEME_BANNER)then
        if(self.selected_color_type == "Primary")then
            ud.banner_col1 = cpicker.colorHexArgb; 
        else
            ud.banner_col2 = cpicker.colorHexArgb;
        end
    elseif(ud.theme == br_THEME_SHIELD)then
        if(self.selected_color_type == "Primary")then
            ud.shield_col1 = cpicker.colorHexArgb;
        else
            ud.shield_col2 = cpicker.colorHexArgb;
        end
    elseif(ud.theme == br_THEME_HEX)then
        if(self.selected_color_type == "Primary")then
            ud.hex_col1 = cpicker.colorHexArgb;
        else
            ud.hex_col2 = cpicker.colorHexArgb;
        end
    elseif(ud.theme == br_THEME_OUTLINE)then
        if(self.selected_color_type == "Primary")then
            ud.outline_col1 = cpicker.colorHexArgb;
        else
            ud.outline_col2 = cpicker.colorHexArgb;
        end
    end
end

function br_Awards:draw_color_picker(x, y)
	local cpicker = self.cpicker;
	
	local w = 630;
	local h = 390;
	local pad = 40;
	
	local hsv;

	-- read HSV
	local svWidth = 260;
	local svHeight = 260;
	local hWidth = 30;
	hsv = uiColorSVPicker(x, y, svWidth, svHeight, cpicker.colorHsv, 0, true);
	hsv = uiColorHuePicker(x + svWidth + 20, y, hWidth, svHeight, hsv, 0, true);
	if hsv.h ~= cpicker.colorHsv.h or hsv.s ~= cpicker.colorHsv.s or hsv.v ~= cpicker.colorHsv.v then
		-- new from HSV
		local newcol = hsvToRgb(hsv);
		newcol.a = cpicker.color.a;
		self:set_picker_color(newcol);
	end
end

draw_example_none = function(x, y, col1)
    local size = 40;
    nvgFillColor(col1);
    nvgSvg("internal/ui/awards/telefrag", x, y + 1, size);
end

draw_example_outline = function(x, y, col1, col2)

    local size = 53;

    -- bottom right corner outline
    nvgFillColor(col2);
    nvgBeginPath();
    nvgRect(x - size, y - size,(size * 2), size * 2);
    nvgFill();
    nvgStrokeWidth(2);
    nvgStrokeColor(col1);
    nvgStroke();

    local svg = "internal/ui/awards/telefrag";
    nvgFillColor(col1);
    nvgSvg(svg, x - 1, y, size - 14);
    nvgSvg(svg, x - 1, y + 2, size - 14);
    nvgSvg(svg, x + 1, y + 2, size - 14);
    nvgSvg(svg, x + 1, y, size - 14);
    nvgFillColor(col2);
    nvgSvg(svg, x, y + 1, size - 14);

end

draw_example_shield = function(x, y, col1, col2)
    local size = 53;

    nvg_shield(x, y, size);
    nvgFillColor(col1);
    nvgFill();

    nvg_shield(x, y, size - 3);
    nvgStrokeWidth(2);
    nvgStrokeColor(col2);
    nvgStroke();

    nvgBeginPath();
    nvgRect(x - (size - 3), y - (size - 3), size * 2 - 6, 10);
    nvgFillColor(col2);
    nvgFill();

    nvgFillColor(col2);
    nvgSvg("internal/ui/awards/telefrag", x, y + 8, size - 14);
end

draw_example_banner = function(x, y, col1, col2)

    local size = 53;
    local side_x = size + 5;

    nvgStrokeColor(col1);
    nvgFillColor(col1);
    -- left corner
    nvgLineCap(NVG_ROUND);
    nvgBeginPath();
    nvgMoveTo(x - side_x, y - size - 2);
    nvgLineTo(x - side_x, y - size + 10);
    nvgStrokeWidth(5);
    nvgStroke();

    nvgBeginPath();
    nvgMoveTo(x - side_x - 5, y - size);
    nvgLineTo(x - side_x - 5, y - size + 8);
    nvgLineTo(x - side_x - 10, y - size + 4);
    nvgClosePath();
    nvgFill();

    -- right corner
    nvgLineCap(NVG_ROUND);
    nvgBeginPath();
    nvgMoveTo(x + side_x, y - size - 2);
    nvgLineTo(x + side_x, y - size + 10);
    nvgStrokeWidth(5);
    nvgStroke();

    nvgBeginPath();
    nvgMoveTo(x + side_x + 5, y - size);
    nvgLineTo(x + side_x + 5, y - size + 8);
    nvgLineTo(x + side_x + 10, y - size + 4);
    nvgClosePath();
    nvgFill();

    --black bottom banner
    local scroll_y = y + 14;

    nvg_banner(x, scroll_y, size - 5);
    nvgFillColor(col2);
    nvgFill();
    nvgStrokeWidth(2);
    nvgStrokeColor(col1);
    nvgStroke();

    --main banner
    nvg_banner(x, y, size);
    nvgFillColor(col1);
    nvgFill();

    -- icon
    nvgFillColor(col2);
    nvgSvg("internal/ui/awards/telefrag", x, y + 1, size - 13);
end

draw_example_hex = function(x, y, col1, col2, scroll_offset_y)
    local size = 63;
    -- complete diamond black bg
    nvg_diamond(x,y,size);
    nvgFillColor(Color(0,0,0));
    nvgFill();

    -- inner blue diamond
    nvg_diamond(x,y,size - 8);
    nvgStrokeColor(col2);
    nvgStrokeWidth(3);
    nvgStroke();

    -- icon
    nvgFillColor(col1);
    nvgSvg("internal/ui/awards/telefrag", x, y, size - 25);

    -- custom scissor for scroll bar clip in properties
    local cutoff = (y + size) - 380;

    --left outline white
    nvgScissor(x - size, y - size, size / 2, size * 2 - cutoff);
    nvg_diamond(x,y,size);
    nvgStrokeWidth(1);
    nvgStrokeColor(Color(100,100,100,a));
    nvgStroke();

    nvg_diamond(x,y,size - 3);
    nvgStrokeColor(Color(200,200,200,a));
    nvgStrokeWidth(1);
    nvgStroke();
    nvgResetScissor();
    
    --right outline white
    nvgScissor(x + size / 2, y - size, size / 2, size * 2 - cutoff);
    nvg_diamond(x,y,size);
    nvgStrokeColor(Color(100,100,100,a));
    nvgStroke();

    nvg_diamond(x,y,size - 3);
    nvgStrokeColor(Color(200,200,200,a));
    nvgStroke();
    nvgResetScissor();
end
