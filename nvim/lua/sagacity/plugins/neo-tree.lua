require("neo-tree").setup({
	close_if_last_window = true,
	enable_diagnostics = true,
	source_selector = {
		winbar = true,
		content_layout = "center",
	},
	default_component_configs = {
		indent = { padding = 0 },
	},
	filesystem = {
		follow_current_file = true,
		hijack_netrw_behavior = "open_current",
		use_libuv_file_watcher = true,
		window = { mappings = { h = "toggle_hidden" } },
	},
	event_handlers = {
		{
			event = "neo_tree_buffer_enter",
			handler = function(_)
				vim.opt_local.signcolumn = "auto"
			end,
		},
	},
})
