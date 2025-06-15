-- TODO: https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
--- Auto-completion with blink.cmp
return {
  --- @module 'blink.cmp'
  --- @type blink.cmp.Config
  'saghen/blink.cmp',
  version = '*',
  event = 'VimEnter',
  enabled = true,
  dependencies = {
    -- Snippet Engine
    {
      'L3MON4D3/LuaSnip',
      dependencies = { 'rafamadriz/friendly-snippets' },
      version = '2.*',
      build = (function()
        -- Remove the below condition to re-enable on windows.
        if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
          return
        end
        return 'make install_jsregexp'
      end)(),
    },
    'moyiz/blink-emoji.nvim',
    'folke/lazydev.nvim',
  },
  opts = {
    keymap = {
      preset = 'default',
    },
    appearance = {
      nerd_font_variant = 'mono',
    },

    sources = {
      default = { 'lsp', 'path', 'buffer', 'snippets', 'lazydev', 'emoji' },
      providers = {
        lazydev = {
          name = 'LazyDev',
          module = 'lazydev.integrations.blink',
          score_offset = 100,
        },
        emoji = {
          name = 'Emoji',
          module = 'blink-emoji',
          score_offset = 110,
          transform_items = function(ctx, items)
            local kind = require('blink.cmp.types').CompletionItemKind.Text
            for i = 1, #items do
              items[i].kind = kind
            end
            return items
          end,
        },
      },
    },

    completion = {
      accept = {
        auto_brackets = {
          enabled = true,
        },
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 200,
      },
    },

    snippets = { preset = 'luasnip' },
    fuzzy = { implementation = 'prefer_rust_with_warning' },
    signature = { enabled = true },
  },
}
