require '404-ai-irl.options'
require '404-ai-irl.lazy'
require '404-ai-irl.theme'
require '404-ai-irl.autocmd'
require '404-ai-irl.lsp'

-- Load plugin configs last
require '404-ai-irl.configs'

vim.schedule(function()
  vim.cmd.colorscheme 'eldritch'
end)
