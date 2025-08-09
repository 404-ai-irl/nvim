-- global settings
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true

-- basic options
vim.o.termguicolors = true
vim.o.mouse = 'a'
vim.o.showmode = false
vim.o.conceallevel = 1

-- line numbers
vim.o.number = true
vim.o.relativenumber = true

-- list chars
vim.o.list = true
vim.opt.listchars = { tab = '-->', trail = '·', nbsp = '␣' }

-- safety QoL
vim.o.undofile = true

-- display settings
vim.o.cursorline = true
vim.o.scrolloff = 10
vim.o.confirm = true

-- system clipboard
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

-- search settings
vim.o.ignorecase = true
vim.o.smartcase = true

-- enable gutter
vim.o.signcolumn = 'no'

-- rendering
-- vim.o.updatetime = 250
-- vim.o.timeoutlen = 300

-- splits
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.inccommand = 'split'

-- indentation
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.expandtab = true
vim.o.breakindent = true

-- hide default statusline
vim.o.showtabline = 2
vim.opt.cmdheight = 0
