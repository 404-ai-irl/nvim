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
  background = { -- map the value of 'background' option to a theme
    dark = 'dragon', -- NOTE try "dragon"
    light = 'lotus',
  },
}

---@diagnostic disable: missing-fields
require('Comment').setup {
  pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
  sticky = true,
  padding = true,
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
