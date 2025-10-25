local vset = vim.keymap.set
local wk = require 'which-key'

-- Leave insert mode ( jj / jk )
vset('i', 'jj', '<Esc>', { desc = 'JJ Esc' })
vset('i', 'jk', '<Esc>', { desc = 'JK Esc' })
