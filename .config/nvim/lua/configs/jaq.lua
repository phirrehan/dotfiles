require("jaq-nvim").setup {
  cmds = {
    -- Uses vim commands
    internal = {
      lua = "luafile '%'",
      vim = "source '%'",
    },

    -- Uses shell commands
    external = {
      markdown = "glow '%'",
      python = "python3 '%'",
      go = "go run '%'",
      sh = "sh '%'",
      c = "run '%'",
      cpp = "run '%'",
    },
  },

  behavior = {
    -- Default type
    default = "float",

    -- Start in insert mode
    startinsert = true,

    -- Use `wincmd p` on startup
    wincmd = false,

    -- Auto-save files
    autosave = false,
  },

  ui = {
    float = {
      -- See ':h nvim_open_win'
      border = "rounded",

      -- See ':h winhl'
      winhl = "Normal",
      borderhl = "FloatBorder",

      -- See ':h winblend'
      winblend = 0,

      -- Num from `0-1` for measurements
      height = 0.9,
      width = 0.9,
      x = 0.5,
      y = 0.5,
    },

    terminal = {
      -- Window position
      position = "bot",

      -- Window size
      size = 10,

      -- Disable line numbers
      line_no = false,
    },

    quickfix = {
      -- Window position
      position = "bot",

      -- Window size
      size = 10,
    },
  },
}
