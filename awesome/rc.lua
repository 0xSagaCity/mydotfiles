-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty")

naughty.config.defaults = {
	timeout = 1,
	text = "",
	screen = 1,
	ontop = true,
	margin = "5",
	border_width = "1",
	position = "top_right",
}

-- Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
	naughty.notify({
		preset = naughty.config.presets.critical,
		title = "Oops, there were errors during startup!",
		text = awesome.startup_errors,
		position = "top_right",
	})
end

-- Handle runtime errors after startup
do
	local in_error = false
	awesome.connect_signal("debug::error", function(err)
		-- Make sure we don't go into an endless error loop
		if in_error then
			return
		end
		in_error = true

		naughty.notify({
			preset = naughty.config.presets.critical,
			title = "Oops, an error happened!",
			text = tostring(err),
			position = "top_right",
		})
		in_error = false
	end)
end

-- Autostart windowless processes
local function run_once(cmd_arr)
	for _, cmd in ipairs(cmd_arr) do
		awful.spawn.with_shell(string.format("pgrep -u $USER -fx '%s' > /dev/null || (%s)", cmd, cmd))
	end
end
awful.util.spawn("playerctld daemon")

terminal = "kitty"
editor = "nvim"
modkey = "Mod4" -- Super Key
browser = "brave"
tagnames = { " [म]", "[द]", "[र]", "[फ]", "[क]", "[र] " }
awful.layout.layouts = {
	awful.layout.suit.tile,
	awful.layout.suit.tile.bottom,
	awful.layout.suit.magnifier,
	awful.layout.suit.spiral.dwindle,
	awful.layout.suit.max,
}

beautiful.init(gears.filesystem.get_configuration_dir() .. "theme.lua")

-- Screen
-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", function(s)
	gears.wallpaper.maximized(beautiful.wallpapers[s.index], s, true)
end)

local generate_wibar = require("bar")
awful.screen.connect_for_each_screen(function(s)
	gears.wallpaper.maximized(beautiful.wallpapers[s.index], s, true)
	-- gears.wallpaper.centered(beautiful.wallpapers[s.index], s, "#08090B", 1)
	-- Tags
	awful.tag(tagnames, s, awful.layout.layouts[1])
	generate_wibar(s)
end)

-- Set keys
local keybinds = require("keybinds")

clientbuttons = gears.table.join(
	awful.button({}, 1, function(c)
		c:emit_signal("request::activate", "mouse_click", { raise = true })
	end),
	awful.button({ modkey }, 1, function(c)
		c:emit_signal("request::activate", "mouse_click", { raise = true })
		awful.mouse.client.move(c)
	end),
	awful.button({ modkey }, 3, function(c)
		c:emit_signal("request::activate", "mouse_click", { raise = true })
		awful.mouse.client.resize(c)
	end),
	awful.button({ modkey }, 2, function(c)
		c:kill()
	end)
)

root.keys(keybinds.globalkeys)

-- Rules
awful.rules.rules = {
	-- All clients will match this rule.
	{
		rule = {},
		properties = {
			border_width = beautiful.border_width,
			border_color = beautiful.border_normal,
			focus = awful.client.focus.filter,
			raise = true,
			keys = keybinds.clientkeys,
			buttons = clientbuttons,
			screen = awful.screen.preferred,
			placement = awful.placement.no_overlap + awful.placement.no_offscreen,
		},
	},
	-- Floating clients.
	{
		rule_any = {
			instance = {
				"pinentry",
				"nmtui", -- set when launched from wifi widget
			},
			class = {
				"Pavucontrol",
				"Blueman-manager",
				"Qalculate-gtk",
				"Tor Browser", -- Needs a fixed window size to avoid fingerprinting by screen size.
			},
			-- Note that the name property shown in xprop might be set slightly after creation of the client
			-- and the name shown there might not match defined rules here.
			name = {
				"Event Tester", -- xev.
			},
			role = {
				"pop-up", -- e.g. Google Chrome's (detached) Developer Tools.
			},
		},
		properties = { floating = true, placement = awful.placement.centered, ontop = true },
	},

	--Set music stuff to always map on the tag named "five" on screen 1.
	{
		rule_any = {
			instance = { "mpv-ytm" },
			class = { "Spotify" },
		},
		properties = { screen = 1, tag = "five" },
	},

	--Stuff that needs to launch in the second monitor
}
-- Signals
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function(c)
	-- Set new windows at the slave
	if not awesome.startup then
		awful.client.setslave(c)
	end

	if awesome.startup and not c.size_hints.user_position and not c.size_hints.program_position then
		-- Prevent clients from being unreachable after screen count changes.
		awful.placement.no_offscreen(c)
	end

	-- Windows like spotify only set class name after window opens.
	-- So add a listener for when it attains classname and then apply rules
	if c.name == nil and c.class == nil then
		c.minimized = true
		c:connect_signal("property::class", function()
			c.minimized = false
			awful.rules.apply(c)
		end)
	end

	c.shape = gears.shape.rounded_rect
end)

awful.spawn("xset r rate 220 40")
awful.spawn("picom")

client.connect_signal("focus", function(c)
	c.border_color = beautiful.border_focus
end)
client.connect_signal("unfocus", function(c)
	c.border_color = beautiful.border_normal
end)
