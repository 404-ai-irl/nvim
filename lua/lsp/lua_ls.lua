local config = {
  capabilities = require('blink.cmp').get_lsp_capabilities(),
}

vim.lsp.config('lua_ls', config)
vim.lsp.enable 'lua_ls'
