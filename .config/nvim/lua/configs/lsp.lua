vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '',
      [vim.diagnostic.severity.WARN]  = '',
      [vim.diagnostic.severity.INFO]  = '',
      [vim.diagnostic.severity.HINT]  = '💡',
    },
    numhl = {
      [vim.diagnostic.severity.ERROR] = 'DiagnosticVirtualTextError',
      [vim.diagnostic.severity.WARN]  = 'DiagnosticVirtualTextWarn',
      [vim.diagnostic.severity.INFO]  = 'DiagnosticVirtualTextInfo',
      [vim.diagnostic.severity.HINT]  = 'DiagnosticVirtualTextHint',
    }
  },
  virtual_text = true,
  underline = true,
  update_in_insert = false
})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    local buffer = args.buf

    if client.supports_method("textDocument/documentHighlight") then
      local hl_group = vim.api.nvim_create_augroup("LspDocumentHighlight", { clear = true })
      vim.api.nvim_create_autocmd({ "CursorHold" }, {
        group = hl_group,
        callback = vim.lsp.buf.document_highlight,
        buffer = buffer,
      })
      vim.api.nvim_create_autocmd("CursorMoved", {
        group = hl_group,
        callback = vim.lsp.buf.clear_references,
        buffer = buffer,
      })
    end

    -- Turn off semantic highlight, it seems buggy to me
    client.server_capabilities.semanticTokensProvider = nil
  end
})

-- npm i -g vscode-langservers-extracted
vim.lsp.enable('html')
vim.lsp.enable('cssls')
vim.lsp.config('cssls', {
  settings = {
    css = {
      validate = true,
      lint = {
        unknownAtRules = "ignore",
      }
    },
    scss = {
      validate = true,
      lint = {
        unknownAtRules = "ignore",
      }
    }
  }
})
vim.lsp.enable('eslint')

-- npm install -g @tailwindcss/language-server
vim.lsp.enable('tailwindcss')

-- npm install -g typescript typescript-language-server
-- vim.lsp.enable('ts_ls')

-- npm install -g @vtsls/language-server
vim.lsp.enable('vtsls')

--create venv in project: python3 -m venv .venv
-- source .venv/bin/activate
-- install modules with pip and work with Pyright
-- deactivate
-- pip install pyright
vim.lsp.enable('pyright')
