require 'pack' -- Install Plugins

vim.schedule(function()
  vim.cmd.colorscheme 'kanagawa-dragon'
end)

require('notify').setup()
require('fidget').setup {}

require '404-ai-irl' -- Personal Options
