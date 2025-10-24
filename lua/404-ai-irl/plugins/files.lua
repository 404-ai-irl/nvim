return {
  {
    'stevearc/oil.nvim',
    dependencies = {
      { 'JezerM/oil-lsp-diagnostics.nvim', opts = {} },
    },
    lazy = false,
    keys = {
      { '-', '<cmd>Oil<cr>', desc = 'Open Oil in (v)split buffer' },
      { '_', '<cmd>Oil --float<cr>', desc = 'Open Oil floating buffer' },
    },
    opts = {
      default_file_explorer = true,
      constrain_cursor = 'editable',
      columns = { 'mtime', 'icon' },
      skip_confirm_for_simple_edits = true,
      float = {
        border = 'bold',
        max_width = 0.6,
        max_height = 0.6,
      },
    },
  },
  {
    'mikavilpas/yazi.nvim',
    version = '*',
    event = 'VeryLazy',
    dependencies = {
      {
        'nvim-lua/plenary.nvim',
        lazy = true,
      },
    },
    keys = {
      {
        '<leader>-',
        mode = { 'n', 'v' },
        '<cmd>Yazi<cr>',
        desc = 'Open yazi at the current file',
      },
      {
        -- Open in the current working directory
        '<leader>cw',
        '<cmd>Yazi cwd<cr>',
        desc = "Open the file manager in nvim's working directory",
      },
      {
        '<c-up>',
        '<cmd>Yazi toggle<cr>',
        desc = 'Resume the last yazi session',
      },
    },
    ---@type YaziConfig | {}
    opts = {
      -- if you want to open yazi instead of netrw, see below for more info
      open_for_directories = false,
      keymaps = {
        show_help = '?',
      },
    },
    -- 👇 if you use `open_for_directories=true`, this is recommended
    init = function()
      vim.g.loaded_netrwPlugin = 1
    end,
  },
}
