local status, _ = pcall(vim.cmd, "colorscheme onedarkpro")
if not status then
  print("colorscheme not found")
  return
end

-- onedarkpro theme
require("onedarkpro").setup({
  dark_theme = "onedark_dark", -- The default dark theme
  light_theme = "onelight", -- The default light theme
  caching = false, -- Use caching for the theme?
  cache_path = vim.fn.expand(vim.fn.stdpath("cache") .. "/onedarkpro/"), -- The path to the cache directory
	colors = { onedark_dark = {bg = "#101215"} }, -- Override default colors by specifying colors for 'onelight' or 'onedark' themes
  highlights = {}, -- Override default highlight and/or filetype groups
  filetypes = { -- Override which filetype highlight groups are loaded
    javascript = true,
    lua = true,
    markdown = true,
    php = true,
    python = true,
    ruby = true,
    rust = true,
    toml = true,
    yaml = true,
  },
  plugins = { -- Override which plugin highlight groups are loaded
    -- See the Supported Plugins section for a list of available plugins
  },
  styles = { -- Choose from "bold,italic,underline"
    types = "bold", -- Style that is applied to types
    numbers = "bold", -- Style that is applied to numbers
    strings = "italic", -- Style that is applied to strings
    comments = "italic", -- Style that is applied to comments
    keywords = "bold", -- Style that is applied to keywords
    constants = "NONE", -- Style that is applied to constants
    functions = "bold", -- Style that is applied to functions
    operators = "bold", -- Style that is applied to operators
    variables = "italic", -- Style that is applied to variables
    conditionals = "bold", -- Style that is applied to conditionals
    virtual_text = "undercurl", -- Style that is applied to virtual text
  },
  options = {
    bold = true, -- Use bold styles?
    italic = true, -- Use italic styles?
    underline = true, -- Use underline styles?
    undercurl = true, -- Use undercurl styles?
    cursorline = true, -- Use cursorline highlighting?
    transparency = true, -- Use a transparent background?
    terminal_colors = false, -- Use the theme's colors for Neovim's :terminal?
    window_unfocused_color = false, -- When the window is out of focus, change the normal background?
  }
})
