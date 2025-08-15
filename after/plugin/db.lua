vim.g.db_ui_auto_execute_table_helpers = 1
vim.g.db_ui_save_location = vim.fn.stdpath 'data' .. '/dadbod_ui'
vim.g.db_ui_show_database_icon = 1
vim.g.db_ui_tmp_query_location = vim.fn.stdpath 'data' .. '/dadbod_ui/tmp'
vim.g.db_ui_use_nerd_fonts = 1
vim.g.db_ui_execute_on_save = 0
vim.g.db_ui_winwidth = 30
vim.g.db_ui_notification_width = 50

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap('n', '<leader>du', ':DBUIToggle<CR>', opts)
keymap('n', '<leader>df', ':DBUIFindBuffer<CR>', opts)
keymap('n', '<leader>dr', ':DBUIRenameBuffer<CR>', opts)
keymap('n', '<leader>dq', ':DBUILastQueryInfo<CR>', opts)

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'sql', 'mysql', 'plsql' },
  callback = function()
    require('blink.cmp').add_provider('dadbod', {
      name = 'Dadbod',
      module = 'vim_dadbod_completion.blink',
      score_offset = 85,
    })
    
    require('blink.cmp').update_sources {
      default = { 'lsp', 'dadbod', 'buffer', 'path', 'snippets' },
    }
  end,
})
