require('fidget').setup {}
require('kanagawa').setup {
  compile = true,
  undercurl = false,
  commentStyle = { italic = true },
  functionStyle = {},
  keywordStyle = { italic = true },
  statementStyle = { bold = true },
  typeStyle = { italic = true },
  transparent = true, -- do not set background color
  dimInactive = true, -- dim inactive window `:h hl-NormalNC`
  terminalColors = true, -- define vim.g.terminal_color_{0,17}
  colors = { -- add/modify theme and palette colors
    palette = {},
    theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
  },
  background = {
    dark = 'dragon',
    light = 'lotus',
  },
}

--- UI autocmds
-- block guides via hlchunk
vim.api.nvim_create_autocmd({ 'BufReadPre', 'BufNewFile' }, {
  once = true,
  callback = function()
    require('hlchunk').setup {
      chunk = {
        enable = true,
        use_treesitter = true,
      },
      line_num = {
        enable = false,
        style = { fg = 'Background' },
      },
    }
  end,
})
