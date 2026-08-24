return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    defaults = {
      formatter = "path.dirname_first",
      no_header = true,
      no_header_i = true,
      file_icons = false,
      prompt = " ",
    },
    fzf_colors = { true },
    files = {
      cwd_prompt = false,
      winopts = {
        title = "󱑽  " .. "FINDER" .. " 󱑽 ",
      },
    },
    grep = {
      rg_opts = "--column --line-number --no-heading --color=always --smart-case --max-columns=4096 " ..
        "-g '!.git/' -g '!node_modules/' -g '!build/' " ..
        "-g '!*.lock' " ..
        "-g '!package-lock.json' -g '!pnpm-lock.yaml' -g '!bun.lockb' " ..
        "-g '!go.sum' " ..
        "-g '!packages.lock.json' " ..
        "-e",
      winopts = {
        title = "󱑽  " .. "RIPGREP" .. " 󱑽",
      },
    },
  },
}
