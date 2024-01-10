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
    ["<C-CR>"] = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Jump to declaration" },

    ["<leader>qs"] = { "<cmd>lua require('persistence').load()<CR>", "Restore the session for the current directory" },
    ["<leader>ql"] = { "<cmd>lua require('persistence').load({ last = true})<CR>", "Restore the last session" },
    ["<leader>qd"] = { "<cmd>lua require('persistence').stop()<CR>", "Stop Persistence - session won't be saved on exit" },

    ["<A-Up>"] = { "ddkP", "Move line up" },
    ["<A-Down>"] = { "ddp", "Move line down" },
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

M.shade = {
  n = {
    ["<Bslash>"] = {
      function()
        require("shade").toggle()
      end,

      "toggle shade.nvim",
    },
  },
}

M.lsp = {
  n = {
    ["<leader>fm"] = {

      function()
        require("conform").format()
      end,
      "format with conform",
    },
  },
}

-- more keybinds!

return M
