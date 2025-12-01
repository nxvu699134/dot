local u = require('configs.utils')

function reverse(t)
  local ret = {}
  local n = #t
  local i = 1
  for i = 0, n-1 do
    ret[i+1] = t[n-i]
  end
  return ret
end

local function make_schema(light)
  local gray = {
    "#232323",  --1 hsl(0, 0%, 14%)
    "#282828",  --2 hsl(0, 0%, 16%)
    "#2e2e2e",  --3 hsl(0, 0%, 18%)
    "#353535",  --4 hsl(0, 0%, 21%)
    "#3f3f3f",  --5 hsl(0, 0%, 25%)
    "#444444",  --6 hsl(0, 0%, 27%)
    "#4b4b4b",  --7 hsl(0, 0%, 29%)
    "#4e4e4e",  --8 hsl(0, 0%, 31%)
    "#656565",  --9 hsl(0, 0%, 40%)
  }

  local base = {
    "#282828", --1
    "#3c3836", --2
    "#423e3c", --3
    "#484442", --4
    "#bdae93", --5
    "#d5c4a1", --6
    "#ebdbb2", --7
    "#fbf1c7", --8
  }

  local colors = {
    none    = 'NONE',
    red    = "#fb4934",
    green  = "#b8bb26",
    yellow = "#fabd2f",
    blue   = "#78a9c0",
    purple = "#d3869b",
    cyan   = "#8ec07c",
    teal   = "#68a895",
    orange = "#fe8019",
    base = base,
    gray = gray,
  }

  colors.bg           =  colors.base[1]
  colors.bg_hl        =  colors.gray[5]
  colors.fg           =  colors.base[7]
  colors.fg_disabled  =  colors.gray[9]
  colors.fg_invert    =  colors.base[1]
  colors.sl_bg        =  colors.gray[3]
  colors.sl_bg1       =  colors.gray[5]
  colors.sl_fg        =  colors.base[5]

  colors.diag = {
    danger   =  {  fg  =  colors.red,     bg  =  u.rgba_to_rgb(colors.red,     colors.bg,  0.1)  },
    warning  =  {  fg  =  colors.yellow,  bg  =  u.rgba_to_rgb(colors.yellow,  colors.bg,  0.1)  },
    info     =  {  fg  =  colors.blue,    bg  =  u.rgba_to_rgb(colors.blue,    colors.bg,  0.1)  },
    hint     =  {  fg  =  colors.fg,      bg  =  u.rgba_to_rgb(colors.gray[8], colors.bg,  0.1)  },
  };


  return colors;
end

local schema = make_schema(false);


