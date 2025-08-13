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
vim.o.undofile = false
vim.o.swapfile = false

-- display settings
vim.o.wrap = false
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
vim.o.signcolumn = 'auto:3'

-- rendering
-- vim.o.updatetime = 250
-- vim.o.timeoutlen = 300

-- splits
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.inccommand = 'split'

-- indentation
local tabstop = vim.o.tabstop
tabstop = 2
vim.o.tabstop = tabstop
vim.o.shiftwidth = tabstop
vim.o.softtabstop = tabstop

vim.o.expandtab = true
vim.o.breakindent = true

-- hide default statusline
vim.o.showtabline = 2
vim.opt.cmdheight = 0
