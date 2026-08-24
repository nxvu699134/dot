local M = {}

function M.select()
  vim.lsp.buf.code_action({
    context = {
      only = {'quickfix'}
    },
    filter = function(action)
      return action.isPreferred
    end
  })
end

return M
