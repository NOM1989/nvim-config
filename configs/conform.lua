local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    javascript = { "prettier" },
    javascriptreact = { "prettier" },
    typescript = { "prettier" },
    typescriptreact = { "prettier" },
    css = { "prettier" },
    html = { "prettier" },
    json = { "prettier" },
    python = { "black" },
    astro = { "prettier" },
    ruby = { "rubocop" },
    -- haml = { "haml_lint" },
    ["*"] = { "codespell" },
  },
  -- log_level = vim.log.levels.DEBUG,
  -- formatters = {
  --   haml_lint = {
  --     -- This can be a string or a function that returns a string.
  --     -- When defining a new formatter, this is the only field that is required
  --     command = require("conform.util").find_executable({
  --       "/home/NOM/.local/share/nvim/mason/bin/haml-lint",
  --     }, "haml-lint"),
  --     -- A list of strings, or a function that returns a list of strings
  --     -- Return a single string instead of a list to run the command in a shell
  --     args = { "-a", "$FILENAME", "-d" },
  --     --     -- If the formatter supports range formatting, create the range arguments here
  --     --     range_args = function(ctx)
  --     --       return { "--line-start", ctx.range.start[1], "--line-end", ctx.range["end"][1] }
  --     --     end,
  --     --     -- Send file contents to stdin, read new contents from stdout (default true)
  --     --     -- When false, will create a temp file (will appear in "$FILENAME" args). The temp
  --     --     -- file is assumed to be modified in-place by the format command.
  --     --     stdin = true,
  --     --     -- A function that calculates the directory to run the command in
  --     --     cwd = require("conform.util").root_file { ".editorconfig", "package.json" },
  --     --     -- When cwd is not found, don't run the formatter (default false)
  --     --     require_cwd = true,
  --     --     -- When stdin=false, use this template to generate the temporary file that gets formatted
  --     --     tmpfile_format = ".conform.$RANDOM.$FILENAME",
  --     --     -- When returns false, the formatter will not be used
  --     --     condition = function(ctx)
  --     --       return vim.fs.basename(ctx.filename) ~= "README.md"
  --     --     end,
  --     --     -- Exit codes that indicate success (default { 0 })
  --     --     exit_codes = { 0, 1 },
  --     --     -- Set to false to disable merging the config with the base definition
  --     --     inherit = true,
  --     --     -- When inherit = true, add these additional arguments to the command.
  --     --     -- This can also be a function, like args
  --     -- prepend_args = { "-a" },
  --   },
  -- },
}

require("conform").setup(options)

-- This can also be a function that returns the config,
-- which can be useful if you're doing lazy loading
-- require("conform").formatters.haml = function(bufnr)
--   return {
--     command = require("conform.util").find_executable({
--       "/home/NOM/.local/share/nvim/mason/bin/haml-lint",
--     }, "haml-lint"),
--   }
-- end
