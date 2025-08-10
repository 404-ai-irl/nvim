---@type vim.lsp.Config
local jsonls_config = {
  capabilities = require('blink.cmp').get_lsp_capabilities(),
  settings = {
    json = {
      schemas = require('schemastore').json.schemas(),
      validate = { enable = true },
    },
  },
}
vim.lsp.config { 'jsonls', jsonls_config }
vim.lsp.enable 'jsonls'
