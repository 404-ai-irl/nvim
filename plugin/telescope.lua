vim.pack.add {
  { src = 'https://github.com/nvim-telescope/telescope.nvim' },
  { src = 'https://github.com/nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release' },
  { src = 'https://github.com/nvim-telescope/telescope-frecency.nvim' },
  { src = 'https://github.com/nvim-telescope/telescope-project.nvim' },
  { src = 'https://github.com/nvim-telescope/telescope-media-files.nvim' },
  { src = 'https://github.com/nvim-telescope/telescope-symbols.nvim' },
}

require('telescope').setup {
  defaults = {
    prompt_prefix = '🔍 ',
    selection_caret = '➤ ',
    mappings = {
      i = {
        ['<C-j>'] = require('telescope.actions').move_selection_next,
        ['<C-k>'] = require('telescope.actions').move_selection_previous,
        ['<C-h>'] = require('telescope.actions').which_key,
      },
    },
  },
  pickers = {
    find_files = {
      hidden = false,
    },
    live_grep = {
      additional_args = function()
        return { '--hidden' }
      end,
    },
    buffers = {
      show_all_buffers = true,
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
    frecency = {
      show_scores = false,
      show_unindexed = true,
      ignore_patterns = { "*.git/*", "*/tmp/*" },
    },
    project = {
      base_dirs = {
        '~/code',
        '~/code/ai',
        '~/.config',
      },
      hidden_files = true,
      theme = "dropdown",
    },
    media_files = {
      filetypes = {"png", "jpg", "mp4", "webm", "pdf"},
      find_cmd = "rg",
    },
    symbols = {
      sources = {'emoji', 'kaomoji', 'math', 'latex', 'gitmoji'},
    },
  },
}

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap('n', '<leader>ff', function()
  require('telescope.builtin').find_files()
end, opts)

keymap('n', '<leader>fg', function()
  require('telescope.builtin').live_grep()
end, opts)

keymap('n', '<leader>fb', function()
  require('telescope.builtin').buffers()
end, opts)

keymap('n', '<leader>fh', function()
  require('telescope.builtin').help_tags()
end, opts)

keymap('n', '<leader>fm', function()
  require('telescope.builtin').man_pages()
end, opts)

keymap('n', '<leader>fc', function()
  require('telescope.builtin').colorscheme()
end, opts)

keymap('n', '<leader>ft', function()
  require('telescope.builtin').lsp_document_symbols()
end, opts)

keymap('n', '<leader>fr', function()
  require('telescope.builtin').oldfiles()
end, opts)

-- Load extensions with error handling
local function safe_load_extension(name)
  local ok, err = pcall(require('telescope').load_extension, name)
  if not ok then
    vim.notify('Failed to load telescope extension: ' .. name .. '\nError: ' .. err, vim.log.levels.WARN)
  end
end

safe_load_extension('fzf')
safe_load_extension('frecency')
safe_load_extension('project')
safe_load_extension('media_files')
safe_load_extension('symbols')

-- Extension keymaps
keymap('n', '<leader>fp', function()
  require('telescope').extensions.project.project()
end, opts)

keymap('n', '<leader>fF', function()
  require('telescope').extensions.frecency.frecency()
end, opts)

keymap('n', '<leader>fM', function()
  require('telescope').extensions.media_files.media_files()
end, opts)

keymap('n', '<leader>fe', function()
  require('telescope.builtin').symbols{ sources = {'emoji'} }
end, opts)

keymap('n', '<leader>fs', function()
  require('telescope.builtin').symbols()
end, opts)