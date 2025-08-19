local wk = require 'which-key'
---@type wk.Opts
local options = {
  preset = 'modern',
  delay = function(ctx)
    return ctx.operator and 0 or 200
  end,
  expand = 2, -- Reduce expand to avoid clutter
  notify = true,
  replace = {
    key = {
      { '<Space>', 'SPACE' },
      { '<cr>', 'RET' },
      { '<tab>', 'TAB' },
      { '<BS>', 'BSPC' },
    },
  },
  icons = {
    breadcrumb = '»', -- symbol used in the command line area that shows your active key combo
    separator = '-', -- symbol used between a key and it's label
    goup = '+', -- symbol prepended to a group
  },
  spec = {
    -- Core groups
    { '<leader>g', group = 'Git', icon = '󰊢' },
    { '<leader>t', group = 'Trouble', icon = '󱖫' },
  },
}

wk.setup { options }
wk.add {
  {
    '<leader>q',
    function()
      vim.cmd 'bdelete'
    end,
    desc = '󰅖 Delete buffer',
  },
  -- Trouble keybindings
  {
    '<leader>tt',
    '<cmd>Trouble diagnostics toggle<cr>',
    desc = '󱖫 Toggle diagnostics',
  },
  {
    '<leader>tb',
    '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
    desc = '󱖫 Buffer diagnostics',
  },
  {
    '<leader>ts',
    '<cmd>Trouble symbols toggle focus=false<cr>',
    desc = '󱖫 Symbols',
  },
  {
    '<leader>tl',
    '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
    desc = '󱖫 LSP definitions/references',
  },
  {
    '<leader>tL',
    '<cmd>Trouble loclist toggle<cr>',
    desc = '󱖫 Location list',
  },
  {
    '<leader>tq',
    '<cmd>Trouble qflist toggle<cr>',
    desc = '󱖫 Quickfix list',
  },
}
