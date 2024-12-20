-- Setup Conform with options
require("conform").setup {
  formatters_by_ft = {
    python = { "autopep8" },
    bash = { "shfmt" },
    sh = { "shfmt" },
    lua = { "stylua" },
    go = { "goimports", "gofumpt", "goimports-reviser" },
    javascript = { "prettierd", "prettier" },
    typescript = { "prettierd", "prettier" },
    javascriptreact = { "prettierd", "prettier" },
    typescriptreact = { "prettierd", "prettier" },
    vue = { "prettierd", "prettier" },
    css = { "prettierd", "prettier" },
    scss = { "prettierd", "prettier" },
    less = { "prettierd", "prettier" },
    html = { "prettierd", "prettier" },
    json = { "prettierd", "prettier" },
    jsonc = { "prettierd", "prettier" },
    yaml = { "prettierd", "prettier" },
    markdown = { "prettierd", "prettier" },
    ["markdown.mdx"] = { "prettierd", "prettier" },
    graphql = { "prettierd", "prettier" },
    handlebars = { "prettierd", "prettier" },
    c = { "clang-format" },
    cpp = { "clang-format" },
  },

  format_on_save = function(bufnr)
    -- Disable with a global or buffer-local variable
    if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
      return
    end
    return { timeout_ms = 500, lsp_format = "fallback" }
  end,
}

vim.api.nvim_create_user_command("FormatDisable", function(args)
  if args.bang then
    -- FormatDisable! will disable formatting just for this buffer
    vim.b.disable_autoformat = true
  else
    vim.g.disable_autoformat = true
  end
end, {
  desc = "Disable autoformat-on-save",
  bang = true,
})
vim.api.nvim_create_user_command("FormatEnable", function()
  vim.b.disable_autoformat = false
  vim.g.disable_autoformat = false
end, {
  desc = "Re-enable autoformat-on-save",
})

-- -- Create Neovim user commands for toggling auto formatting
-- vim.api.nvim_command [[command! FormatDisable :lua require('configs.format').disable_autoformat()]]
-- vim.api.nvim_command [[command! FormatEnable :lua require('configs.format').enable_autoformat()]]
