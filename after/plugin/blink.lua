Add {
  { src = 'Saghen/blink.cmp', build = 'cargo build --release' },
  { src = 'Saghen/blink.nvim', build = 'cargo build --release' },
  { src = 'L3MON4D3/LuaSnip', build = 'make install_jsregexp' },
  { src = 'rafamadriz/friendly-snippets' },
}

require('blink.cmp').setup {
  fuzzy = { implementation = 'prefer_rust_with_warning' },
  --- Sources
  sources = {
    default = { 'lsp', 'path', 'snippets', 'buffer' },
    per_filetype = {
      sql = { 'snippets', 'dadbod', 'buffer' },
    },
    --- Providers
    providers = {
      dadbod = {
        name = 'DadBod',
        module = 'vim_dadbod_completion.blink',
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
  snippets = {
    expand = function(snippet)
      require('luasnip').lsp_expand(snippet)
    end,
    active = function(filter)
      if filter and filter.direction then
        return require('luasnip').jumpable(filter.direction)
      end
      return require('luasnip').in_snippet()
    end,
    jump = function(direction)
      require('luasnip').jump(direction)
    end,
  },

  --- Appearence
  appearance = {
    nerd_font_variant = 'normal',
  },
}

require('blink.chartoggle').setup { enabled = true }
