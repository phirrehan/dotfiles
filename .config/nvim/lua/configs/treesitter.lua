require("nvim-treesitter.config").setup {
  opts = {
    ensure_installed = {
      "vim",
      "lua",
      "vimdoc",
      "html",
      "css",
      "python",
      "go",
      "c",
      "javascript",
      "hyprlang",
      "markdown",
      "markdown-inline",
    },
  },

  auto_install = true,
  highlight = {
    enable = true,
  },
}
