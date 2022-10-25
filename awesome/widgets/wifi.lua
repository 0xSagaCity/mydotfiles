-------------------------------------------------
-- Wifi Signal Widget
-------------------------------------------------

local awful = require("awful");
local wibox = require("wibox");
local watch = require("awful.widget.watch");

local HOME_DIR = os.getenv("HOME")
local WIDGET_DIR = HOME_DIR .. '/.config/awesome/widgets/'
local ICONS_DIR = WIDGET_DIR .. 'icons/'
local NET_SIGNAL_CMD = "bash -c \"nmcli -t -f IN-USE,SIGNAL device wifi | grep \'*\'\""
local NET_STATUS_CMD = "nmcli network connectivity"
local NET_INFO_CMD = "nmcli -t -f general.connection,ip4.address device show wlp6s0"

local wifi_widget = {}

local function convert_to_h(bytes)
    local speed
    local dim
    local bits = bytes * 8
    if bits < 1000 then
        speed = bits
        dim = 'b/s'
    elseif bits < 1000000 then
        speed = bits/1000
        dim = 'KB/s'
    elseif bits < 1000000000 then
        speed = bits/1000000
        dim = 'Mb/s'
    elseif bits < 1000000000000 then
        speed = bits/1000000000
        dim = 'Gb/s'
    else
        speed = tonumber(bits)
        dim = 'b/s'
    end
    return math.floor(speed + 0.5) .. dim
end

local function split(string_to_split, separator)
    if separator == nil then separator = "%s" end
    local t = {}

    for str in string.gmatch(string_to_split, "([^".. separator .."]+)") do
        table.insert(t, str)
    end

    return t
end


local function worker(user_args)
    local args = user_args or {}
    local interface = args.interface or '*'
    local timeout = args.timeout or 1
    local width = args.width or 55
	local icons = user_args.icons;
    net_speed_widget = wibox.widget {
		{
			id = 'icon',
			widget = wibox.widget.imagebox,
			image = icons[4],
		},
        {
            id = 'rx_speed',
            forced_width = width,
            align = 'right',
            widget = wibox.widget.textbox
        },
        {
			id = 'icon',
            image = ICONS_DIR .. 'down.svg',
            widget = wibox.widget.imagebox
        },
        {
			id = 'icon',
            image =  ICONS_DIR .. 'up.svg',
            widget = wibox.widget.imagebox
        },
        {
            id = 'tx_speed',
            forced_width = width,
            align = 'left',
            widget = wibox.widget.textbox
        },
        layout = wibox.layout.fixed.horizontal,
        set_rx_text = function(self, new_rx_speed)
            self:get_children_by_id('rx_speed')[1]:set_text(tostring(new_rx_speed))
        end,
		update_strength = function(self, strength)
			local strength_icon = icons[math.ceil(strength/25) + 1]
			if self.icon.image ~= strength_icon then
				self.icon.image = strength_icon
			end
		end,
		update_net = function(self, is_connected)
			self:set_opacity(is_connected and 1 or 0.5)
			self:emit_signal('widget::redraw_needed')
		end,
        set_tx_text = function(self, new_tx_speed)
            self:get_children_by_id('tx_speed')[1]:set_text(tostring(new_tx_speed))
        end
    }

    -- make sure these are not shared across different worker/widgets (e.g. two monitors)
    -- otherwise the speed will be randomly split among the worker in each monitor
    local prev_rx = 0
    local prev_tx = 0
    local update_widget = function(widget, stdout)
        local cur_vals = split(stdout, '\r\n')
        local cur_rx = 0
        local cur_tx = 0
        for i, v in ipairs(cur_vals) do
            if i%2 == 1 then cur_rx = cur_rx + v end
            if i%2 == 0 then cur_tx = cur_tx + v end
        end
        local speed_rx = (cur_rx - prev_rx) / timeout
        local speed_tx = (cur_tx - prev_tx) / timeout
        widget:set_rx_text(convert_to_h(speed_rx))
        widget:set_tx_text(convert_to_h(speed_tx))
        prev_rx = cur_rx
        prev_tx = cur_tx
    end
	net_speed_widget:connect_signal("button::press", function(_, _, _, button)
			if button == 1 then
				local nmtui_window = function(c) return awful.rules.match(c, {instance = "nmtui"}) end;
				for c in awful.client.iterate(nmtui_window) do
					c:jump_to(false);
					return;
				end;
				awful.spawn.with_shell("nmcli device wifi rescan && kitty --class nmtui -e nmtui", false);
			elseif button == 3 then
				awful.spawn.easy_async("nmcli network connectivity check", function (stdout) update_conn(wifi_widget, stdout) end) 
			end;
		end
	);

    watch(string.format([[bash -c "cat /sys/class/net/%s/statistics/*_bytes"]], interface),
        timeout, update_widget, net_speed_widget)

    return net_speed_widget
end

return setmetatable(wifi_widget, {	__call = function(_, ...)
		return worker(...);
	end
});
