local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },

    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },

  -- overrde plugin configs
  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "elkowar/yuck.vim",
    ft = "yuck",
  },

  -- Also Next.js?! (Atri)
  {
    "MunifTanjim/prettier.nvim",
    config = function()
      require("better_escape").setup {
        bin = "prettier", -- or `'prettierd'` (v0.23.3+)
        filetypes = {
          "css",
          "graphql",
          "html",
          "javascript",
          "javascriptreact",
          "json",
          "less",
          "markdown",
          "scss",
          "typescript",
          "typescriptreact",
          "yaml",
        },
      }
    end,
  },

  -- Surround selections with specific chars
  -- {
  --   "tpope/vim-surround",
  -- },

  -- {
  --   "Aasim-A/scrollEOF.nvim",
  --   lazy = false,
  --   config = function()
  --     require("scrollEOF").setup {
  --       -- The pattern used for the internal autocmd to determine
  --       -- where to run scrollEOF. See https://neovim.io/doc/user/autocmd.html#autocmd-pattern
  --       pattern = "*",
  --       -- Whether or not scrollEOF should be enabled in insert mode
  --       insert_mode = true,
  --       -- List of filetypes to disable scrollEOF for.
  --       disabled_filetypes = {},
  --       -- List of modes to disable scrollEOF for. see https://neovim.io/doc/user/builtin.html#mode() for available modes.
  --       disabled_modes = {},
  --     }
  --   end,
  -- },

  -- install without yarn or npm
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },

  -- dim inactive windows
  {
    "andreadev-it/shade.nvim",
    config = function()
      require("shade").setup {
        exclude_filetypes = { "NvimTree" },
      }
    end,
  },

  -- pretty diagnostics panel
  {
    "folke/trouble.nvim",
    cmd = "Trouble",
    config = function()
      require("trouble").setup()
    end,
  },

  -- autoclose tags in html, jsx only
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },

  -- Smooth scrolling with C-u C-d
  {
    "karb94/neoscroll.nvim",
    keys = { "<C-d>", "<C-u>", "<PageUp>", "<PageDown>", "zt", "zz", "zb" },
    config = function()
      require("neoscroll").setup {
        stop_eof = false,
      }

      local t = {}
      -- Syntax: t[keys] = {function, {function arguments}}
      t["<C-u>"] = { "scroll", { "-vim.wo.scroll", "true", "200" } }
      t["<C-d>"] = { "scroll", { "vim.wo.scroll", "true", "200" } }
      t["<PageUp>"] = { "scroll", { "-vim.api.nvim_win_get_height(0)", "true", "300" } }
      t["<PageDown>"] = { "scroll", { "vim.api.nvim_win_get_height(0)", "true", "300" } }
      t["<C-y>"] = { "scroll", { "-0.10", "false", "50" } }
      t["<C-e>"] = { "scroll", { "0.10", "false", "50" } }
      t["zt"] = { "zt", { "200" } }
      t["zz"] = { "zz", { "200" } }
      t["zb"] = { "zb", { "200" } }

      require("neoscroll.config").set_mappings(t)
    end,
  },

  {
    "stevearc/conform.nvim",
    config = function()
      require "custom.configs.conform"
    end,
  },

  -- Persistence for nvim sessions (per workspace)
  {
    "folke/persistence.nvim",
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    opts = {
      -- add any custom options here
    },
  },

  {
    "eandrju/cellular-automaton.nvim",
    cmd = "CellularAutomaton",
  },

  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
    },
  },

  {
    "tpope/vim-fugitive",
    event = 'BufWinEnter',
  },

  -- {
  --   "github/copilot.vim",
  --   lazy = false,
  -- },

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- Uncomment if you want to re-enable which-key
  {
    "folke/which-key.nvim",
    enabled = true,
  },
}

return plugins
