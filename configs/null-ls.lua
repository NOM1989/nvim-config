local present, null_ls = pcall(require, "null-ls")

-- Grab some preferences from the language server setup and pass to null ls
-- in this case allows formatting of no lsp supported files with lsp keybind (if filetype in null ls setup)
-- DIDN'T WORK :(
-- local on_attach = require("plugins.configs.lspconfig").on_attach

if not present then
  return
end

local b = null_ls.builtins

local sources = {

  -- webdev stuff
  b.formatting.deno_fmt, -- chose deno for ts/js files cuz its very fast!
  b.formatting.prettier.with { filetypes = { "html", "markdown", "css" } }, -- so prettier works only on these filetypes

  -- Lua
  b.formatting.stylua,

  -- cpp
  b.formatting.clang_format,

  -- ruby
  b.formatting.rubocop,
  -- b.formatting.erb_format,
  b.diagnostics.erb_lint,

  -- python
  b.formatting.black,
  b.diagnostics.flake8,

  -- spelling
  -- b.diagnostics.cspell,
  -- b.code_actions.cspell,
}

-- Format on save [https://docs.rockylinux.org/books/nvchad/custom/plugins/null_ls/]
-- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
-- local on_attach = function(client, bufnr)
--   if client.supports_method "textDocument/formatting" then
--     vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
--     vim.api.nvim_create_autocmd("BufWritePre", {
--       group = augroup,
--       buffer = bufnr,
--       callback = function()
--         -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
--         vim.lsp.buf.format { bufnr = bufnr }
--       end,
--     })
--   end
-- end

-- local on_attach = function (client, buffer)
--   if client.supports_method "textDocument/formatting" then
--     local options = { noremap = true }
--     vim.api.nvim_set_keymap(
--       "n",
--       "<leader>fm",
--       function()
--         vim.lsp.buf.implementation()
--       end,
--       options)
--   end
-- end

null_ls.setup {
  debug = true,
  sources = sources,
  -- diagnostics_format = "#{m} [#{s}]",
  -- on_attach = on_attach,
}
