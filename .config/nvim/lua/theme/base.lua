local M = {}

M.setup = function(opts)
  local c = require('theme.colors').get(opts)
  local u = require('theme.utils')

  local syntax = {
    Normal                      =  { fg=c.text },
    Terminal                    =  { link="Normal" },
    SignColumn                  =  { link="Normal" },
    WinSeparator                =  { fg=c.muted },
    Search                      =  { fg=c.text, bg=c.hl_mid },
    CurSearch                   =  { fg=c.base, bg=c.gold },
    IncSearch                   =  { link="CurSearch" },
    Visual                      =  { bg=c.hl_mid },
    VisualNOS                   =  { bg=c.love },
    Conceal                     =  { fg=c.overlay },
    Cursor                      =  { fg=c.base, bg=c.text },
    lCursor                     =  { link="Cursor"},
    ColorColumn                 =  { bg=c.surface },
    CursorColumn                =  { bg=c.overlay },
    CursorLine                  =  { bg=c.hl_mid },
    LineNr                      =  { fg=c.muted },
    CursorLineNr                =  { fg=c.text, bold=true },

    Pmenu                       =  { bg=c.base },
    PmenuSel                    =  { fg=c.base, bg=c.foam },
    PmenuThumb                  =  { bg=c.muted },

    DiffAdd                     =  { fg=c.base, bg=c.pine },
    DiffChange                  =  { fg=c.base, bg=c.gold },
    DiffDelete                  =  { fg=c.base, bg=c.love },
    DiffText                    =  { fg=c.base, bg=c.text },

    Directory                   =  { fg=c.foam },
    ErrorMsg                    =  { fg=c.love, bold=true };
    WarningMsg                  =  { fg=c.gold, bold = true };
    ModeMsg                     =  { fg=c.text, bold = true };
    MatchParen                  =  { fg=c.gold, bold=true };
    NonText                     =  { fg=c.muted };
    SpecialKey                  =  { fg=c.muted };
    NormalFloat                 =  { fg=c.text, bg=c.base };
    WildMenu                    =  { fg=c.love, bg=c.gold };
    Question                    =  { fg=c.gold };

    SpellBad                    =  { fg=c.love, undercurl=true };
    SpellCap                    =  { fg=c.foam, undercurl=true };
    SpellLocal                  =  { fg=c.foam, undercurl=true };
    SpellRare                   =  { fg=c.iris, undercurl=true };
    Debug                       =  { fg=c.love   };

    Boolean                     =  { fg=c.rose, italic = true };
    Number                      =  { fg=c.gold };
    Float                       =  { link = "Number"};
    PreProc                     =  { fg=c.iris };
    PreCondit                   =  { link = "PreProc"};
    Define                      =  { link = "PreProc"};
    Include                     =  { fg=c.pine };
    Conditional                 =  { link = "Include"};
    Repeat                      =  { link = "Include"};
    Keyword                     =  { fg=c.pine, italic=true };
    Error                       =  { fg=c.love };
    Statement                   =  { fg=c.pine, bold=true};
    Type                        =  { fg=c.foam };
    StorageClass                =  { link = "Type"};
    Tag                         =  { link = "Type"};
    Label                       =  { link = "Type"};
    Structure                   =  { link = "Type"};
    Special                     =  { link = "Type"};
    SpecialChar                 =  { link = "Type"};
    Typedef                     =  { link = "Type"};
    Operator                    =  { fg=c.subtle};
    Title                       =  { fg=c.text, bold=true };
    Function                    =  { fg=c.rose };
    String                      =  { fg=c.gold };
    Character                   =  { link = "String"};
    Constant                    =  { link = "String"};
    Macro                       =  { link = "PreProc"};
    Identifier                  =  { link = "Normal"};
    Comment                     =  { fg=c.muted, italic=true };
    Delimiter                   =  { fg=c.subtle };
    Ignore                      =  { link = "Conceal"};

    NvimTreeEmptyFolderName  = { fg=c.muted },
		NvimTreeFileDeleted      = { fg=c.love },
		NvimTreeFileDirty        = { fg=c.rose },
		NvimTreeFileMerge        = { fg=c.iris },
		NvimTreeFileNew          = { fg=c.foam },
		NvimTreeFileRenamed      = { fg=c.pine },
		NvimTreeFileStaged       = { fg=c.iris },
		NvimTreeFolderIcon       = { fg=c.subtle },
		NvimTreeFolderName       = { fg=c.pine },
		NvimTreeGitDeleted       = { fg=c.love },
		NvimTreeGitDirty         = { fg=c.rose },
		NvimTreeGitIgnored       = { fg=c.muted },
		NvimTreeGitMerge         = { fg=c.iris },
		NvimTreeGitNew           = { fg=c.foam },
		NvimTreeGitRenamed       = { fg=c.pine },
		NvimTreeGitStaged        = { fg=c.iris },
		NvimTreeImageFile        = { fg=c.text },
		NvimTreeNormal           = { link = "Normal" },
		NvimTreeOpenedFile       = { fg=c.text, bg=c.overlay },
		NvimTreeOpenedFolderName = { link="NvimTreeFolderName" },
		NvimTreeRootFolder       = { fg=c.love, bold=true },
		NvimTreeSpecialFile      = { link="Normal" },

    LspReferenceText            =  { bg=c.hl_mid, bold = true };
    LspReferenceRead            =  { link = "LspReferenceText" };
    LspReferenceWrite           =  { link = "LspReferenceText" };

    DiagnosticSignError         =  { fg=c.diag.danger.fg,  bold = true };
    DiagnosticSignWarn          =  { fg=c.diag.warning.fg, bold = true };
    DiagnosticSignInfo          =  { fg=c.diag.info.fg,    bold = true };
    DiagnosticSignHint          =  { fg=c.diag.hint.fg,    bold = true };

    DiagnosticVirtualTextError  =  { fg=c.diag.danger.fg,  bg=c.diag.danger.bg  };
    DiagnosticVirtualTextWarn   =  { fg=c.diag.warning.fg, bg=c.diag.warning.bg };
    DiagnosticVirtualTextInfo   =  { fg=c.diag.info.fg,    bg=c.diag.info.bg    };
    DiagnosticVirtualTextHint   =  { fg=c.diag.hint.fg,    bg=c.diag.hint.bg    };

    DiagnosticUnderlineError    =  { fg=c.diag.danger.fg,  bg=c.diag.danger.bg,   undercurl = true  };
    DiagnosticUnderlineWarn     =  { fg=c.diag.warning.fg, bg=c.diag.warning.bg,  undercurl = true  };
    DiagnosticUnderlineInfo     =  { fg=c.diag.info.fg,    bg=c.diag.info.bg,     undercurl = true  };
    DiagnosticUnderlineHint     =  { fg=c.diag.hint.fg,    bg=c.diag.hint.bg,     undercurl = true  };

    DiagnosticError             =  { fg=c.diag.danger.fg };
    DiagnosticWarn              =  { fg=c.diag.warning.fg };
    DiagnosticInfo              =  { fg=c.diag.info.fg };
    DiagnosticHint              =  { fg=c.diag.hint.fg };
    DiagnosticUnnecessary       =  { fg=c.diag.hint.fg_disabled };

    StartMruTitle               =  { fg=c.love, bold=true  },
    StartMruIcon                =  { fg=c.rose, bold=true  },
    StartShortcut               =  { fg=c.text  },
    StartFilename               =  { fg=c.text  },
    StartFilepath               =  { fg=c.muted  },
    StartHeader                 =  { fg=c.gold  },

    GitSignsAdd                 =  { fg=c.pine };
    GitSignsChange              =  { fg=c.iris };
    GitSignsDelete              =  { fg=c.love };

    StatusLine                  =  { fg=c.base, bg=c.surface };
    StatusLineNC                =  { fg=c.base, bg=c.surface };
    StatusLineLspError          =  { fg=c.love, bg=c.surface  },
    StatusLineLspWarn           =  { fg=c.gold, bg=c.surface  },
    StatusLineLspInfo           =  { fg=c.foam, bg=c.surface  },
    StatusLineOverlay           =  { fg=c.text, bg=c.overlay },
    StatusLineOverlayMuted      =  { fg=c.muted, bg=c.overlay },
    StatusLineGitAdd            =  { fg=c.pine, bg=c.overlay },
    StatusLineGitChange         =  { fg=c.iris, bg=c.overlay },
    StatusLineGitRemove         =  { fg=c.love, bg=c.overlay },

    WinBar                      =  { fg=c.text, bg=c.overlay, bold=true};
    WinBarNC                    =  { fg=c.muted, bg=c.surface };
    WinBarUnsave                =  { fg=c.love },
    WinBarStick                 =  { fg=c.pine },
    WinBarStickInactive         =  { fg=c.muted },

    FlashLabel           = {  fg=c.base,  bg=c.love, bold=true },

    FzfLuaTitle        =  {  fg=c.foam },
    FzfLuaBorder       =  {  fg=c.subtle },
    FzfLuaFzfPointer   =  {  fg=c.foam },
    FzfLuaFzfPrompt    =  {  fg=c.foam },
    FzfLuaFzfInfo      =  {  link="Normal" },
    FzfLuaFzfNormal    =  {  link="Normal" },
    FzfLuaFzfCursorLine=  {  fg=c.text, bg=c.hl_mid },
    FzfLuaFzfMatch     =  {  fg=c.love, bg=c.hl_mid },
  }

  require('configs.utils').hl_table(syntax)
end

return M
