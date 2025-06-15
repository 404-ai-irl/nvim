-- Core Config
require 'config.lazy'
require 'config.options'
require 'config.keymaps'
require 'config.autocmd'

-- Plugins
-- Lazy Plugin Manager
-- https://github.com/folke/lazy.nvim
require('lazy').setup {
  spec = {
    { import = 'plugins' },
    { import = 'plugins.ai' },
    { import = 'plugins.core' },
    { import = 'plugins.ui' },
    { import = 'plugins.lsp' },
    { import = 'plugins.blink' },
    { import = 'plugins.vcs' },
    { import = 'plugins.markdown' },
    { import = 'plugins.image' },
  },
}

-- Aerial.nvim
require('aerial').setup {
  -- optionally use on_attach to set keymaps when aerial has attached to a buffer
  on_attach = function(bufnr)
    -- Jump forwards/backwards with '{' and '}'
    vim.keymap.set('n', '{', '<cmd>AerialPrev<CR>', { buffer = bufnr })
    vim.keymap.set('n', '}', '<cmd>AerialNext<CR>', { buffer = bufnr })
  end,
}
vim.keymap.set('n', '<leader>a', '<cmd>AerialToggle!<CR>')


