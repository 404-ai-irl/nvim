return {
  ---@module "blink"
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

  ---@module "blink-cmp"
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
        default = { 'lazydev', 'lsp', 'path', 'snippets', 'buffer' },
         per_filetype = {
           codecompanion = { 'codecompanion' },
           sql = { 'snippets', 'dadbod', 'buffer' },
           markdown = { 'snippets', 'buffer' },
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
      keymap = {
        ['<Tab>'] = {
          'snippet_forward',
          function()
            return require('sidekick').nes_jump_or_apply()
          end,
          function()
            return vim.lsp.inline_completion.get()
          end,
          'fallback',
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
  ---@module "blink-pairs"
  {
    'saghen/blink.pairs',
    version = '*', -- (recommended) only required with prebuilt binaries

    -- download prebuilt binaries from github releases
    dependencies = 'saghen/blink.download',
    -- OR build from source, requires nightly:
    -- https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
    -- build = 'cargo build --release',
    -- If you use nix, you can build from source using latest nightly rust with:
    -- build = 'nix run .#build-plugin',

    --- @module 'blink.pairs'
    --- @type blink.pairs.Config
    opts = {
      mappings = {
        -- you can call require("blink.pairs.mappings").enable()
        -- and require("blink.pairs.mappings").disable()
        -- to enable/disable mappings at runtime
        enabled = true,
        cmdline = true,
        -- or disable with `vim.g.pairs = false` (global) and `vim.b.pairs = false` (per-buffer)
        -- and/or with `vim.g.blink_pairs = false` and `vim.b.blink_pairs = false`
        disabled_filetypes = {},
        -- see the defaults:
        -- https://github.com/Saghen/blink.pairs/blob/main/lua/blink/pairs/config/mappings.lua#L14
        pairs = {},
      },
      highlights = {
        enabled = true,
        -- requires require('vim._extui').enable({}), otherwise has no effect
        cmdline = true,
        groups = {
          'BlinkPairsOrange',
          'BlinkPairsPurple',
          'BlinkPairsBlue',
        },
        unmatched_group = 'BlinkPairsUnmatched',

        -- highlights matching pairs under the cursor
        matchparen = {
          enabled = true,
          -- known issue where typing won't update matchparen highlight, disabled by default
          cmdline = false,
          -- also include pairs not on top of the cursor, but surrounding the cursor
          include_surrounding = false,
          group = 'BlinkPairsMatchParen',
          priority = 250,
        },
      },
      debug = false,
    },
  },
  {
    'saghen/blink.indent',
    --- @module 'blink.indent'
    --- @type blink.indent.Config
    opts = {},
  },
}
