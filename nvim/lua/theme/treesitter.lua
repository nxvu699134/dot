local M = {}

M.setup = function()
  local syntax = {
    ['@comment' ] =    {link  =  'Comment'},
    ['@error'   ] =      {link  =  'Error'},
    ['@none'    ] =       {bg    =  'NONE'   ,        fg  =  'NONE'},
    ['@preproc' ] =    {link  =  'PreProc'},
    ['@define'  ] =     {link  =  'Define'},
    ['@operator'] =   {link  =  'Operator'},

    ['@punctuation.delimiter'] =   {link = 'Delimiter'},
    ['@punctuation.bracket'  ] =   {link = 'Delimiter'},
    ['@punctuation.special'  ] =   {link = 'Delimiter'},

    ['@string'           ] =  {link = 'String'},
    ['@string.regex'     ] =  {link = 'String'},
    ['@string.escape'    ] =  {link = 'SpecialChar'},
    ['@string.special'   ] =  {link = 'SpecialChar'},

    ['@character'        ] =  {link = 'Character'},
    ['@character.special'] =  {link = 'SpecialChar'},

    ['@boolean'          ] =  {link = 'Boolean'},
    ['@number'           ] =  {link = 'Number'},
    ['@float'            ] =  {link = 'Float'},

    ['@function'        ] =       {link = 'Function'}   ,
    ['@function.call'   ] =       {link = 'Function'}   ,
    ['@function.builtin'] =       {link = 'Special'}    ,
    ['@function.macro'  ] =       {link = 'Macro'}      ,
    ['@method'          ] =       {link = 'Function'}   ,
    ['@method.call'     ] =       {link = 'Function'}   ,
    ['@constructor'     ] =       {link = 'Special'}    ,
    ['@parameter'       ] =       {link = 'Identifier'} ,

    ['@keyword'             ] =    {link = 'Keyword'}     ,
    ['@keyword.function'    ] =    {link = 'Keyword'}     ,
    ['@keyword.operator'    ] =    {link = 'Keyword'}     ,
    ['@keyword.return'      ] =    {link = 'Keyword'}     ,
    ['@conditional'         ] =    {link = 'Conditional'} ,
    ['@repeat'              ] =    {link = 'Repeat'}         ,
    ['@debug'               ] =    {link = 'Debug'}          ,
    ['@label'               ] =    {link = 'Label'}          ,
    ['@include'             ] =    {link = 'Include'}        ,
    ['@exception'           ] =    {link = 'Exception'}      ,

    ['@type'                ] =    {link = 'Type'}           ,
    ['@interface'           ] =    {link = 'Type'}           ,
    ['@type.builtin'        ] =    {link = 'Type'}           ,
    ['@type.qualifier'      ] =    {link = 'Type'}           ,
    ['@type.definition'     ] =    {link = 'Typedef'}        ,
    ['@storageclass'        ] =    {link = 'StorageClass'}   ,
    ['@attribute'           ] =    {link = 'PreProc'}        ,
    ['@field'               ] =    {link = 'Identifier'}     ,
    ['@property'            ] =    {link = 'Identifier'}     ,

    ['@variable'            ] =    {link = 'Normal'}         ,
    ['@variable.builtin'    ] =    {link = 'Special'}        ,
    ['@constant'            ] =    {link = 'Constant'}       ,
    ['@constant.builtin'    ] =    {link = 'Special'}        ,
    ['@constant.macro'      ] =    {link = 'Define'}         ,
    ['@namespace'           ] =    {link = 'Include'}        ,
    ['@symbol'              ] =    {link = 'Identifier'}     ,

    ['@text'                ] =    {link = 'Normal'}         ,
    ['@text.strong'         ] =    {bold = true}             ,
    ['@text.emphasis'       ] =    {italic = true}           ,
    ['@text.underline'      ] =    {underline = true}        ,
    ['@text.strike'         ] =    {strikethrough = true}    ,
    ['@text.title'          ] =    {link = 'Title'}          ,
    ['@text.literal'        ] =    {link = 'String'}         ,
    ['@text.uri'            ] =    {link = 'Underlined'}     ,
    ['@text.math'           ] =    {link = 'Special'}        ,
    ['@text.environment'    ] =    {link = 'Macro'}          ,
    ['@text.environment.name'] =    {link = 'Type'}          ,
    ['@text.reference'      ] =    {link = 'Constant'}       ,
    ['@text.todo'           ] =    {link = 'Todo'}           ,
    ['@text.note'           ] =    {link = 'SpecialComment'} ,
    ['@text.warning'        ] =    {link = 'WarningMsg'},
    ['@text.danger'         ] =    {link = 'ErrorMsg'},

    ['@tag'                 ] =    {link = 'Tag'},
    ['@tag.attribute'       ] =    {link = 'Identifier'},
    ['@tag.delimiter'       ] =    {link = 'Delimiter'},
  }

  require('configs.utils').hl_table(syntax)
end

return M
