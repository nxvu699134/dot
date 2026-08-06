local M = {}
M.setup = function()
  local schema = require('theme.colors').get({theme = vim.g.theme})

  local syntax = {
    Menu = { bg = schema.none },
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
    require('configs.utils').nvim_hl("BlinkCmp" .. kind, opts)
  end
end

return M
