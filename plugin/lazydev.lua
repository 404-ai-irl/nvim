--- LazyDev for Lazy Loading Lua
---@class lazydev.Config
local lazydev_conf = {
  integrations = {
    coq = false,
    lspconfig = true,
    cmp = true,
  },
  library = {
    { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
  },
}

require('lazydev').setup(lazydev_conf)
