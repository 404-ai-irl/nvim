--- global settings
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true

vim.g.db_ui_auto_execute_table_helpers = 1
vim.g.db_ui_save_location = vim.fn.stdpath 'data' .. '/dadbod_ui'
vim.g.db_ui_show_database_icon = 1
vim.g.db_ui_tmp_query_location = vim.fn.stdpath 'data' .. '/dadbod_ui/tmp'
vim.g.db_ui_use_nerd_fonts = 1
vim.g.db_ui_execute_on_save = 1
vim.g.db_ui_winwidth = 30

--- UI options
vim.o.winborder = 'bold'
vim.o.signcolumn = 'auto:2'
vim.o.cmdheight = 0
vim.o.termguicolors = true
vim.o.showmode = true
vim.o.conceallevel = 2
vim.o.showtabline = 1
vim.o.list = true
vim.opt.listchars = { tab = '->', trail = '·', nbsp = '␣' }
vim.o.wrap = true
vim.o.cursorline = true
vim.o.scrolloff = 6
vim.o.expandtab = true
vim.o.breakindent = true
vim.o.inccommand = 'split'
vim.o.splitright = true
vim.o.splitbelow = true

-- basic options
vim.o.mouse = 'a'
vim.o.number = true
vim.o.relativenumber = true
vim.o.confirm = true
vim.o.undofile = false
vim.o.swapfile = false
vim.o.tabstop = 2
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.ignorecase = true
vim.o.smartcase = true

-- system clipboard
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)
