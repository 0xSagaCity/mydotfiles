-------------------------------------------------
-- Brightness widget
-- Launches fixmonitors script on right click
-------------------------------------------------

local awful = require("awful");
local wibox = require("wibox");
local watch = require("awful.widget.watch");

local GET_BRIGHTNESS_CMD = "bash -c 'xbacklight -get | cut -d. -f1'";

local brightness_widget = {}

local worker = function(user_args)

	local args = user_args or {}

	local icon = args.icon;
	local font = args.font or "Oxanium Bold 9";
	local timeout = 5;
	
	brightness_widget = wibox.widget{
		layout = wibox.layout.fixed.horizontal,
		spacing = args.space,
		{
			id = "icon",
			widget = wibox.widget.imagebox,
			image = icon
		},
		{
			id = "brightness",
			font = font,
			widget = wibox.widget.textbox
		},

		update_brightness = function(self, brightness)
			
			local brightness_markup = string.format("<span font='%s' foreground='%s'>%s%%</span>", font, "#FF6188", brightness);

			if self.brightness:get_markup() ~= brightness_markup then
				self.brightness:set_markup(brightness_markup);
			end
		end
	}

	local update_widget = function(widget, stdout, stderr, _, _)
		widget:update_brightness(string.sub(stdout, 0, -2))
	end;

	watch(GET_BRIGHTNESS_CMD, timeout, update_widget, brightness_widget);

	--- Adds mouse controls to the widget:
	--  - left click - max brightness
	--  - scroll up - brightness up
	--  - scroll down - brightness down
	--  - right click - fix monitors script
	brightness_widget:connect_signal("button::press", function(_, _, _, button)
			if button == 1 then
				awful.spawn.with_shell("xbacklight -inc 10");
			elseif button == 4 then
				awful.spawn.with_shell("xbacklight -inc 2");
			elseif button == 5 then
				awful.spawn.with_shell("xbacklight -dec 2");
			elseif button == 3 then
				awful.spawn("fixmonitors", false)
				return
			end;
			awful.spawn.easy_async(GET_BRIGHTNESS_CMD, function(stdout, stderr, _, _) update_widget(brightness_widget, stdout, stderr) end)
		end
	);

	return brightness_widget;
end;

return setmetatable(brightness_widget, {	__call = function(_, ...)
		return worker(...);
	end
});