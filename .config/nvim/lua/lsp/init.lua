local diag = vim.diagnostic
local map = vim.keymap.set

diag.config({
  signs = {
    text = {
      [diag.severity.ERROR] = " ",
      [diag.severity.WARN]  = " ",
      [diag.severity.INFO]  = " ",
      [diag.severity.HINT]  = "󰛩 ",
    },
    numhl = {
      [diag.severity.ERROR] = 'DiagnosticVirtualTextError',
      [diag.severity.WARN]  = 'DiagnosticVirtualTextWarn',
      [diag.severity.INFO]  = 'DiagnosticVirtualTextInfo',
      [diag.severity.HINT]  = 'DiagnosticVirtualTextHint',
    }
  },
  virtual_text = {
		spacing = 4,
		prefix = "●",
	},
  underline = true,
  float = {
    border = 'rounded',
  },
  update_in_insert = false
})


local function lsp_keymap(bufnr)
  local opt = { noremap = true, silent = true }
  map({"n", "v"}, "<leader>f", require('lsp.code_action').select, opt)
  map("n", "<leader>jr", vim.lsp.buf.rename, opt)
  map("n", "<leader>jd", "<cmd>vsplit | lua vim.lsp.buf.definition()<cr>", opt)
  map("n", "<leader>ei", diag.open_float, opt)
  map("n", "<leader>en", function() diag.jump({ count = 1 }) end, opt)
  map("n", "<leader>ep", function() diag.jump({ count = -1 }) end, opt)
  map("n", "<leader>h", vim.lsp.buf.hover, opt)
end

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    local buffer = args.buf

    if client:supports_method("textDocument/documentHighlight") then
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

    -- vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })

    lsp_keymap(buffer)
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

-- npm install -g @tailwindcss/language-server
vim.lsp.enable('tailwindcss')

-- npm install -g typescript typescript-language-server
-- vim.lsp.enable('ts_ls')

-- npm install -g @vtsls/language-server
vim.lsp.enable('vtsls')
vim.lsp.enable('eslint')

--create venv in project: python3 -m venv .venv
-- source .venv/bin/activate
-- install modules with pip and work with Pyright
-- deactivate
-- pip install pyright
vim.lsp.enable('pyright')
