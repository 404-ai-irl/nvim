vim.g.db_ui_auto_execute_table_helpers = 1
vim.g.db_ui_save_location = vim.fn.stdpath 'data' .. '/dadbod_ui'
vim.g.db_ui_show_database_icon = 1
vim.g.db_ui_tmp_query_location = vim.fn.stdpath 'data' .. '/dadbod_ui/tmp'
vim.g.db_ui_use_nerd_fonts = 1
vim.g.db_ui_execute_on_save = 1
vim.g.db_ui_winwidth = 30

local wk = require 'which-key'

local opts = { noremap = true, silent = true, mode = 'n' }
wk.add {
  { '<leader>d', group = 'Database', icon = '󰆼' },
  { '<leader>do', ':DBUIToggle<CR>', desc = '󰆼 Toggle DBUI', opts },
  { '<leader>df', ' :DBUIFindBuffer<CR>', desc = '󰍉 Find DB buffer', opts },
  { '<leader>dr', ':DBUIRenameBuffer<CR>', desc = '󰑕 Rename DB buffer', opts },
  { '<leader>dq', ':DBUILastQueryInfo<CR>', desc = '󰋖 Last query info', opts },
}
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'sql', 'mysql', 'plsql' },
  callback = function()
    vim.cmp.add_provider('dadbod', {
      name = 'Dadbod',
      module = 'vim_dadbod_completion.blink',
      score_offset = 85,
    })
  end,
})
