return {
  {
    'saghen/blink.cmp',
    dependencies = {
      'L3MON4D3/LuaSnip',
    },
    version = '1.*',
    build = 'cargo build --release',
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      fuzzy = { implementation = 'prefer_rust_with_warning' },
      --- Sources
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer', 'lazydev' },
        per_filetype = {
          sql = { 'snippets', 'dadbod', 'buffer' },
        },
        --- Providers
        providers = {
          dadbod = {
            name = 'DadBod',
            module = 'vim_dadbod_completion.blink',
          },
          lazydev = {
            name = 'LazyDev',
            module = 'lazydev.integrations.blink',
            score_offset = 100, -- show at top of completion
          },
        },
      },
      --- Completions
      completion = {
        accept = {
          auto_brackets = {
            enabled = true,
          },
        },
        ghost_text = {
          enabled = true,
        },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 200,
          window = {
            border = 'bold',
            winblend = 30,
            max_width = 80,
            max_height = 20,
          },
        },
        --- cmp.Menu
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
                -- (optional) use highlights from mini.icons
                highlight = function(ctx)
                  local _, hl, _ = require('mini.icons').get('lsp', ctx.kind)
                  return hl
                end,
              },
            },
          },
        },
        --- cmp.List
        list = {
          cycle = {
            from_bottom = true,
            from_top = true,
          },
        },
      },

      --- Cmdline
      cmdline = { enabled = true },

      --- Terminal
      term = { enabled = true },

      --- Signature
      signature = {
        enabled = true,
        window = {
          show_documentation = true,
          border = 'rounded',
          winblend = 30,
        },
      },

      --- Snippets
      snippets = {},

      --- Appearence
      appearance = {
        nerd_font_variant = 'normal',
      },
    },
  },
  {
    'saghen/blink.nvim',
    build = 'cargo build --release',
    config = function()
      require('blink.chartoggle').setup { enabled = true }
    end,
  },
}
