return {
  {
    'saghen/blink.cmp',
    dependencies = {
      'rafamadriz/friendly-snippets',
    },
    version = '1.*',
    build = 'cargo build --release',
    opts = {
      fuzzy = { implementation = 'prefer_rust_with_warning' },
      --- Sources
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer', 'lazydev' },
        per_filetype = {
          codecompanion = { 'codecompanion' },
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
            score_offset = 100,
          },
          snippets = {
            opts = {
              friendly_snippets = true,
            },
          },
        },
      },
      --- Keymaps
      keymap = {
        ["<Tab>"] = {
          "snippet_forward",
          function()
            return require("sidekick").nes_jump_or_apply()
          end,
          "fallback",
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
          border = 'bold',
          winblend = 30,
        },
      },

      --- Snippets
      snippets = {},

      --- Appearence
      appearance = {
        nerd_font_variant = 'mono',
      },
    },
  },
  {
    'saghen/blink.nvim',
    build = 'cargo build --release', -- for delimiters
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
