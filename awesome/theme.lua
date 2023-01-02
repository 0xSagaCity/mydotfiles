local gears = require("gears")

local theme = {}

theme.font = "Cartograph CF Regular 10"
theme.hotkeys_font = "Cartograph CF Regular 10"
theme.hotkeys_description_font = "Cartograph CF Regular 10"

theme.hotkeys_modifiers_fg = "#FAFAFA"
theme.hotkeys_fg = "#FAFAFA"

local walldir = "/home/sagacity/Pictures/Gruvbox/"
theme.wallpapers = { walldir .. "plant.jpg" }

theme.bg_normal = "#0d0e0f"
theme.bg_focus = "#131313"
theme.bg_urgent = "#161615"
theme.fg_normal = "#82CFFF"
theme.fg_focus = "#FF6F00"
theme.fg_urgent = "#EE5396"
theme.fg_minimize = "#FAFAFA"

theme.bg_wibar = "#0d0e0f11"

theme.border_width = 1
theme.border_focus = "#30444E"
theme.border_normal = "#3c3836"
theme.border_marked = theme.border_normal

theme.menu_font = "Cartograph CF 10"
theme.menu_bg_normal = "#0d0e0f"
theme.menu_bg_focus = "#90A4AE"
theme.menu_border_width = 2
theme.menu_border_color = "#101f1a"
theme.menu_fg_normal = "#FAFAFA"
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
theme.bg_systray = "#0d0e0f"
theme.systray_icon_spacing = 5

theme.menu_launcher = icondir .. "arch.png"
theme.menu_lock_icon = icondir .. "lock.svg"
theme.menu_logout_icon = icondir .. "log-out.svg"
theme.menu_reboot_icon = icondir .. "refresh-cw.svg"
theme.menu_power_icon = icondir .. "power.svg"

theme.minimise_def_icon = icondir .. "minimise_def.png"

theme.taglist_font = "Cartograph CF 10"
theme.taglist_bg_focus = "#0d0e0f"
theme.taglist_bg_urgent = "#0d0e0f"
theme.taglist_fg_focus = "#7199EE"
theme.taglist_fg_occupied = "#82CFFF"
theme.taglist_fg_urgent = theme.taglist_fg_occupied
theme.taglist_fg_empty = "#90A4AE"

theme.tasklist_bg_normal = "#0d0e0f"
theme.tasklist_disable_task_name = true
theme.tasklist_plain_task_name = true
theme.tasklist_bg_normal = "#82CFFF"
theme.useless_gap = 4

theme.notification_font = "Cartograph CF 10"
theme.notification_bg = "#0d0e0f"
theme.notification_fg = "#82CFFF"
theme.notification_shape = function(cr, w, h)
	gears.shape.rounded_rect(cr, w, h, 16)
end
theme.notification_border_color = theme.notification_fg
theme.notification_max_height = 200
theme.notification_max_width = 500
theme.notification_icon_size = 100

return theme
