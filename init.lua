-- Install Plugins
require 'pack'
Ensure_plugins_built()

-- Defer the final setup
vim.schedule(function()
  vim.cmd.colorscheme 'kanagawa-dragon'
  require('notify').setup()
  require('fidget').setup {}
  require '404-ai-irl'
end)
