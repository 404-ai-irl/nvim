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

local slimline_styles = {
  pure = {
    style = 'fg',
    bold = true,
    configs = {
      path = {
        hl = {
          primary = 'Label',
        },
      },
      git = {
        hl = {
          primary = 'Function',
        },
      },
      filetype_lsp = {
        hl = {
          primary = 'String',
        },
      },
    },
  },
  minimal = {
    style = 'fg',
    spaces = {
      components = '',
      left = '',
      right = '',
    },
  },
}
require('slimline').setup(slimline_styles.pure)
require('fidget').setup {}
require('better-comment').Setup {
  tags = {
    { -- TODO This is a todo
      fg = 'white',
      bg = '#333369',
      bold = true,
      virtual_text = ' ',
    },
    { --NOTE This is a note
      name = 'NOTE',
      fg = 'black',
      bg = 'white',
      virtual_text = ' ',
    },
    { --FIX This is a fix me
      name = 'FIX',
      fg = 'white',
      bg = '#f44747',
      bold = true,
      virtual_text = '󰖷 ',
    },
    { -- WARNING: This is a warning
      name = 'WARNING',
      fg = 'black',
      bg = '#FFA500',
      bold = false,
      virtual_text = '⚠️',
    },
    {
      -- ? Is this important?
      name = '?',
      fg = 'blue',
      bg = 'teal',
      bold = true,
      virtual_text = '󰝧',
      -- !
    },
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
