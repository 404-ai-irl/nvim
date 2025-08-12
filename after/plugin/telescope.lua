require('telescope').setup {
  defaults = {
    sorting_strategy = 'ascending', -- or 'ascending'
    selection_strategy = 'reset', -- or 'follow', 'row', 'closest', 'none'
    scrolling_strategy = 'cycle', -- or 'limit'
    winblend = 30,
    prompt_prefix = '🔭 ',
    selection_caret = '=>',
    cache_picker = {
      num_pickers = 3,
      limit_entries = 1000, -- default
      ignore_empty_prompt = true,
    },
    pickers = {},
    extensions = {},
  },
}

require('nerdy').setup {
  copy_to_clipboard = true,
}

require('telescope').load_extension 'nerdy'
vim.keymap.set('n', '<leader>fn', '<cmd>Telescope nerdy<cr>', { desc = 'Telescope find nerd font glyphs' })

local builtin = require 'telescope.builtin'
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set('n', '<leader>fs', builtin.symbols, { desc = 'Telescope symbols' })
