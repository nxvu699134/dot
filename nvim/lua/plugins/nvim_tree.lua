local function on_attach(bufnr)
  local api = require('nvim-tree.api')

  local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  local map = vim.keymap.set

  map('n', '<CR>', api.node.open.edit, opts('Open'))
  map('n', 'v', api.node.open.vertical, opts('Open: Vertical Split'))
  map('n', 's', api.node.open.horizontal, opts('Open: Horizontal Split'))
  map('n', '<BS>', api.node.navigate.parent_close, opts('Close Directory'))
  map('n', '<S-CR>', api.node.navigate.parent_close, opts('Close Directory'))
  map('n', 'H', api.tree.toggle_hidden_filter, opts('Toggle Dotfiles'))
  map('n', 'R', api.tree.reload, opts('Refresh'))
  map('n', 'a', api.fs.create, opts('Create'))
  map('n', 'd', api.fs.remove, opts('Delete'))
  map('n', 'r', api.fs.rename, opts('Rename'))
  map('n', 'x', api.fs.cut, opts('Cut'))
  map('n', 'c', api.fs.copy.node, opts('Copy'))
  map('n', 'p', api.fs.paste, opts('Paste'))
  map('n', 'q', api.tree.close, opts('Close'))
  map('n', '?', api.tree.toggle_help, opts('Help'))
  map('n', 'y', api.fs.copy.filename, opts('Copy Name'))
  map('n', 'Y', api.fs.copy.relative_path, opts('Copy Relative Path'))
  map('n', 'yp', api.fs.copy.absolute_path, opts('Copy Absolute Path'))
  map('n', '<Nop>', api.tree.change_root_to_node, opts('CD'))
  map('n', '<Nop>', api.node.open.tab, opts('Open: New Tab'))
  map('n', '<Nop>', api.node.navigate.sibling.prev, opts('Previous Sibling'))
  map('n', '<Nop>', api.node.navigate.sibling.next, opts('Next Sibling'))
  map('n', '<Nop>', api.node.navigate.parent, opts('Parent Directory'))
  map('n', '<Nop>', api.node.open.preview, opts('Open Preview'))
  map('n', '<Nop>', api.node.navigate.sibling.first, opts('First Sibling'))
  map('n', '<Nop>', api.node.navigate.sibling.last, opts('Last Sibling'))
  map('n', '<Nop>', api.fs.rename_sub, opts('Rename: Omit Filename'))
  map('n', '<Nop>', api.node.navigate.git.prev, opts('Prev Git'))
  map('n', '<Nop>', api.node.navigate.git.next, opts('Next Git'))
  map('n', '<Nop>', api.tree.change_root_to_parent, opts('Up'))


  vim.api.nvim_create_autocmd("BufWinEnter", {
    buffer = bufnr,
    callback = function()
      vim.opt_local.cursorline = true
    end,
  })
end

return {
  'nvim-tree/nvim-tree.lua',
  opts = {
    disable_netrw       = true,
    hijack_netrw        = true,
    open_on_tab         = false,
    hijack_cursor       = false,
    update_focused_file = {
      enable      = true,
      ignore_list = {}
    },
    filters = {
      dotfiles = false,
      git_ignored = false,
      custom = { '.git', 'node_modules' }
    },
    view = {
      width = 30,
      side = 'left',
      preserve_window_proportions = true,
    },
    actions = {
      open_file = {
        window_picker = {
          enable = false,
        }
      }
    },
    renderer = {
      indent_markers = {
        enable = true,
      },
      highlight_git = true,
      icons = {
        glyphs = {
          default = "󰈚",
          folder = {
            default = "",
            empty = "",
            empty_open = "",
            open = "",
            symlink = "",
          },
        },
      },
    },
    on_attach = on_attach,
  },
}

