local lsp_kinds = {
  Array         = "  Array",
  Boolean       = "󰨙  Bool",
  Class         = "  Class",
  Color         = "  Color",
  Constant      = "󰏿  Const",
  Constructor   = "  Cons",
  Copilot       = "  Copilot",
  Enum          = "  Enum",
  EnumMember    = "  EnumMem",
  Event         = "  Event",
  Field         = "󰜢  Field",
  File          = "  File",
  Folder        = "  Folder",
  Function      = "󰊕  Func",
  Interface     = "  Interface",
  Keyword       = "󰌋  Keyword",
  Method        = "󰊕  Method",
  Module        = "  Module",
  Operator      = "  Operator",
  Property      = "  Prop",
  Package       = "  Package",
  Number        = "󰎠  Number",
  Object        = "󰘦  Obj",
  Reference     = "  Ref",
  Snippet       = "  Snip",
  Struct        = "󰆼  Struct",
  String        = "  Str",
  Text          = "  Text",
  TypeParameter = "  TParam",
  Unit          = "󰑭  Unit",
  Value         = "󰎠  Value",
  Variable      = "󰀫  Var",
}

return {
  'saghen/blink.cmp',
  lazy = false,
  version = '1.*',
  event = "InsertEnter",
  opts = {
    sources = {
      default = { "lsp", "path", "buffer" },
    },
    fuzzy = {
      implementation = "prefer_rust",
      sorts = { 'exact', 'score', 'sort_text' },
    },
    completion = {
      list = {
        selection = {
          preselect = false,
        },
      },
      trigger = {
        show_on_insert_on_trigger_character = true,
        -- these are annoying
        -- show_on_x_blocked_trigger_characters = { "'", '"', "(", "[", "{" },
      },
      documentation = {
        auto_show = true,
        window = {
          border = 'rounded',
        },
      },
      menu = {
        border = "rounded",
        draw = {
          columns = {
            {"label", "label_description" },
            { "kind"},
          },
          components = {
            kind = {
              text = function(item)
                return lsp_kinds[item.kind] or " "
              end,
            },
            source_name = {
              text = function(item)
                return "[" .. item.source_name .. "]"
              end,
            },
            label_description = {
              width = { max = 30 },
            },
          },
        },
      },
    },
    keymap = {
      ['<Tab>'] = {  'select_next', 'fallback' },
      ['<S-Tab>'] = { 'select_prev', 'fallback'},
      ['<CR>'] = { 'accept', 'fallback' },

      ['<C-space>'] = { 'show', 'fallback' },

      ['<Up>'] = { 'select_next', 'fallback' },
      ['<Right>'] = { 'select_next', 'fallback' },

      ['<Left>'] = { 'select_prev', 'fallback' },
      ['<Down>'] = { 'select_prev', 'fallback' },
    },
    signature = {
      enabled = false,
    },
  },
  opts_extend = { "sources.default" }
}
