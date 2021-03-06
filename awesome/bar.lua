local gears = require("gears")
local lain_widget  = require("widgets.lain.widget")
local awful = require("awful")
local beautiful = require("beautiful")
local wibox = require("wibox")
local markup = require("widgets.lain.markup")

local media_widget = require("widgets.media")
local volume_widget = require("widgets.pipewire")
local wifi_widget = require("widgets.wifi")
local brightness_widget = require("widgets.brightness")
local cal_task = require("widgets.cal_task")


local menu_bg = function (cr, w, h) gears.shape.rounded_rect(cr, w, h, 10) end
-- [[[ Main Menu
local mymainmenu = awful.menu({
  items = {
    {"Lock", "dm-tool lock", beautiful.menu_lock_icon},
    {"Log out", function() awesome.quit() end, beautiful.menu_logout_icon},
    {"Reboot", "reboot", beautiful.menu_reboot_icon},
    {"Power off", "shutdown now", beautiful.menu_power_icon},
  },
  theme = {
    height = 42,
    width = 160
  }
})
mymainmenu.wibox.shape = menu_bg

local menulauncher = wibox.widget.imagebox(beautiful.menu_launcher);
menulauncher:connect_signal("button::press", function(_, _, _, button) mymainmenu:show({coords = {x = 0, y = 32}}) end)

-- Hide the menu when the mouse leaves it
local mouse_in_main = false
-- when mouse leaves launcher icon without entering menu. close it
menulauncher:connect_signal("mouse::leave", function()
  if mymainmenu.wibox.visible then
    gears.timer{
      timeout = 0.1,
      autostart = true,
      callback = function () if not mouse_in_main then mymainmenu:hide() end end,
      single_shot = true
    }
  end
end
)
mymainmenu.wibox:connect_signal("mouse::enter", function() mouse_in_main = true end)
mymainmenu.wibox:connect_signal("mouse::leave", function()
  mymainmenu:hide()
  mouse_in_main = false
end
)
-- ]]]


-- [[[ Middle Box
local on_middlebar_mouse_button = function(_, _, _, button)
  if button == 3 then
    awful.spawn("rofi -modi window -show window -theme horizon", false)
  elseif button == 4 then
    if mouse.screen ~= awful.screen.focused({client = true, mouse = false})	then awful.screen.focus(mouse.screen) end
    awful.client.focus.byidx(-1)
  elseif button == 5 then
    if mouse.screen ~= awful.screen.focused({client = true, mouse = false})	then awful.screen.focus(mouse.screen) end
    awful.client.focus.byidx(1)
  end
end
-- ]]]


-- [[[Taglist //tasklist
local taglist_buttons = gears.table.join(
-- move to tag on clicking the title
awful.button({}, 1, function(t) t:view_only() end),
-- move focused window to clicked tag
awful.button({modkey}, 1, function(t)
  if client.focus then
    client.focus:move_to_tag(t)
  end
end
),
-- adds focused window to the clicked tag also
awful.button({modkey}, 3, function(t)
  if client.focus then
    client.focus:toggle_tag(t)
  end
end
),
-- moves between tags on scroll wheel
awful.button({}, 4, function(t) awful.tag.viewnext(t.screen) end),
awful.button({}, 5,	function(t)	awful.tag.viewprev(t.screen) end)
)

local tasklist_buttons = gears.table.join(
-- unminimise window
awful.button({}, 1, function(c)	c.minimized = false end)
)

-- ]]]

