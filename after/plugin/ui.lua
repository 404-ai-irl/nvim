require('fidget').setup {}
require('plugin-view').setup {
  win = {
    title = 'Plugin List',
    border = 'bold',
    height = 70,
    width = 70,
  },
}

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

--- Auto Commands
-- Setup hlchunk on BufReadPre and BufNewFile events
local group = vim.api.nvim_create_augroup('IndentSetup', { clear = true })
vim.api.nvim_create_autocmd({ 'BufReadPre', 'BufNewFile' }, {
  group = group,
  once = true, -- Only run once to avoid multiple setups
  callback = function()
    require('hlchunk').setup {
      chunk = {
        enable = true,
        use_treesitter = true,
      },
      line_num = {
        enable = true,
        style = { fg = 'Background' },
      },
      blank = {
        enable = false,
        chars = { '󱕆' },
        style = { fg = 'Background' },
      },
    }
  end,
})
