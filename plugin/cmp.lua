require('blink.cmp').setup {
  fuzzy = {
    implementation = 'prefer_rust_with_warning',
  },
  sources = {
    default = { 'lsp', 'path', 'snippets', 'buffer', 'npm', 'emoji' },
    providers = {
      buffer = {
        name = 'Buffer',
        module = 'blink.cmp.sources.buffer',
        score_offset = -3,
        max_items = 20,
        opts = {
          get_bufnrs = function()
            -- Only use visible buffers for completion
            return vim
              .iter(vim.api.nvim_list_wins())
              :map(function(win)
                return vim.api.nvim_win_get_buf(win)
              end)
              :filter(function(buf)
                return vim.bo[buf].buftype ~= 'nofile'
              end)
              :totable()
          end,
        },
      },
      emoji = {
        module = 'blink-emoji',
        name = 'Emoji',
        score_offset = 93,
        min_keyword_length = 2,
        opts = { insert = true },
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
    accept = {
      auto_brackets = {
        enabled = true,
      },
    },

    ghost_text = {
      enabled = false,
    },

    documentation = {
      auto_show = true,
      auto_show_delay_ms = 200,
      window = {
        border = 'rounded',
        winblend = 30,
        max_width = 80,
        max_height = 20,
      },
    },

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

    list = {
      cycle = {
        from_bottom = true,
        from_top = true,
      },
    },
  },
  cmdline = { enabled = true },
  term = { enabled = true },
  signature = {
    enabled = true,
    window = {
      show_documentation = false,
      border = 'rounded',
      winblend = 30,
    },
  },
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
  appearance = {
    nerd_font_variant = 'mono',
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

local kset = vim.keymap.set
-- , toggles ,
kset({ 'n', 'v' }, ',', function()
  require('blink.chartoggle').toggle_char_eol ','
end)
-- Control + ; = toggle ;
kset({ 'n', 'v' }, '<C-;>', function()
  require('blink.chartoggle').toggle_char_eol ';'
end)

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