local function syntax()
  local syntax = {
    Normal                      =  {  fg=schema.fg,                    bg=schema.none              },
    Terminal                    =  {  fg=schema.fg,                    bg=schema.none              },
    SignColumn                  =  {  fg=schema.fg,                    bg=schema.none              },
    VertSplit                   =  {  fg=schema.base[4],               bg=schema.none              },
    IncSearch                   =  {  fg=schema.fg_invert,             bg=schema.orange            },
    Search                      =  {  fg=schema.fg,                    bg=schema.gray[8]              },
    CurSearch                   =  {  fg=schema.fg_invert,             bg=schema.orange              },
    Visual                      =  {  bg=schema.gray[6]              },
    VisualNOS                   =  {  bg=schema.red              },
    Conceal                     =  {  fg=schema.gray[4],           bg=schema.none              },
    Cursor                      =  {  fg=schema.fg_invert,             bg=schema.base[5],            },
    lCursor                     =  {  fg=schema.fg_invert,             bg=schema.base[7],            },
    ColorColumn                 =  {  bg=schema.base[1]      },
    CursorColumn                =  {  fg=schema.none,                  bg=schema.base[1],          },
    CursorLine                  =  {  bg=schema.bg_hl      },
    LineNr                      =  {  fg=schema.gray[6],               bg=schema.none              },
    CursorLineNr                =  {  fg=schema.orange,                bg=schema.none,             bold = true            },

    Pmenu                       =  {  bg=schema.bg          },
    PmenuSbar                   =  {  bg=schema.gray[3]          },
    PmenuSel                    =  {  fg=schema.bg,              bg=schema.blue      },
    PmenuThumb                  =  {  bg=schema.gray[6]           },

    DiffAdd                     =  {  fg=schema.fg_invert,             bg=schema.green             },
    DiffChange                  =  {  fg=schema.fg_invert,             bg=schema.yellow            },
    DiffDelete                  =  {  fg=schema.fg_invert,             bg=schema.red               },
    DiffText                    =  {  fg=schema.fg_invert,             bg=schema.fg                },

    Directory                   =  {  fg=schema.blue,                  bg=schema.none              },
    ErrorMsg                    =  {  fg=schema.red,                   bg=schema.none,             bold = true            };
    WarningMsg                  =  {  fg=schema.yellow,                bg=schema.none,             bold = true            };
    ModeMsg                     =  {  fg=schema.fg,                    bg=schema.none,             bold = true            };
    MatchParen                  =  {  fg=schema.fg,                    bg=schema.gray[6],          bold = true            };
    NonText                     =  {  fg=schema.base[3],               bg=schema.none              };
    SpecialKey                  =  {  fg=schema.base[3],               bg=schema.none              };
    NormalFloat                 =  {  fg=schema.fg,                    bg=schema.bg  };
    WildMenu                    =  {  fg=schema.red,                   bg=schema.yellow            };
    Question                    =  {  fg=schema.yellow,                bg=schema.none              };

    StatusLine                  =  {  fg=schema.fg,                    bg=schema.none,                         };--  status  line   of  current      window
    StatusLineNC                =  {  fg=schema.fg,                    bg=schema.bg,                        };--  status  lines  of  not-current  windows

    SpellBad                    =  {  fg=schema.red,                   bg=schema.none,             undercurl = true       };
    SpellCap                    =  {  fg=schema.blue,                  bg=schema.none,             undercurl = true       };
    SpellLocal                  =  {  fg=schema.cyan,                  bg=schema.none,             undercurl = true       };
    SpellRare                   =  {  fg=schema.purple,                bg=schema.none,             undercurl = true       };
    QuickFixLine                =  {  fg=schema.fg,                    bg=schema.base[1],          };
    Debug                       =  {  fg=schema.red,                   bg=schema.none              };

    Boolean                     =  {  fg=schema.orange,                bg=schema.none,             italic = true          };
    Number                      =  {  fg=schema.orange,                bg=schema.none              };
    Float                       =  {  fg=schema.orange,                bg=schema.none              };
    PreProc                     =  {  fg=schema.purple,                bg=schema.none              };
    PreCondit                   =  {  fg=schema.purple,                bg=schema.none              };
    Include                     =  {  fg=schema.purple,                bg=schema.none              };
    Define                      =  {  fg=schema.purple,                bg=schema.none              };
    Conditional                 =  {  fg=schema.purple,                bg=schema.none              };
    Repeat                      =  {  fg=schema.purple,                bg=schema.none              };
    Keyword                     =  {  fg=schema.red,                   bg=schema.none,             italic = true          };
    Typedef                     =  {  fg=schema.red,                   bg=schema.none              };
    Statement                   =  {  fg=schema.red,                   bg=schema.none              };
    Error                       =  {  fg=schema.red,                   bg=schema.none              };
    StorageClass                =  {  fg=schema.orange,                bg=schema.none              };
    Tag                         =  {  fg=schema.orange,                bg=schema.none              };
    Label                       =  {  fg=schema.orange,                bg=schema.none              };
    Structure                   =  {  fg=schema.orange,                bg=schema.none              };
    Operator                    =  {  fg=schema.purple,                bg=schema.none              };
    Title                       =  {  fg=schema.fg,                bg=schema.none,             bold = true            };
    Special                     =  {  fg=schema.orange,                bg=schema.none              };
    SpecialChar                 =  {  fg=schema.orange,                bg=schema.none              };
    Type                        =  {  fg=schema.blue,                  bg=schema.none              };
    Function                    =  {  fg=schema.yellow,                bg=schema.none              };
    String                      =  {  fg=schema.green,                 bg=schema.none              };
    Character                   =  {  fg=schema.green,                 bg=schema.none              };
    Constant                    =  {  fg=schema.cyan,                  bg=schema.none              };
    Macro                       =  {  fg=schema.cyan,                  bg=schema.none              };
    Identifier                  =  {  fg=schema.teal,                  bg=schema.none              };
    Comment                     =  {  fg=schema.fg_disabled,           bg=schema.none,             italic = true          };
    Todo                        =  {  fg=schema.yellow,                bg=schema.base[1]              };
    Delimiter                   =  {  fg=schema.fg,                    bg=schema.none              };
    Ignore                      =  {  fg=schema.base[4],               bg=schema.none              };

    NvimTreeRootFolder         =  {  fg=schema.red,    bold = true    };
    NvimTreeOpenedFolderName   =  {  fg=schema.blue,   bold = true    };
    NvimTreeFolderName         =  {  fg=schema.blue,};
    NvimTreeFolderIcon         =  {  fg=schema.blue },
    NvimTreeEmptyFolderName    =  {  fg=schema.blue, strikethrough = true },
    NvimTreeFolderArrowOpen    =  {  fg=schema.blue     },
    NvimTreeFolderArrowClosed  =  {  fg=schema.gray[7]  },

    LspReferenceRead            =  {  fg=schema.none,                  bg=schema.bg_hl,     bold = true            };
    LspReferenceWrite           =  {  fg=schema.none,                  bg=schema.bg_hl,     bold = true            };
    LspReferenceText            =  {  fg=schema.none,                  bg=schema.bg_hl,     bold = true            };

    DiagnosticSignError         =  {  fg=schema.diag.danger.fg,        bold = true                };
    DiagnosticSignWarn          =  {  fg=schema.diag.warning.fg,       bold = true                };
    DiagnosticSignInfo          =  {  fg=schema.diag.info.fg,          bold = true                };
    DiagnosticSignHint          =  {  fg=schema.diag.hint.fg,          bold = true                };

    DiagnosticVirtualTextError  =  {  fg=schema.diag.danger.fg,        bg=schema.diag.danger.bg,              };
    DiagnosticVirtualTextWarn   =  {  fg=schema.diag.warning.fg,       bg=schema.diag.warning.bg,             };
    DiagnosticVirtualTextInfo   =  {  fg=schema.diag.info.fg,          bg=schema.diag.info.bg,                };
    DiagnosticVirtualTextHint   =  {  fg=schema.diag.hint.fg,          bg=schema.diag.hint.bg,                };

    DiagnosticUnderlineError    =  {  fg=schema.diag.danger.fg,        bg=schema.diag.danger.bg,   undercurl = true  };
    DiagnosticUnderlineWarn     =  {  fg=schema.diag.warning.fg,       bg=schema.diag.warning.bg,  undercurl = true  };
    DiagnosticUnderlineInfo     =  {  fg=schema.diag.info.fg,          bg=schema.diag.info.bg,     undercurl = true  };
    DiagnosticUnderlineHint     =  {  fg=schema.diag.hint.fg,          bg=schema.diag.hint.bg,     undercurl = true  };

    DiagnosticError             =  {  fg=schema.diag.danger.fg,        };
    DiagnosticWarn              =  {  fg=schema.diag.warning.fg,       };
    DiagnosticInfo              =  {  fg=schema.diag.info.fg,          };
    DiagnosticHint              =  {  fg=schema.diag.hint.fg,          };
    DiagnosticUnnecessary       =  {  fg=schema.diag.hint.fg_disabled, };

    StartifyPath                =  {  fg=schema.fg            },
    StartifySlash                =  {  fg=schema.fg            },
    StartifyHeader                =  {  fg=schema.fg            },
    StartifyFile                =  {  fg=schema.red            },

    GitSignsAdd                 =  {  fg=schema.green,                 bg=schema.none              };
    GitSignsChange              =  {  fg=schema.blue,                  bg=schema.none              };
    GitSignsDelete              =  {  fg=schema.red,                   bg=schema.none              };

    StatusLineBg                =  {  bg=schema.sl_bg    },
    StatusLineMode              =  {  fg=schema.fg_invert,       bg=schema.blue       },
    StatusLineFileName          =  {  fg=schema.fg,              bg=schema.sl_bg1       },
    StatusLineFileNameSep       =  {  fg=schema.sl_bg1,          bg=schema.sl_bg      },
    StatusLineLspError          =  {  fg=schema.red,             bg=schema.sl_bg        },
    StatusLineLspWarn           =  {  fg=schema.yellow,          bg=schema.sl_bg        },
    StatusLineLspInfo           =  {  fg=schema.blue,            bg=schema.sl_bg        },
    StatusLineInactiveFileName  =  {  fg=schema.fg_disabled,     bg=schema.sl_bg1       },
    StatusLineSepMode         =  {  fg=schema.blue,                },
    StatusLineSepInactive       =  {  fg=schema.base[3],                 },

    -- CmpItemAbbr                 =  {  fg=schema.fg,                    bg=schema.none,             };
    -- CmpItemAbbrMatch            =  {  fg=schema.blue,                  bg=schema.none,             style='bold'};
    -- CmpItemAbbrMatchFuzzy       =  {  fg=schema.blue,                  bg=schema.none,             style='bold'};
    -- CmpItemAbbrDeprecated       =  {  fg=schema.fg_disabled,           bg=schema.none,             style='strikethrough'};
    -- CmpItemKindFunction         =  {  fg=schema.yellow,                bg=schema.none              };
    -- CmpItemKindMethod           =  {  fg=schema.yellow,                bg=schema.none              };
    -- CmpItemKindInterface        =  {  fg=schema.yellow,                bg=schema.none              };
    -- CmpItemKindModule           =  {  fg=schema.yellow,                bg=schema.none              };
    -- CmpItemKindDefault          =  {  fg=schema.fg,                    bg=schema.none              };
    -- CmpItemKindCopilot          =  {  fg=schema.cyan,                  bg=schema.none              };

    TelescopeSelection          = {  fg=schema.fg,                      bg=schema.bg_hl,   bold = true              },
    TelescopeBorder             = {  fg=schema.cyan,                    bg=schema.none              },
    TelescopeSelectionCaret     = {  fg=schema.red,                     bg=schema.none              },
    TelescopePromptPrefix     = {  fg=schema.red,                     bg=schema.none              },
    TelescopeResultsNormal      = {  fg=schema.fg,                 bg=schema.none              },
    TelescopeMatching           = {  fg=schema.red,                     bg=schema.none,       bold = true, underline = true        },

    FlashLabel           = {  fg=schema.diag.warning.fg,                     bg=schema.diag.warning.bg,       bold = true, underline = true        },


    DevIconc = { fg = schema.blue },
    DevIconcss = { fg = schema.blue },
    DevIconDockerfile = { fg = schema.cyan },
    DevIconhtml = { fg = schema.purple },
    DevIconjs = { fg = schema.yellow },
    DevIconlock = { fg = schema.red },
    DevIconlua = { fg = schema.blue },
    DevIconout = { fg = schema.fg },
    DevIconpy = { fg = schema.cyan },
    DevIcontoml = { fg = schema.blue },
    DevIconts = { fg = schema.teal },
    DevIconttf = { fg = schema.fg },
    DevIconrb = { fg = schema.red },
    DevIconrpm = { fg = schema.orange },
    DevIconvue = { fg = schema.green },
    DevIconwoff = { fg = schema.fg },
    DevIconwoff2 = { fg = schema.fg },
    DevIconzip = { fg = schema.yellow },
    DevIconZig = { fg = schema.orange },
    DevIconMd = { fg = schema.blue },
    DevIconTSX = { fg = schema.blue },
    DevIconJSX = { fg = schema.blue },
    DevIconSvelte = { fg = schema.red },
    DevIconJava = { fg = schema.orange },
    DevIconDart = { fg = schema.cyan },

}
return syntax
end

