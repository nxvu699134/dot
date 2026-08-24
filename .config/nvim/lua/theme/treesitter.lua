local M = {}

M.setup = function(opts)
  local c = require('theme.colors').get(opts)

  local syntax = {
    ['@comment' ] = { link = 'Comment'},
    ['@error'   ] = { link = 'Error'},
    ['@preproc' ] = { link = 'PreProc'},
    ['@define'  ] = { link = 'Define'},
    ['@operator'] = { link = 'Operator'},

    ['@punctuation.delimiter'] =   {link = 'Delimiter'},
    ['@punctuation.bracket'  ] =   {link = 'Delimiter'},
    ['@punctuation.special'  ] =   {link = 'Delimiter'},

    ['@string'           ] =  {link = 'String'},
    ['@string.regexp'    ] =  {link = 'String'},
    ['@string.escape'    ] =  {link = 'String'},
    ['@string.special'   ] =  {link = 'String'},

    ['@character'        ] =  {link = 'Character'},
    ['@character.special'] =  {link = 'Character'},

    ['@boolean'          ] =  {link = 'Boolean'},
    ['@number'           ] =  {link = 'Number'},
    ['@number.float'     ] =  {link = 'Number'},
    ['@float'            ] =  {link = 'Float'},

    ['@function'        ] =       {link = 'Function'}   ,
    ['@function.call'   ] =       {link = 'Function'}   ,
    ['@function.builtin'] =       { fg=c.rose, bold=true}    ,
    ['@function.macro'  ] =       {link = 'Function'}      ,
    ['@function.method' ] =       {link = 'Function'}      ,
    ['@function.method.call'] =   { fg=c.iris}      ,
    ['@method'          ] =       {link = 'Function'}   ,
    ['@method.call'     ] =       {link = 'Function'}   ,
    ['@constructor'     ] =       {link = 'Type'}    ,
    ['@parameter'       ] =       { fg=c.iris, italic=true} ,

    ['@keyword'             ] =    {link = 'Keyword'}     ,
    ['@keyword.operator'    ] =    {link = 'Operator'}     ,
    ['@keyword.return'      ] =    {link = 'Include'}     ,
    ['@keyword.repeat'      ] =    {link = 'Repeat'}     ,
    ['@conditional'         ] =    {link = 'Conditional'} ,
    ['@repeat'              ] =    {link = 'Repeat'}         ,
    ['@debug'               ] =    {link = 'Debug'}          ,
    ['@label'               ] =    {link = 'Label'}          ,
    ['@include'             ] =    {link = 'Include'}        ,
    ['@exception'           ] =    {link = 'Exception'}      ,

    ['@interface'           ] =    {link = 'Type'}           ,
    ['@type'                ] =    {link = 'Type'}           ,
    ['@type.builtin'        ] =    { fg=c.foam, bold=true}           ,
    ['@type.qualifier'      ] =    {link = 'Type'}           ,
    ['@storageclass'        ] =    {link = 'StorageClass'}   ,
    ['@attribute'           ] =    { fg=c.iris }        ,
    ['@field'               ] =    {link = 'Type'}     ,
    ['@property'            ] =    { fg=c.foam, italic=true}     ,

    ['@variable'            ] =    { fg=c.text }         ,
    ['@variable.builtin'    ] =    { fg = c.love, italic=true, bold=true },
    ["@variable.parameter"] = { fg = c.iris, italic=true },
    ["@variable.parameter.builtin"] = { fg = c.iris, italic=true, bold=true},
		["@variable.member"] = { fg = c.foam, italic=true },

    ['@constant'            ] =    {link = 'Constant'}       ,
    ['@constant.macro'      ] =    {link = 'Constant'}         ,
    ['@constant.builtin'    ] =    { fg=c.gold, bold=true }        ,
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
    ['@text.environment.name']=    {link = 'Type'}          ,
    ['@text.reference'      ] =    {link = 'Constant'}       ,
    ['@text.todo'           ] =    {link = 'Todo'}           ,
    ['@text.note'           ] =    {link = 'SpecialComment'} ,
    ['@text.warning'        ] =    {link = 'WarningMsg'},
    ['@text.danger'         ] =    {link = 'ErrorMsg'},

    ['@tag'                 ] =    {link = 'Tag'},
    ['@tag.attribute'       ] =    { fg=c.iris},
    ['@tag.delimiter'       ] =    {link = 'Delimiter'},
    ['@tag.builtin'         ] =    {link = 'Tag'},
  }

  require('configs.utils').hl_table(syntax)
end

return M
