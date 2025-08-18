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
    group = '+', -- symbol prepended to a group
  },
  spec = {
    -- Core groups
    { '<leader>b', group = 'Buffer', icon = '󰓩' },
    { '<leader>g', group = 'Git', icon = '󰊢' },
    { '<leader>l', group = 'LSP', icon = '󰒲' },
    { '<leader>o', group = 'Obsidian', icon = '󰇈' },
    { '<leader>m', group = 'Markdown', icon = '󰽛' },
    { '<leader>w', group = 'Window', icon = '󰖲' },
  },
}

wk.setup { options }

wk.add {
  {
    '<leader>x',
    function()
      vim.cmd 'bdelete'
    end,
    desc = '󰅖 Delete buffer',
  },
  -- Database
  { '<leader>d', group = 'Database', icon = '󰆼' },
  { '<leader>do', desc = '󰆼 Toggle DBUI' },
  { '<leader>df', desc = '󰍉 Find DB buffer' },
  { '<leader>dr', desc = '󰑕 Rename DB buffer' },
  { '<leader>dq', desc = '󰋖 Last query info' },
}
