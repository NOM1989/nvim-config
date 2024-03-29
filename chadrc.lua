---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  theme_toggle = { "bearded-arc", "palenight" },
  theme = "palenight",
  hl_override = highlights.override,
  hl_add = highlights.add,

  -- cmp themeing
  cmp = {
    icons = true,
    lspkind_text = false,
    style = "atom", -- default/flat_light/flat_dark/atom/atom_colored
    border_color = "grey_fg", -- only applicable for "default" style, use color names from base30 variables
    selected_item_bg = "colored", -- colored / simple
  },

  transparency = false,
  nvdash = {
    load_on_startup = true,
    header = {
      "███╗   ██╗ ██████╗ ███╗   ███╗",
      "████╗  ██║██╔═══██╗████╗ ████║",
      "██╔██╗ ██║██║   ██║██╔████╔██║",
      "██║╚██╗██║██║   ██║██║╚██╔╝██║",
      "██║ ╚████║╚██████╔╝██║ ╚═╝ ██║",
      "╚═╝  ╚═══╝ ╚═════╝ ╚═╝     ╚═╝",
    },
    buttons = {
      { "  Find File", "Spc f f", "Telescope find_files" },
      { "󰈚  Recent Files", "Spc f o", "Telescope oldfiles" },
      { "󰈭  Find Word", "Spc f w", "Telescope live_grep" },
      { "  Bookmarks", "Spc m a", "Telescope marks" },
      { "  Themes", "Spc t h", "Telescope themes" },
      { "  Mappings", "Spc c h", "NvCheatsheet" },
    },
  }
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
