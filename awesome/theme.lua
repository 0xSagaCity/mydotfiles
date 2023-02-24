local gears = require("gears")

local theme = {}

theme.font = "JetBrains Mono Medium 10"
theme.hotkeys_font = "JetBrains Mono Medium 10"
theme.hotkeys_description_font = "JetBrains Mono Medium 10"

theme.hotkeys_modifiers_fg = "#cdd6f4"
theme.hotkeys_fg = "#cdd6f4"

local walldir = "/home/sagacity/Pictures/Everforest/"
theme.wallpapers = { walldir .. "default.jpg" }

theme.bg_normal = "#04040e"
theme.bg_focus = "#11111b"
theme.bg_urgent = "#f38ba8"
theme.fg_normal = "#74c7ec"
theme.fg_focus = "#f5c2e7"
theme.fg_urgent = "#11111b"
theme.fg_minimize = "#6c7086"

theme.bg_wibar = "#1f1e1c"

theme.border_width = 1
theme.border_focus = "#2c3046"
theme.border_normal = "#1f1e1c"
theme.border_marked = theme.border_normal

theme.menu_font = "JetBrains Mono Medium 10"
theme.menu_bg_normal = "#11111b"
theme.menu_bg_focus = "#6c7086"
theme.menu_border_width = 1
theme.menu_border_color = "#11111b"
theme.menu_fg_normal = "#cdd6f4"
theme.menu_fg_focus = theme.menu_fg_normal

local icondir = gears.filesystem.get_configuration_dir() .. "icons/"
theme.widget_cpu = icondir .. "cpu.png"
theme.widget_mem = icondir .. "mem.png"
theme.widget_media = { spotify = icondir .. "spoti.png", default = icondir .. "media.png" }
theme.widget_batt = icondir .. "bat.png"
theme.widget_clock = icondir .. "clock.png"
theme.widget_vol = icondir .. "spkr.png"
theme.widget_brightness = icondir .. "brightness.png"
theme.widget_net = {
	icondir .. "wifi_bar_0.png",
	icondir .. "wifi_bar_1.png",
	icondir .. "wifi_bar_2.png",
	icondir .. "wifi_bar_3.png",
	icondir .. "wifi_bar_4.png",
}

theme.widget_icon_gap = 8
theme.widget_gap = 10
theme.bg_systray = "#04040e"
theme.systray_icon_spacing = 8

theme.menu_launcher = icondir .. "arch.png"
theme.menu_lock_icon = icondir .. "lock.svg"
theme.menu_logout_icon = icondir .. "log-out.svg"
theme.menu_reboot_icon = icondir .. "refresh-cw.svg"
theme.menu_power_icon = icondir .. "power.svg"

theme.minimise_def_icon = icondir .. "minimise_def.png"

theme.taglist_font = "JetBrains Mono 10"
theme.taglist_bg_focus = "#04040e"
theme.taglist_bg_urgent = "#04040e"
theme.taglist_fg_focus = "#7199EE"
theme.taglist_fg_occupied = "#89b4fa"
theme.taglist_fg_urgent = theme.taglist_fg_occupied
theme.taglist_fg_empty = "#2e2e3e"

theme.tasklist_bg_normal = "#04040e"
theme.tasklist_disable_task_name = true
theme.tasklist_plain_task_name = true
theme.tasklist_bg_normal = "#89b4fa"
theme.useless_gap = 2

theme.notification_font = "JetBrains Mono 10"
theme.notification_bg = "#04040e"
theme.notification_fg = "#89b4fa"
theme.notification_shape = function(cr, w, h)
	gears.shape.rounded_rect(cr, w, h, 0)
end
theme.notification_border_color = theme.notification_fg
theme.notification_max_height = 200
theme.notification_max_width = 500
theme.notification_icon_size = 100

return theme