local function treesitter_syntax()
  -- Misc {{{
  u.nvim_hl('@comment', {link = 'Comment'})
  u.nvim_hl('@error', {link = 'Error'})
  u.nvim_hl('@none', {bg = 'NONE', fg = 'NONE'})
  u.nvim_hl('@preproc', {link = 'PreProc'})
  u.nvim_hl('@define', {link = 'Define'})
  u.nvim_hl('@operator', {link = 'Operator'})
  -- }}}

  -- Punctuation {{{
  u.nvim_hl('@punctuation.delimiter', {link = 'Delimiter'})
  u.nvim_hl('@punctuation.bracket', {link = 'Delimiter'})
  u.nvim_hl('@punctuation.special', {link = 'Delimiter'})
  -- }}}

  -- Literals {{{
  u.nvim_hl('@string', {link = 'String'})
  u.nvim_hl('@string.regex', {link = 'String'})
  u.nvim_hl('@string.escape', {link = 'SpecialChar'})
  u.nvim_hl('@string.special', {link = 'SpecialChar'})

  u.nvim_hl('@character', {link = 'Character'})
  u.nvim_hl('@character.special', {link = 'SpecialChar'})

  u.nvim_hl('@boolean', {link = 'Boolean'})
  u.nvim_hl('@number', {link = 'Number'})
  u.nvim_hl('@float', {link = 'Float'})
  -- }}}

  -- Functions {{{
  u.nvim_hl('@function', {link = 'Function'})
  u.nvim_hl('@function.call', {link = 'Function'})
  u.nvim_hl('@function.builtin', {link = 'Special'})
  u.nvim_hl('@function.macro', {link = 'Macro'})

  u.nvim_hl('@method', {link = 'Function'})
  u.nvim_hl('@method.call', {link = 'Function'})

  u.nvim_hl('@constructor', {link = 'Special'})
  u.nvim_hl('@parameter', {link = 'Identifier'})
  -- }}}

  -- Keywords {{{
  u.nvim_hl('@keyword', {link = 'Keyword'})
  u.nvim_hl('@keyword.function', {link = 'Keyword'})
  u.nvim_hl('@keyword.operator', {link = 'Keyword'})
  u.nvim_hl('@keyword.return', {link = 'Keyword'})

  u.nvim_hl('@conditional', {link = 'Conditional'})
  u.nvim_hl('@repeat', {link = 'Repeat'})
  u.nvim_hl('@debug', {link = 'Debug'})
  u.nvim_hl('@label', {link = 'Label'})
  u.nvim_hl('@include', {link = 'Include'})
  u.nvim_hl('@exception', {link = 'Exception'})
  -- }}}

  -- Types {{{
  u.nvim_hl('@type', {link = 'Type'})
  u.nvim_hl('@interface', {link = 'Type'})
  u.nvim_hl('@type.builtin', {link = 'Type'})
  u.nvim_hl('@type.qualifier', {link = 'Type'})
  u.nvim_hl('@type.definition', {link = 'Typedef'})

  u.nvim_hl('@storageclass', {link = 'StorageClass'})
  u.nvim_hl('@attribute', {link = 'PreProc'})
  u.nvim_hl('@field', {link = 'Identifier'})
  u.nvim_hl('@property', {link = 'Identifier'})
  -- }}}

  -- Identifiers {{{
  u.nvim_hl('@variable', {link = 'Normal'})
  u.nvim_hl('@variable.builtin', {link = 'Special'})

  u.nvim_hl('@constant', {link = 'Constant'})
  u.nvim_hl('@constant.builtin', {link = 'Special'})
  u.nvim_hl('@constant.macro', {link = 'Define'})

  u.nvim_hl('@namespace', {link = 'Include'})
  u.nvim_hl('@symbol', {link = 'Identifier'})
  -- }}}

  -- Text {{{
  u.nvim_hl('@text', {link = 'Normal'})
  u.nvim_hl('@text.strong', {bold = true})
  u.nvim_hl('@text.emphasis', {italic = true})
  u.nvim_hl('@text.underline', {underline = true})
  u.nvim_hl('@text.strike', {strikethrough = true})
  u.nvim_hl('@text.title', {link = 'Title'})
  u.nvim_hl('@text.literal', {link = 'String'})
  u.nvim_hl('@text.uri', {link = 'Underlined'})
  u.nvim_hl('@text.math', {link = 'Special'})
  u.nvim_hl('@text.environment', {link = 'Macro'})
  u.nvim_hl('@text.environment.name', {link = 'Type'})
  u.nvim_hl('@text.reference', {link = 'Constant'})

  u.nvim_hl('@text.todo', {link = 'Todo'})
  u.nvim_hl('@text.note', {link = 'SpecialComment'})
  u.nvim_hl('@text.warning', {link = 'WarningMsg'})
  u.nvim_hl('@text.danger', {link = 'ErrorMsg'})
  -- }}}

  -- Tags {{{
  u.nvim_hl('@tag', {link = 'Tag'})
  u.nvim_hl('@tag.attribute', {link = 'Identifier'})
  u.nvim_hl('@tag.delimiter', {link = 'Delimiter'})
  -- }}}
end

local function setup()
  -- vim.api.nvim_command('hi clear')
  -- if vim.fn.exists('syntax_on') then
  --   vim.api.nvim_command('syntax reset')
  -- end
  vim.o.background = 'dark'
  vim.o.termguicolors = true

  local syntax = syntax()

  for group, opts in pairs(syntax) do
    u.nvim_hl(group, opts)
  end

  treesitter_syntax()
end

return { schema = schema; setup = setup; }
