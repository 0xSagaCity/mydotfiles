local gears = require("gears")

local theme = {}

theme.font                       = "Cartograph CF 10"
theme.hotkeys_font               = "Cartograph CF 10"
theme.hotkeys_description_font   = "Cartograph CF 10"

theme.hotkeys_modifiers_fg       = "#A0A8CD"
theme.hotkeys_fg                 = "#A0A8CD"

local walldir                    = "/home/sagacity/Pictures/Wallpapers/TokyoDark/"
theme.wallpapers                 = { walldir .. "earth.jpg" }

theme.bg_normal                  = "#11121D"
theme.bg_focus                   = "#16161E"
theme.bg_urgent                  = "#16161E"
theme.fg_normal                  = "#C0CAF5"
theme.fg_focus                   = "#F6955B"
theme.fg_urgent                  = "#EE6D85"
theme.fg_minimize                = "#A0A8CD"

theme.bg_wibar                   = "#0D0C11"

theme.border_width               = 1
theme.border_focus               = "#33331D"
theme.border_normal              = "#22221D"
theme.border_marked              = theme.border_normal

theme.menu_font                  = "Cartograph CF 10"
theme.menu_bg_normal             = "#11121D"
theme.menu_bg_focus              = "#4A5057"
theme.menu_border_width          = 5
theme.menu_border_color          = "#16161E"
theme.menu_fg_normal             = "#A0A8CD"
theme.menu_fg_focus              = theme.menu_fg_normal

local icondir                    = gears.filesystem.get_configuration_dir() .. "icons/"
theme.widget_cpu                 = icondir .. "cpu.png"
theme.widget_mem                 = icondir .. "mem.png"
theme.widget_media               = {spotify = icondir .. "spoti.png", default = icondir .. "media.png"}
theme.widget_batt                = icondir .. "bat.png"
theme.widget_clock               = icondir .. "clock.png"
theme.widget_vol                 = icondir .. "spkr.png"
theme.widget_brightness          = icondir .. "brightness.png"
theme.widget_net                 = {icondir.."wifi_bar_0.png", icondir.."wifi_bar_1.png", icondir.."wifi_bar_2.png", icondir.."wifi_bar_3.png", icondir.."wifi_bar_4.png"}

theme.widget_icon_gap            = 8
theme.widget_gap                 = 20
theme.bg_systray                 = "#11121D"
theme.systray_icon_spacing       = 5

theme.menu_launcher              = icondir .. "arch.png"
theme.menu_lock_icon             = icondir .. "lock.svg"
theme.menu_logout_icon           = icondir .. "log-out.svg"
theme.menu_reboot_icon           = icondir .. "refresh-cw.svg"
theme.menu_power_icon            = icondir .. "power.svg"

theme.minimise_def_icon          = icondir .. "minimise_def.png"

theme.taglist_font               = "Cartograph CF 10"
theme.taglist_bg_focus           = "#11121D"
theme.taglist_bg_urgent          = "#11121D"
theme.taglist_fg_focus           = "#7199EE"
theme.taglist_fg_occupied        = "#C0CAF5"
theme.taglist_fg_urgent          = theme.taglist_fg_occupied
theme.taglist_fg_empty           = "#4A5057"

theme.tasklist_bg_normal         = "#11121D"
theme.tasklist_disable_task_name = true
theme.tasklist_plain_task_name   = true
theme.tasklist_bg_normal         = "#C0CAF5"
theme.useless_gap                = 4

theme.notification_font          = "Cartograph CF 10"
theme.notification_bg            = "#11121D"
theme.notification_fg            = "#C0CAF5"
theme.notification_shape         = function(cr, w, h) gears.shape.rounded_rect(cr, w, h, 5) end
theme.notification_border_color  = theme.notification_fg
theme.notification_max_height    = 200
theme.notification_max_width     = 500
theme.notification_icon_size     = 100


return theme
