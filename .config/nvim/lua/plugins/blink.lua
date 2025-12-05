
local lsp_kinds = {
  Array         = " ",
  Boolean       = "󰨙 ",
  Class         = " Class",
  Color         = " Color",
  Constant      = "󰏿 Const",
  Constructor   = " Cons",
  Copilot       = " Copilot",
  Enum          = " Enum",
  EnumMember    = " EnumMem",
  Event         = " Event",
  Field         = "󰜢 Field",
  File          = " File",
  Folder        = " Folder",
  Function      = "󰊕 Func",
  Interface     = " Interface",
  Keyword       = "󰌋 Keyword",
  Method        = "󰊕 Method",
  Module        = " Module",
  Operator      = " Operator",
  Property      = " Prop",
  Package       = " Package",
  Number        = "󰎠 Number",
  Object        = "󰘦 Obj",
  Reference     = " Ref",
  Snippet       = " Snip",
  Struct        = "󰆼 Struct",
  String        = " Str",
  Text          = " Text",
  TypeParameter = " TParam",
  Unit          = "󰑭 Unit",
  Value         = "󰎠 Value",
  Variable      = "󰀫 Var",
}

local setup_highlight = function()
  local schema = require('theme.colors').get({theme = vim.g.theme})
  local u = require('configs.utils')

  local syntax = {
    Menu = { bg = schema.bg },
    MenuBorder = { fg = schema.gray[8] },
    DocBorder = { fg = schema.gray[8] },
    SignatureHelpBorder = { fg = schema.gray[8] },
    Label             =  {  fg=schema.fg,           bg=schema.none,  },
    LabelDeprecated   =  {  fg=schema.fg_disabled,  bg=schema.none,  strikethrough = true},
    LabelDescription  =  {  fg=schema.fg_disabled,  bg=schema.none   },
    LabelMatch        =  {  fg=schema.blue,         bg=schema.none,  bold = true, },
    Kind              =  {  fg=schema.fg,           bg=schema.none   },

    KindConstant       =  {  link  =  "@constant" },
    KindFunction       =  {  link  =  "@function" },
    KindIdentifier     =  {  link  =  "@variable" },
    KindField          =  {  link  =  "@property" },
    KindVariable       =  {  link  =  "@variable" },
    KindSnippet        =  {  link  =  "@keyword"  },
    KindText           =  {  link  =  "@text"     },
    KindStructure      =  {  link  =  "Structure" },
    KindType           =  {  link  =  "@type"     },
    KindKeyword        =  {  link  =  "@keyword"  },
    KindMethod         =  {  link  =  "@method"},
    KindConstructor    =  {  link  =  "@constructor"},
    KindFolder         =  {  link  =  "@text"},
    KindModule         =  {  link  =  "@type"},
    KindProperty       =  {  link  =  "@field"},
    KindEnum           =  {  link  =  "@type"},
    KindUnit           =  {  link  =  "@constant"},
    KindClass          =  {  link  =  "@type"},
    KindFile           =  {  link  =  "@text"},
    KindInterface      =  {  link  =  "@interface"},
    KindColor          =  {  link  =  "@text"},
    KindReference      =  {  link  =  "@text"},
    KindEnumMember     =  {  link  =  "@field"},
    KindStruct         =  {  link  =  "@type"},
    KindValue          =  {  link  =  "@variable"},
    KindEvent          =  {  link  =  "Structure"},
    KindOperator       =  {  link  =  "@operator"},
    KindTypeParameter  =  {  link  =  "@parameter"},
  }

  for kind, opts in pairs(syntax) do
    u.nvim_hl("BlinkCmp" .. kind, opts)
  end
end

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
          border = "rounded",
        },
      },
      menu = {
        border = "rounded",
        draw = {
          columns = {
            {"label", "label_description" },
            { "kind"},
            -- {"source_name"}
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

      ['<C-space>'] = { 'show', 'fallback' },

      ['<C-n>'] = { 'select_next', 'fallback' },
      ['<C-p>'] = { 'select_prev', 'fallback' },
      ['<Right>'] = { 'select_next', 'fallback' },
      ['<Left>'] = { 'select_prev', 'fallback' },

      ['<C-y>'] = { 'select_and_accept', 'fallback' },
      ['<C-e>'] = { 'cancel', 'fallback' },
    },
    signature = {
      enabled = false,
    },
  },
  opts_extend = { "sources.default" },
  config = function(_, opts)
    setup_highlight()
    require("blink.cmp").setup(opts)
  end,
}
