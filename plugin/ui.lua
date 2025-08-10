vim.pack.add {
  { src = 'https://github.com/rebelot/kanagawa.nvim' },
  { src = 'https://github.com/shellRaining/hlchunk.nvim' },
  { src = 'https://github.com/NMAC427/guess-indent.nvim' },
  { src = 'https://github.com/folke/noice.nvim' },
  { src = 'https://github.com/folke/trouble.nvim' },
  { src = 'https://github.com/MunifTanjim/nui.nvim' },
  { src = 'https://github.com/nvim-tree/nvim-web-devicons' },
}

--- Fidget Notifications
-- require('fidget').setup {
--   progress = {
--     poll_rate = 0,
--   },
-- }
require('noice').setup {
  lsp = {
    override = {
      ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
      ['vim.lsp.util.stylize_markdown'] = true,
    },
  },
  presets = {
    bottom_search = false, -- use a classic bottom cmdline for search
    command_palette = true, -- position the cmdline and popupmenu together
    long_message_to_split = true, -- long messages will be sent to a split
    inc_rename = false, -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = true, -- add a border to hover docs and signature help
  },
}

require('trouble').setup {}

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
      indent = {
        enable = false,
        use_treesitter = true,
        chars = {
          '│',
          '¦',
          '┆',
          '┊',
        },
      },
      line_num = {
        enable = true,
      },
      blank = {
        enable = false,
        chars = { '󱕆' },
        style = { fg = 'Background' },
      },
    }
  end,
})

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
    dark = 'dragon', -- try "dragon" !
    light = 'lotus',
  },
}

vim.cmd 'colorscheme kanagawa'
