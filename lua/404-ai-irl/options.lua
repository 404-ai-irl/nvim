--- global settings
-- leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
-- basic options
vim.o.mouse = 'a'
vim.o.confirm = true
vim.o.undofile = true
vim.o.swapfile = false
vim.o.tabstop = 2
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.ignorecase = true
vim.o.smartcase = true
-- add bun packages to PATH
vim.env.PATH = vim.env.PATH .. ':' .. vim.fn.expand '~/.bun/bin'
-- system clipboard
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

--- UI options
vim.g.have_nerd_font = true
vim.o.number = true
vim.o.relativenumber = true
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
-- folding
vim.o.foldenable = true
vim.o.foldlevel = 99
vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.o.foldtext = ''
vim.opt.foldcolumn = '0'
vim.opt.fillchars:append { fold = ' ' }
