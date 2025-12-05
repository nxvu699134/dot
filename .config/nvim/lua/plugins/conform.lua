return {
  'stevearc/conform.nvim',
  event = "VeryLazy",
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        javascript = { "prettier" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
        javascriptreact = { "prettier" },
        html = { "prettier" },
        scss = { "prettier" },
        css = { "prettier" },
        svelte = { "prettier" },
        markdown = { "prettier" },
        json = { "prettier" },
        svg = { "prettier" },
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_format = "fallback",
      },
    })
  end,
}
