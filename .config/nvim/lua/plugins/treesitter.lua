return {
  {
    'nvim-treesitter/nvim-treesitter',
    -- branch = 'main',
    opts = {
      ensure_installed = {
        'html',
        'css',
        'json',
        'javascript',
        'typescript',
        'python',
        'lua',
        'tsx',
        'sql',
        -- 'rust',
        -- 'svelte',
        -- 'go',
        -- 'markdown',
        -- 'markdown_inline',
        -- 'cpp',
      },
      sync_install = false,
      indent = { enable = true },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },

  {
    'windwp/nvim-ts-autotag',
    config = function() require('nvim-ts-autotag').setup() end
  },

  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = function() require('nvim-autopairs').setup({map_cr = true}) end,
  },

  {
    "folke/ts-comments.nvim",
    opts = {},
    event = "VeryLazy",
  },
}
