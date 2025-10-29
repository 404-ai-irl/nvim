require '404-ai-irl.options'
require '404-ai-irl.lazy'
require '404-ai-irl.autocmd'
require '404-ai-irl.keymaps'
require '404-ai-irl.config'
require '404-ai-irl.lsp'

vim.schedule(function()
  vim.cmd.colorscheme 'carbonfox'
end)
