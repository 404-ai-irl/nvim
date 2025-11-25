-- Enable treesitter highlighting for markdown
vim.treesitter.start()

-- Folding configuration
vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.wo.foldmethod = 'expr'



