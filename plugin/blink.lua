vim.pack.add {
  { src = 'https://github.com/Saghen/blink.cmp', version = vim.version.range '*' },
  { src = 'https://github.com/Saghen/blink.nvim', version = vim.version.range '1.*' },
  { src = 'https://github.com/L3MON4D3/LuaSnip' },
  { src = 'https://github.com/rafamadriz/friendly-snippets' },
  { src = 'https://github.com/nvim-tree/nvim-web-devicons' },
}

require('blink.cmp').setup {
  signature = { enabled = true },
  completion = {
    documentation = { auto_show = true, auto_show_delay_ms = 500 },
    menu = {
      auto_show = true,
      draw = {
        treesitter = { 'lsp' },
        columns = { { 'kind_icon', 'label', 'label_description', gap = 1 }, { 'kind' } },
      },
    },
  },
}

local kset = vim.keymap.set
--- blink.chartoggle
require('blink.chartoggle').setup {
  enabled = true,
}
-- , toggles ,
kset({ 'n', 'v' }, ',', function()
  require('blink.chartoggle').toggle_char_eol ','
end)
-- Control + ; = toggle ;
kset({ 'n', 'v' }, '<C-;>', function()
  require('blink.chartoggle').toggle_char_eol ';'
end)

require('blink.tree').setup {
  enabled = true,
}

kset('n', '<leader>e', '<cmd>BlinkTree toggle<cr>')
