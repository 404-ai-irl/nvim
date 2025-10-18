Add {
  { src = 'nvim-telescope/telescope.nvim' },
  { src = 'nvim-telescope/telescope-fzf-native.nvim' },
  { src = 'nvim-telescope/telescope-symbols.nvim', build = 'make' },
}

local wk = require 'which-key'
local scope = require 'telescope'
local tb = require 'telescope.builtin'

scope.setup {
  defaults = {
    mappings = {},
  },
  pickers = {},
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = 'smart_case',
    },
  },
}

scope.load_extension 'fzf'

-- keymaps
wk.add {
  {
    '<leader><space>',
    function()
      tb.find_files()
    end,
    desc = 'Smart Find Files',
  },
  {
    '<leader>,',
    function()
      tb.buffers()
    end,
    desc = 'Buffers',
  },
  {
    '<leader>/',
    function()
      tb.live_grep()
    end,
    desc = 'Grep',
  },
  {
    '<leader>:',
    function()
      tb.command_history()
    end,
    desc = 'Command History',
  },
  -- find
  {
    '<leader>fb',
    function()
      tb.buffers()
    end,
    desc = 'Buffers',
  },
  {
    '<leader>fc',
    function()
      tb.find_files { cwd = vim.fn.stdpath 'config' }
    end,
    desc = 'Find Config File',
  },
  {
    '<leader>ff',
    function()
      tb.find_files()
    end,
    desc = 'Find Files',
  },
  {
    '<leader>fg',
    function()
      tb.git_files()
    end,
    desc = 'Find Git Files',
  },
  {
    '<leader>fr',
    function()
      tb.oldfiles()
    end,
    desc = 'Recent Files',
  },
  -- git
  {
    '<leader>gb',
    function()
      tb.git_branches()
    end,
    desc = 'Git Branches',
  },
  {
    '<leader>gl',
    function()
      tb.git_commits()
    end,
    desc = 'Git Log',
  },
  {
    '<leader>gs',
    function()
      tb.git_status()
    end,
    desc = 'Git Status',
  },
  -- Grep
  {
    '<leader>sb',
    function()
      tb.current_buffer_fuzzy_find()
    end,
    desc = 'Buffer Lines',
  },
  {
    '<leader>sg',
    function()
      tb.live_grep()
    end,
    desc = 'Grep',
  },
  {
    '<leader>sw',
    function()
      tb.grep_string()
    end,
    desc = 'Visual selection or word',
    mode = { 'n', 'x' },
  },
  -- search
  {
    '<leader>sc',
    function()
      tb.command_history()
    end,
    desc = 'Command History',
  },
  {
    '<leader>sC',
    function()
      tb.commands()
    end,
    desc = 'Commands',
  },
  {
    '<leader>sd',
    function()
      tb.diagnostics()
    end,
    desc = 'Diagnostics',
  },
  {
    '<leader>sh',
    function()
      tb.help_tags()
    end,
    desc = 'Help Pages',
  },
  {
    '<leader>sk',
    function()
      tb.keymaps()
    end,
    desc = 'Keymaps',
  },
  {
    '<leader>sR',
    function()
      tb.resume()
    end,
    desc = 'Resume',
  },
  -- LSP
  {
    'gd',
    function()
      tb.lsp_definitions()
    end,
    desc = 'Goto Definition',
  },
  {
    'gr',
    function()
      tb.lsp_references()
    end,
    nowait = true,
    desc = 'References',
  },
  {
    '<leader>ss',
    function()
      tb.lsp_document_symbols()
    end,
    desc = 'LSP Symbols',
  },
  {
    '<leader>sS',
    function()
      tb.lsp_workspace_symbols()
    end,
    desc = 'LSP Workspace Symbols',
  },
}
