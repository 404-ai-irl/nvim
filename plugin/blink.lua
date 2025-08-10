vim.pack.add {
  { src = 'https://github.com/Saghen/blink.cmp', version = vim.version.range '*' },
  { src = 'https://github.com/Saghen/blink.nvim', version = vim.version.range '1.*' },
  { src = 'https://github.com/moyiz/blink-emoji.nvim' },
  { src = 'https://github.com/alexandre-abrioux/blink-cmp-npm.nvim' },
  { src = 'https://github.com/L3MON4D3/LuaSnip' },
  { src = 'https://github.com/rafamadriz/friendly-snippets' },
  { src = 'https://github.com/nvim-tree/nvim-web-devicons' },
}

require('blink.cmp').setup {
  sources = {
    default = { 'lsp', 'path', 'snippets', 'buffer', 'npm', 'emoji' },
    providers = {
      emoji = {
        module = 'blink-emoji',
        name = 'Emoji',
        score_offset = 93, -- the higher the number, the higher the priority
        min_keyword_length = 2,
        opts = { insert = true }, -- Insert emoji (default) or complete its name
      },
      npm = {
        name = 'npm',
        module = 'blink-cmp-npm',
        async = true,
        score_offset = 100,
      },
    },
  },
  completion = {
    documentation = { auto_show = true, auto_show_delay_ms = 500 },
    menu = {
      draw = {
        components = {
          kind_icon = {
            text = function(ctx)
              local kind_icon, _, _ = require('mini.icons').get('lsp', ctx.kind)
              return kind_icon
            end,
            highlight = function(ctx)
              local _, hl, _ = require('mini.icons').get('lsp', ctx.kind)
              return hl
            end,
          },
          kind = {
            highlight = function(ctx)
              local _, hl, _ = require('mini.icons').get('lsp', ctx.kind)
              return hl
            end,
          },
        },
      },
    },
  },
  cmdline = { enabled = true },
  term = { enabled = true },
  signature = { enabled = true },
  appearance = {
    nerd_font_variant = 'normal',
  },
  snippets = { preset = 'mini_snippets' },
}

require('blink.chartoggle').setup {
  enabled = true,
}
require('blink.tree').setup {
  enabled = true,
}
local kset = vim.keymap.set
-- , toggles ,
kset({ 'n', 'v' }, ',', function()
  require('blink.chartoggle').toggle_char_eol ','
end)
-- Control + ; = toggle ;
kset({ 'n', 'v' }, '<C-;>', function()
  require('blink.chartoggle').toggle_char_eol ';'
end)
kset('n', '<leader>e', '<cmd>BlinkTree toggle<cr>')
