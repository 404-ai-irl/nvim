return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  keys = {
    -- Core picker operations
    { '<leader><space>', function() require('snacks').picker.smart() end, desc = 'Smart Find Files' },
    { '<leader>,', function() require('snacks').picker.buffers() end, desc = 'Buffers' },
    { '<leader>/', function() require('snacks').picker.grep() end, desc = 'Grep' },
    { '<leader>:', function() require('snacks').picker.command_history() end, desc = 'Command History' },

    -- Find operations
    { '<leader>fb', function() require('snacks').picker.buffers() end, desc = 'Buffers' },
    { '<leader>fc', function() require('snacks').picker.files({ cwd = vim.fn.stdpath('config') }) end, desc = 'Find Config File' },
    { '<leader>ff', function() require('snacks').picker.files() end, desc = 'Find Files' },
    { '<leader>fg', function() require('snacks').picker.git_files() end, desc = 'Find Git Files' },
    { '<leader>fr', function() require('snacks').picker.recent() end, desc = 'Recent Files' },

    -- Git operations
    { '<leader>gb', function() require('snacks').picker.git_branches() end, desc = 'Git Branches' },
    { '<leader>gl', function() require('snacks').picker.git_log() end, desc = 'Git Log' },
    { '<leader>gs', function() require('snacks').picker.git_status() end, desc = 'Git Status' },

    -- Search operations
    { '<leader>sb', function() require('snacks').picker.lines() end, desc = 'Buffer Lines' },
    { '<leader>sg', function() require('snacks').picker.grep() end, desc = 'Grep' },
    { '<leader>sw', function() require('snacks').picker.grep_word() end, desc = 'Visual selection or word', mode = { 'n', 'x' } },
    { '<leader>sc', function() require('snacks').picker.command_history() end, desc = 'Command History' },
    { '<leader>sC', function() require('snacks').picker.commands() end, desc = 'Commands' },
    { '<leader>sd', function() require('snacks').picker.diagnostics() end, desc = 'Diagnostics' },
    { '<leader>sh', function() require('snacks').picker.help() end, desc = 'Help Pages' },
    { '<leader>sk', function() require('snacks').picker.keymaps() end, desc = 'Keymaps' },
    { '<leader>sR', function() require('snacks').picker.resume() end, desc = 'Resume' },

    -- LSP operations
    { 'gd', function() require('snacks').picker.lsp_definitions() end, desc = 'Goto Definition' },
    { 'gr', function() require('snacks').picker.lsp_references() end, nowait = true, desc = 'References' },
    { 'gI', function() require('snacks').picker.lsp_implementations() end, desc = 'Goto Implementation' },
    { 'gy', function() require('snacks').picker.lsp_type_definitions() end, desc = 'Goto Type Definition' },
    { '<leader>ss', function() require('snacks').picker.lsp_symbols() end, desc = 'LSP Symbols' },
    { '<leader>sS', function() require('snacks').picker.lsp_workspace_symbols() end, desc = 'LSP Workspace Symbols' },
  },
  config = function()
    require('snacks').setup({
      picker = {
        enabled = true,
        layouts = {
          telescope = {
            reverse = true,
            layout = {
              box = "horizontal",
              backdrop = false,
              width = 0.8,
              height = 0.9,
              border = "none",
              {
                box = "vertical",
                { win = "list", title = " Results ", title_pos = "center", border = "single" },
                { win = "input", height = 1, border = "single", title = "{title} {live} {flags}", title_pos = "center" },
              },
              { win = "preview", title = "{preview:Preview}", width = 0.45, border = "single", title_pos = "center" },
            },
          },
        },
        layout = "telescope",
      },
      profiler = { enabled = true },
      dashboard = { enabled = true },
    })
  end,
}