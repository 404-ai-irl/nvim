require('lspconfig').jsonls.setup {
  settings = {
    json = {
      schemas = require('schemastore').json.schemas(),
      validate = { enable = true },
    },
  },
}

require('lspconfig').yamlls.setup {
  settings = {
    yaml = {
      schemaStore = {
        enable = false,
        url = '',
      },
    },
    schemas = require('schemastore').yaml.schemas(),
  },
}
