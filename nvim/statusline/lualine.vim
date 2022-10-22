lua << EOF
local status, lualine = pcall(require, "lualine")
if (not status) then return end

	lualine.setup {
		options = {
			icons_enabled = true,
			theme = auto,
			section_separators = { left = '', right = '' },
			component_separators = {left = ' ', right = '/'},
			disabled_filetypes = {}
			},
		sections = {
			lualine_a = { 'mode' },
			lualine_b = {},
			lualine_c = {{
			'filename',
			file_status = true, -- displays file status (readonly status, modified status)
			path = 0 -- 0 = just filename, 1 = relative path, 2 = absolute path
			}},
		lualine_x = {
			{ 'diagnostics', sources = {"nvim_diagnostic"}, symbols = {error = ' ', warn = ' ', info = ' ', hint = ' '} },
			'encoding',
			'filetype'
			},
		lualine_y = {'progress'},
		lualine_z = { 'location' },
		},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {{
		'filename',
		file_status = true, -- displays file status (readonly status, modified status)
		path = 0 -- 0 = just filename, 1 = relative path, 2 = absolute path
		}},
	lualine_x = {'location'},
	lualine_y = {},
	lualine_z = {}
	},
tabline = {
	lualine_a = {"os.date('%a-%d-%h')", 'data', "require'lsp-status'.status()"},
	lualine_b = {'branch'},
	lualine_c = {{
		'filename',
		file_status = true, -- displays file status (readonly status, modified status)
		path = 1 -- 0 = just filename, 1 = relative path, 2 = absolute path
	}},
	lualine_x = {},
	lualine_y = { {'buffers', symbols = {
        modified = ' ●',      -- Text to show when the buffer is modified
        alternate_file = '', -- Text to show to identify the alternate file
        directory =  '',     -- Text to show when the buffer is a directory
      },
 }},
	lualine_z = {{
			'diff',
			colored = true, -- Displays a colored diff status if set to true
			diff_color = {
				-- Same color values as the general color option can be used here.
				added    = 'DiffAdd',    -- Changes the diff's added color
				modified = 'DiffChange', -- Changes the diff's modified color
				removed  = 'DiffDelete', -- Changes the diff's removed color you
				},
			symbols = {added = '+', modified = '~', removed = '-'}, -- Changes the symbols used by the diff.
			source = nil, -- A function that works as a data source for diff.
			-- It must return a table as such:
			-- { added = add_count, modified = modified_count, removed = removed_count }
			-- or nil on failure. count <= 0 won't be displayed.
		}},
},
	extensions = {'fugitive'}
}

EOF