-- [[[ Widgets

-- Textclock
local mytextclock = wibox.widget.textclock(markup("#fe8019", "%a %d %b") .. markup("#cc241d", "::") .. markup("#83a598", "%I:%M %p"));
-- mytextclock.font = beautiful.font
local clock_widget = wibox.widget {
  widget = wibox.layout.fixed.horizontal,
  spacing = beautiful.widget_icon_gap,
  wibox.widget.imagebox(beautiful.widget_clock),
  mytextclock
}

-- Calendar
cal_task.attach(clock_widget)
clock_widget:buttons(gears.table.join(
clock_widget:buttons(),
awful.button({}, 2, function() mytextclock:force_update() end)
))


-- CPU
local cpu_widget = {
  widget = wibox.layout.fixed.horizontal,
  spacing = beautiful.widget_icon_gap,
  wibox.widget.imagebox(beautiful.widget_cpu),
  lain_widget.cpu({settings = function()
    widget:set_markup(markup.fontfg(beautiful.font, "#b8bb26", cpu_now.usage .. "%"))
  end}).widget,
}

-- Battery
local battery_widget = {
  widget = wibox.layout.fixed.horizontal,
  spacing = beautiful.widget_icon_gap,
  wibox.widget.imagebox(beautiful.widget_batt),
  lain_widget.bat({settings = function()
    local perc = bat_now.perc ~= "N/A" and bat_now.perc .. "%" or "..."

    if bat_now.ac_status == 1 then
      perc = perc .. " A/C"
    end

    widget:set_markup(markup.fontfg(beautiful.font, "#d3869b", perc))
  end
})}

-- MEM
local memory_widget = {
  widget = wibox.layout.fixed.horizontal,
  spacing = beautiful.widget_icon_gap,
  wibox.widget.imagebox(beautiful.widget_mem),
  lain_widget.mem({settings = function() widget:set_markup(markup.fontfg(beautiful.font, "#fabd2f", mem_now.used .. "M")) end}).widget,
}

-- Systray Container
local mysystray = wibox.container.margin(wibox.widget.systray(), 0, beautiful.systray_icon_spacing, 1, 1)

-- Media Widget
local my_media_widget = media_widget({icons = beautiful.widget_media, font = beautiful.font, space = beautiful.widget_icon_gap})

-- Volume Widget
local my_volume_widget = volume_widget({icon = beautiful.widget_vol, font = beautiful.font, space = beautiful.widget_icon_gap})

-- Wifi Widget
local my_wifi_widget = wifi_widget({icons = beautiful.widget_net, font = beautiful.font, space = beautiful.widget_icon_gap})

-- Brightness Widget
local my_brightness_widget = brightness_widget({icon = beautiful.widget_brightness, font = beautiful.font, space = beautiful.widget_icon_gap})

-- ]]]


function generate_wibar(s)
  -- layout indicator
  -- s.mylayoutbox = awful.widget.layoutbox(s)
  -- s.mylayoutbox:buttons(gears.table.join(
  -- 	awful.button({}, 1, function() awful.layout.inc(1) end),
  -- 	awful.button({}, 2, function() awful.layout.set(awful.layout.layouts[1]) end),
  -- 	awful.button({}, 3, function() awful.layout.inc(-1) end)
  -- ))

  s.mytaglist = awful.widget.taglist {
    screen = s,
    filter = awful.widget.taglist.filter.all,
    buttons = taglist_buttons,
  }

  s.mytasklist = awful.widget.tasklist {
    screen = s,
    filter = awful.widget.tasklist.filter.minimizedcurrenttags,
    buttons = tasklist_buttons,
    layout   = {
      spacing = 2,
      layout  = wibox.layout.fixed.horizontal
    },
    widget_template = {
      {
        id     = 'icon_role',
        widget = wibox.widget.imagebox,
        image = beautiful.minimise_def_icon			-- default icon for apps without icon
      },
      widget = wibox.container.background,
      bg = "#1d2021",
      shape = gears.shape.circle,
      shape_border_width = 5,
      shape_border_color = "#00000000"
    }
  }

  local my_middle_widget = wibox.container.place(
  wibox.container.margin(s.mytasklist, 7, 10, 5, 5),
  "right"
  )
  my_middle_widget.fill_horizontal = true
  my_middle_widget:connect_signal("button::press", on_middlebar_mouse_button);

  s.mywibar = awful.wibar({ position = "bottom", screen = s, bg = beautiful.bg_wibar, fg = beautiful.fg_normal, width = 1920, height = 20 })

  s.mywibar:setup {
    layout = wibox.layout.align.horizontal,
    { -- Left widgets
    layout = wibox.layout.fixed.horizontal,
    menulauncher,
    s.mytaglist,
    s.mylayoutbox,
    {
      widget = wibox.widget.separator,
      span_ratio = 0.7,
      color = beautiful.fg_normal,
      orientation = 'vertical',
      forced_width= 2
    },
  },
  my_middle_widget,
  {	-- Right widgets
  layout = wibox.layout.fixed.horizontal,
  spacing = beautiful.widget_gap,
  spacing_widget = {
    widget = wibox.widget.separator,
    span_ratio = 0.7,
    color = beautiful.fg_normal,
  },
  my_media_widget,
  my_volume_widget,
  s.index == 1 and memory_widget or nil,
  s.index == 1 and cpu_widget or nil,
  s.index == 1 and my_brightness_widget or nil,
  battery_widget,
  my_wifi_widget,
  clock_widget,
  s.index == 1 and mysystray or nil,
},
        }
      end

      return generate_wibar;
