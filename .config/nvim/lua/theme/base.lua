local M = {}

M.setup = function(opts)
  local schema = require('theme.colors').get(opts)

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

  require('configs.utils').hl_table(syntax)
end

return M
