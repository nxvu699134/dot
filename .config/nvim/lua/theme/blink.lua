local M = {}

M.setup = function()
  local c = require('theme.colors').get({theme = vim.g.theme})

  local syntax = {
    Menu = { bg = c.none },
    MenuBorder = { fg = c.subtle },
    DocBorder = { fg = c.subtle },
    SignatureHelpBorder = { fg = c.subtle },
    Label             =  {  fg=c.text,           bg=c.none,  },
    LabelDeprecated   =  {  fg=c.muted,  bg=c.none,  strikethrough = true},
    LabelDescription  =  {  fg=c.muted,  bg=c.none   },
    LabelMatch        =  {  fg=c.pine,         bg=c.none,  bold = true, },
    Kind              =  {  fg=c.text,           bg=c.none   },

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
