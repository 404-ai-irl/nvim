vim.pack.add {
  { src = 'https://github.com/Saghen/blink.cmp', version = vim.version.range '*' },
  { src = 'https://github.com/Saghen/blink.nvim', version = vim.version.range '1.*' },
  { src = 'https://github.com/moyiz/blink-emoji.nvim' },
  { src = 'https://github.com/alexandre-abrioux/blink-cmp-npm.nvim' },
  { src = 'https://github.com/L3MON4D3/LuaSnip' },
  { src = 'https://github.com/rafamadriz/friendly-snippets' },
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
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 500,
      window = {
        border = 'rounded',
        winblend = 100,
      },
    },
    menu = {
      border = 'rounded',
      draw = {
        components = {
          kind_icon = {
            text = function(ctx)
              local devicons = require('nvim-web-devicons')
              local kind_icons = {
                Text = '󰉿', Variable = '󰆧', Function = '󰊕', Method = '󰆧',
                Constructor = '', Field = '󰜢', Property = '󰜢', Class = '󰠱',
                Interface = '', Struct = '󰙅', Module = '', Unit = '󰑭',
                Value = '󰎠', Enum = '', Keyword = '󰌋', Snippet = '',
                Color = '󰏘', File = '󰈙', Reference = '󰈇', Folder = '󰉋',
                EnumMember = '', Constant = '󰏿', TypeParameter = '',
              }
              return kind_icons[ctx.kind] or '?'
            end,
          },
          kind = {},
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
