-- global settings
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true

-- UI options
vim.o.signcolumn = 'auto'
vim.o.cmdheight = 0
vim.o.termguicolors = true
vim.o.showmode = true
vim.o.conceallevel = 1
vim.o.showtabline = 1
vim.o.list = true
vim.opt.listchars = { tab = '->', trail = '·', nbsp = '␣' }
vim.o.wrap = true
vim.o.cursorline = false
vim.o.scrolloff = 6
vim.o.expandtab = true
vim.o.breakindent = true

-- basic options
vim.o.mouse = 'a'
vim.o.number = false
vim.o.relativenumber = false
vim.o.confirm = true
vim.o.undofile = false
vim.o.swapfile = false
vim.o.tabstop = 2
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.ignorecase = true
vim.o.smartcase = true
-- splits
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.inccommand = 'split'
-- system clipboard
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)
