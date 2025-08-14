require('blink.cmp').setup {
  sources = {
    default = { 'lsp', 'path', 'snippets', 'buffer', 'npm', 'emoji' },
    providers = {
      buffer = {
        name = 'Buffer',
        module = 'blink.cmp.sources.buffer',
        score_offset = 85,
        opts = {
          -- Limit buffer completions for performance
          max_items = 20,
          keyword_length = 2,
          get_bufnrs = function()
            -- Only use visible buffers for completion
            local bufs = {}
            for _, win in ipairs(vim.api.nvim_list_wins()) do
              local buf = vim.api.nvim_win_get_buf(win)
              if vim.api.nvim_buf_get_option(buf, 'buflisted') then
                table.insert(bufs, buf)
              end
            end
            return bufs
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
  fuzzy = {
    -- Use Rust-based frizbee for 6x performance improvement
    use_frizbee = true,
    use_typo_resistance = true,
    max_items = 200,
  },
  completion = {
    accept = {
      auto_brackets = {
        enabled = true,
        default_brackets = { '(', ')' },
        override_brackets_for_filetypes = {
          lua = { '{', '}' },
          javascript = { '(', ')' },
          typescript = { '(', ')' },
        },
      },
    },
    ghost_text = {
      enabled = true,
    },
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 300,
      treesitter_highlighting = true,
      window = {
        border = 'rounded',
        winblend = 30,
        max_width = 80,
        max_height = 20,
      },
    },
    menu = {
      winblend = 20,
      max_height = 15,
      border = 'rounded',
      draw = {
        align_to = 'cursor',
        treesitter_highlighting = true,
        columns = {
          { 'kind_icon' },
          { 'label', 'label_description', gap = 1 },
          { 'source_name' },
        },
      },
    },
    list = {
      -- Improve sorting and selection
      selection = 'auto_insert',
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

-- Clear Vue.js treesitter cache when completion menu closes
vim.api.nvim_create_autocmd('User', {
  pattern = 'BlinkCmpMenuClosed',
  callback = function()
    local bufnr = vim.api.nvim_get_current_buf()
    vim.b[bufnr]._vue_ts_cached_is_in_start_tag = nil
  end,
})

local kset = vim.keymap.set
-- , toggles ,
kset({ 'n', 'v' }, ',', function()
  require('blink.chartoggle').toggle_char_eol ','
end)
-- Control + ; = toggle ;
kset({ 'n', 'v' }, '<C-;>', function()
  require('blink.chartoggle').toggle_char_eol ';'
end)
