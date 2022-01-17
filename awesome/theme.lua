local gears = require("gears")

local theme = {}

theme.font                       = "Victor Mono Bold 10"
theme.hotkeys_font               = "Victor Mono Bold 10"
theme.hotkeys_description_font   = "Victor Mono Bold 10"

theme.hotkeys_modifiers_fg       = "#458588"
theme.hotkeys_fg                 = "#83a598"

local walldir                    = gears.filesystem.get_configuration_dir() .. "wallpapers/newGruvComp/"
theme.wallpapers                 = { walldir .. "materialSpace.png" }

theme.bg_normal                  = "#1d2021"
theme.bg_focus                   = "#282828"
theme.bg_urgent                  = "#282828"
theme.fg_normal                  = "#ebdbb2"
theme.fg_focus                   = "#fe8019"
theme.fg_urgent                  = "#cc241d"
theme.fg_minimize                = "#83a598"

theme.bg_wibar                   = "#1d2021ff"

theme.border_width               = 1
theme.border_focus               = "#b8bb26"
theme.border_normal              = "#1f2335"
theme.border_marked              = theme.border_normal

theme.menu_font                  = "Victor Mono Bold 10"
theme.menu_bg_normal             = "#1d2021"
theme.menu_bg_focus              = "#282828"
theme.menu_border_width          = 5
theme.menu_border_color          = "#00000000"
theme.menu_fg_normal             = "#83a598"
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
theme.bg_systray                 = "#1d2021"
theme.systray_icon_spacing       = 5

theme.menu_launcher              = icondir .. "ubuntu.png"
theme.menu_lock_icon             = icondir .. "lock.svg"
theme.menu_logout_icon           = icondir .. "log-out.svg"
theme.menu_reboot_icon           = icondir .. "refresh-cw.svg"
theme.menu_power_icon            = icondir .. "power.svg"

theme.minimise_def_icon          = icondir .. "minimise_def.png"

theme.taglist_font               = "Victor Mono Bold 11"
theme.taglist_bg_focus           = "#1d2021"
theme.taglist_bg_urgent          = "#00000000"
theme.taglist_fg_focus           = "#fe8019"
theme.taglist_fg_occupied        = "#8ec07c"
theme.taglist_fg_urgent          = theme.taglist_fg_occupied
theme.taglist_fg_empty           = "#665c54"

theme.tasklist_bg_normal         = "#1d2021"
theme.tasklist_disable_task_name = true
theme.tasklist_plain_task_name   = true
theme.tasklist_bg_normal         = "#fbf1c7"
theme.useless_gap                = 2

theme.notification_font          = "Victor Mono Bold 10"
theme.notification_bg            = "#1d2021"
theme.notification_fg            = "#fe8019"
theme.notification_shape         = function(cr, w, h) gears.shape.rounded_rect(cr, w, h, 5) end
theme.notification_border_color  = theme.notification_fg
theme.notification_max_height    = 150
theme.notification_max_width     = 400
theme.notification_icon_size     = 80
theme.notification_position      = "bottom_right"


return theme
