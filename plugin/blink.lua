require('blink.cmp').setup {
  fuzzy = { implementation = 'prefer_rust_with_warning' },
  --- Sources
  sources = {
    default = { 'lazydev', 'lsp', 'path', 'snippets', 'buffer', 'npm' },
    per_filetype = {
      sql = { 'snippets', 'dadbod', 'buffer' },
      lua = { inherit_defaults = true, 'lazydev' },
    },

    --- Providers
    providers = {
      lazydev = {
        name = 'LazyDev',
        module = 'lazydev.integrations.blink',
        score_offset = 100,
      },
      nerdfont = {
        module = 'blink-nerdfont',
        name = 'Nerd Fonts',
        score_offset = 15,
        opts = { insert = true },
      },
      dadbod = {
        name = 'DadBod',
        module = 'vim_dadbod_completion.blink',
      },
      npm = {
        name = 'NPM',
        module = 'blink-cmp-npm',
        async = true,
        score_offset = 100,
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
      enabled = false,
    },

    --- Documentation
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

    --- Menu
    menu = {
      winblend = 30,
      min_width = 15,
      max_height = 10,
      winhighlight = 'Normal:BlinkCmpMenu,FloatBorder:BlinkCmpMenuBorder,CursorLine:BlinkCmpMenuSelection,Search:None',
      border = 'rounded',
      draw = {
        align_to = 'cursor',
        components = {
          kind_icons = {
            text = function(ctx)
              local icon = ctx.kind_icon
              if vim.tbl_contains({ 'Path' }, ctx.source_name) then
                local dev_icon, _ = require('nvim-web-devicons').get_icon(ctx.label)
                if dev_icon then
                  icon = dev_icon
                end
              else
                icon = require('lspkind').symbolic(ctx.kind, {
                  mode = 'symbol',
                })
              end
              return icon .. ctx.icon_gap
            end,
            -- Optionally, use the highlight groups from nvim-web-devicons
            -- You can also add the same function for `kind.highlight` if you want to
            -- keep the highlight groups in sync with the icons.
            highlight = function(ctx)
              local hl = ctx.kind_hl
              if vim.tbl_contains({ 'Path' }, ctx.source_name) then
                local dev_icon, dev_hl = require('nvim-web-devicons').get_icon(ctx.label)
                if dev_icon then
                  hl = dev_hl
                end
              end
              return hl
            end,
          },
        },
        treesitter = { 'lsp' },
        columns = {
          { 'kind_icon' },
          { 'label', 'label_description', gap = 1 },
          { 'source_name' },
        },
      },
    },

    --- List
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
      show_documentation = false,
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
    kind_icons = {
      Text = '󰉿',
      Method = '󰆧',
      Function = '󰊕',
      Constructor = '',
      Field = '󰜢',
      Variable = '󰀫',
      Class = '󰠱',
      Interface = '',
      Module = '',
      Property = '󰜢',
      Unit = '󰑭',
      Value = '󰎠',
      Enum = '',
      Keyword = '󰌋',
      Snippet = '',
      Color = '󰏘',
      File = '󰈙',
      Reference = '󰈇',
      Folder = '󰉋',
      EnumMember = '',
      Constant = '󰏿',
      Struct = '󰙅',
      Event = '',
      Operator = '󰆕',
      TypeParameter = '',
    },
  },
}

require('blink.chartoggle').setup {
  enabled = true,
}

require('lspkind').init {
  -- default: symbol
  -- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
  mode = 'symbol_text',
  -- default: 'default'
  preset = 'default',
  -- default: {}
  symbol_map = {
    Text = '󰉿',
    Method = '󰆧',
    Function = '󰊕',
    Constructor = '',
    Field = '󰜢',
    Variable = '󰀫',
    Class = '󰠱',
    Interface = '',
    Module = '',
    Property = '󰜢',
    Unit = '󰑭',
    Value = '󰎠',
    Enum = '',
    Keyword = '󰌋',
    Snippet = '',
    Color = '󰏘',
    File = '󰈙',
    Reference = '󰈇',
    Folder = '󰉋',
    EnumMember = '',
    Constant = '󰏿',
    Struct = '󰙅',
    Event = '',
    Operator = '󰆕',
    TypeParameter = '',
  },
}
