return {
  {
    'nvim-tree/nvim-web-devicons',
    lazy = true,
  },

  {
    'tpope/vim-surround',
    event = 'VeryLazy'
  },

  {
    'wellle/targets.vim'
  },

  {
    'matze/vim-move',
    config = function()
      vim.g.move_normal_option = 1
      vim.g.move_key_modifier = 'A'
      vim.g.move_key_modifier_visualmode = 'A'
    end,
  },

  {
    'lukas-reineke/indent-blankline.nvim',
    main = "ibl",
    opts = {
      indent = {
        highlight = { "Conceal" },
        char = "┊",
      },
      scope = {
        enabled = true,
        highlight = {"Directory"},
      },
    },
  },

  {
    "catgoose/nvim-colorizer.lua",
    event = "BufReadPre",
    config = function()
      require("colorizer").setup()
    end,
  }
}
