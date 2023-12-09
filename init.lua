-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

local opt = vim.opt

-- Numbers
opt.number = true
opt.relativenumber = true

-- opt.signcolumn = "number"

-- other customisations (NOM)
opt.scrolloff = 7

-- opt.mouse = ""


local g = vim.g

-- Markdown preview settings
-- Markdown preview refresh on exit insert mode instead of on edit
g.mkdp_refresh_slow = 1
-- Let preview be opened for all files
g.mkdp_command_for_global = 1
-- Stop preview closing on buffer change
g.mkdp_auto_close = 0


