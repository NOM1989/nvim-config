-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

-- Restore cursor to Beam (blinking) on leave.
vim.api.nvim_create_autocmd({ 'VimLeave', 'VimSuspend' }, {
  pattern = { '*' },
  callback = function()
    vim.o.guicursor = "a:ver100,a:blinkon1"
  end
})

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

if g.neovide then
    -- Put anything you want to happen only in Neovide here
  opt.guifont = "JetBrains Mono:h14" -- text below applies for VimScript
end

-- Use an older version of LanguageTool as vim-Grammarous uses an outdated '--api' flag.
g["grammarous#jar_url"] = 'https://www.languagetool.org/download/LanguageTool-5.9.zip'
