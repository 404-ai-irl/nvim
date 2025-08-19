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
    { '<leader>l', group = 'Diagnostics', icon = '󰒡' },
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
  -- Diagnostics mappings
  {
    '<leader>ln',
    function()
      vim.diagnostic.get_next()
    end,
    desc = '󰒭 Next diagnostic',
  },
  {
    '<leader>lp',
    function()
      vim.diagnostic.get_prev()
    end,
    desc = '󰒮 Previous diagnostic',
  },
  {
    '<leader>e',
    function()
      vim.diagnostic.open_float()
    end,
    desc = '󰙵 Open diagnostic float',
  },
  {
    '<leader>lo',
    function()
      vim.diagnostic.open_float()
    end,
    desc = '󰙵 Open diagnostic float',
  },
  {
    '<leader>ll',
    function()
      vim.diagnostic.setloclist()
    end,
    desc = '󰙵 Diagnostics to loclist',
  },
  {
    '<leader>lq',
    function()
      vim.diagnostic.setqflist()
    end,
    desc = '󰙵 Diagnostics to quickfix',
  },
  {
    '<leader>lt',
    function()
      vim.diagnostic.config {
        virtual_text = not vim.diagnostic.config().virtual_text,
      }
    end,
    desc = '󰙵 Toggle virtual text',
  },
  {
    '<leader>ls',
    function()
      vim.diagnostic.config {
        signs = not vim.diagnostic.config().signs,
      }
    end,
    desc = '󰙵 Toggle signs',
  },
}
