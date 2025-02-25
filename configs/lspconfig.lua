local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

local servers = {
  "astro",
  "html",
  "cssls",
  "ts_ls",
  "clangd",
  "solargraph",
  "pyright",
  "jdtls",
  "hls",
  "prismals",
  "tailwindcss",
  "sqlls",
}

-- custom diagnostic format, not sure why this didnt work in init.lua but here we are.
local diagnostic_formatter = function(diagnostic)
  -- if diagnostic.source then
  -- local output = ""
  -- for key, _ in pairs(diagnostic) do
  --   output = output .. key .. " "
  -- end
  -- return string.format("%s [%s]", diagnostic.code, diagnostic.source)
  -- return string.format("%s [%s]", string.match(diagnostic.code .. diagnostic.message, "^(.-)\n?"), diagnostic.source)
  return string.format("%s [%s]", diagnostic.message, diagnostic.source)
  -- end
  -- return diagnostic.message
end

vim.diagnostic.config {
  -- see :help vim.diagnostic.config()
  --underline = false,
  virtual_text = {
    format = diagnostic_formatter,
  },
  signs = true,
  -- update_in_insert = false,
  severity_sort = true,
}
-- End of custom format

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" },
        },
      },
    },
  }
end
