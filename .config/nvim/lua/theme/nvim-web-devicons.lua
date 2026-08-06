local M = {}
M.setup = function()
  local schema = require('theme.colors').get({theme = vim.g.theme})

  local syntax = {
    DevIconCss                =  {  fg  =  schema.blue    },
    DevIconDockerfile         =  {  fg  =  schema.cyan    },
    DevIconHtml               =  {  fg  =  schema.purple  },
    DevIconJs                 =  {  fg  =  schema.yellow  },
    DevIconLock               =  {  fg  =  schema.red     },
    DevIconLua                =  {  fg  =  schema.blue    },
    DevIconOut                =  {  fg  =  schema.fg      },
    DevIconPy                 =  {  fg  =  schema.cyan    },
    DevIconToml               =  {  fg  =  schema.blue    },
    DevIconTsx                =  {  fg  =  schema.blue    },
    DevIconJsx                =  {  fg  =  schema.blue    },
    DevIconTypeScript         =  {  fg  =  schema.blue    },
    DevIconVue                =  {  fg  =  schema.green   },
    DevIconWebOpenFontFormat  =  {  fg  =  schema.fg      },
    DevIconZip                =  {  fg  =  schema.yellow  },
    DevIconZig                =  {  fg  =  schema.orange  },
    DevIconMd                 =  {  fg  =  schema.blue    },
    DevIconMdx                =  {  fg  =  schema.blue    },
    DevIconSvelte             =  {  fg  =  schema.red     },
    DevIconJava               =  {  fg  =  schema.orange  },
  }

  require('configs.utils').hl_table(syntax)
end

return M
