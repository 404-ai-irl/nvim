return {
  {
    'nvim-lualine/lualine.nvim',
    ---@module 'lualine.config'
    opts = {},
  },
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    dependencies = {
      'MunifTanjim/nui.nvim',
      'rcarriga/nvim-notify',
    },
    ---@module 'noice.config'
    opts = {
      lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
          ['vim.lsp.util.stylize_markdown'] = true,
          ['cmp.entry.get_documentation'] = true,
        },
      },
      cmdline = { enabled = true },
      views = {
        cmdline_popup = {
          border = {
            style = 'none',
            padding = { 2, 3 },
          },
          filter_options = {},
          win_options = {
            winhighlight = 'NormalFloat:NormalFloat,FloatBorder:FloatBorder',
          },
        },
      },
      presets = {
        bottom_search = false,
        inc_rename = false,
        long_message_to_split = true,
        lsp_doc_border = true,
      },
    },
  },
  {
    'brenoprata10/nvim-highlight-colors',
    event = 'VeryLazy',
    opts = { render = 'virtual', enable_tailwind = true },
  },
  --- Themes
  {
    'EdenEast/nightfox.nvim',
    colorscheme = { 'carbonfox' },
    opts = {
      options = {
        transparent = true,
        terminal_colors = true,
        colorblind = {
          enable = true,
          severity = {
            protan = 0.2,
            deutan = 0.6,
          },
        },
      },
    },
  },
  {
    'jpwol/thorn.nvim',
    lazy = false,
    priority = 1000,
    opts = {},
  },
}
