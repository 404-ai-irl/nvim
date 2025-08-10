vim.pack.add {
  {
    src = 'https://github.com/nvim-telescope/telescope.nvim',
    version = vim.version.range '0.1.*',
  },
  { src = 'https://github.com/nvim-lua/plenary.nvim' },
}

--- Display
require('telescope').setup {
  defaults = {
    layout_config = {
      vertical = {
        width = 0.5,
      },
    },
  },
}

--- Keymaps
local builtin = require 'telescope.builtin'
local kset = vim.keymap.set
kset('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
kset('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
kset('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
kset('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
kset('n', '<leader>fm', builtin.man_pages, { desc = 'Telescope man pages' })
kset('n', '<leader>fc', builtin.colorscheme, { desc = 'Telescope colorschemes' })
kset('n', '<leader>ft', builtin.treesitter, { desc = 'Telescope treesitter' })
