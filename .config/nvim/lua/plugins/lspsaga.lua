return {
  "glepnir/lspsaga.nvim",
  branch = "main",
  event = "BufRead",
  opts = {
    code_action = {
      keys = {
        quit = "<esc>",
        exec = "<CR>",
      },
    },
    lightbulb = {
      enable = false,
    },
    symbol_in_winbar = {
      enable = false,
      separator = "  ",
    },
    ui = {
      winblend = 0,
      expand = "",
      collapse = "",
      preview = " ",
      code_action = "💡 ",
      diagnostic = "🐞 ",
      incoming = " ",
      outgoing = " ",
      hover = ' ',
      kind = {},
    },
  },
}
