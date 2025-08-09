return {
  {
    'saghen/blink.cmp',
    version = '1.*',
    event = { 'LspAttach', 'InsertEnter' },
    dependencies = {
      -- Snippet Engine
      {
        'L3MON4D3/LuaSnip',
        dependencies = { 'rafamadriz/friendly-snippets' },
        version = '2.*',
        build = 'make install_jsregexp',
      },
      'moyiz/blink-emoji.nvim',
    },
    opts = {
      keymap = { preset = 'default' },
      appearance = { nerd_font_variant = 'normal' },
      sources = {
        default = { 'lazydev', 'lsp', 'path', 'snippets', 'buffer', 'emoji' },
        providers = {
          lazydev = {
            name = 'LazyDev',
            module = 'lazydev.integrations.blink',
            score_offset = 100,
          },
          emoji = {
            name = 'Emoji',
            module = 'blink-emoji',
            score_offset = -10,
            transform_items = function(_, items)
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
        menu = {
          border = 'single',
          draw = {
            padding = { 1, 0 },
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
            },
            columns = {
              { 'label', 'label_description', gap = 1 },
              { 'kind_icon', 'kind' },
            },
          },
        },
        documentation = {
          window = { border = 'single' },
          auto_show = true,
        },
        trigger = {
          show_on_trigger_character = true,
        },
      },
    },
    snippets = { preset = 'mini_snippets' },
    signature = { enabled = true },
    opts_extend = { 'sources.default' },
  },
  {
    'saghen/blink.nvim',
    build = 'cargo build --release',
    keys = {
      -- chartoggle
      {
        '<C-;>',
        function()
          require('blink.chartoggle').toggle_char_eol ';'
        end,
        mode = { 'n', 'v' },
        desc = 'Toggle ; at eol',
      },
      {
        ',',
        function()
          require('blink.chartoggle').toggle_char_eol ','
        end,
        mode = { 'n', 'v' },
        desc = 'Toggle , at eol',
      },
    },
    lazy = false,
    opts = {
      chartoggle = { enabled = true },
    },
  },
}
