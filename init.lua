require 'pack' -- Install Plugins
vim.schedule(function()
  vim.cmd.colorscheme 'kanagawa-dragon'
  require('notify').setup()
  require('fidget').setup {}
  require '404-ai-irl'
end)
