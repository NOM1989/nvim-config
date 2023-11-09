---@type MappingsTable
local M = {}

M.general = {
  n = {
    ["<Esc>"] = {
      function()
        require("custom.utils").noh_close_floating_windows()
      end,
      "Clear highlights and close floating windows",
    },

    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader><leader>"] = { "<C-W><C-W>", "previous window" },
    ["ff"] = {
      function()
        vim.diagnostic.open_float { border = "rounded", close_events = {"CursorMoved"} }
      end,
      "Floating diagnostic",
    },
    ["<C-t>"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "Toggle horizontal term",
    },
  },

  v = {
    ["<M-Up>"] = { ":m-2<CR>gv=gv", "Move selection up" },
    ["<M-Down>"] = { ":m'>+<CR>gv=gv", "Move selection down" },
    ["ff"] = {
      function()
        vim.diagnostic.open_float { border = "rounded" }
      end,
      "Floating diagnostic",
    },
    ["<C-=>"] = {
      function()
        require("custom.utils").trim_whitespace()
      end,
      "Trim whitespace from EoL",
    },
  },

  t = {
    ["<C-t>"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "Toggle horizontal term",
    },
  },

  i = {
    ["<C-BS>"] = { "<C-w>", "Delete word" },
  },

}

-- more keybinds!

return M
