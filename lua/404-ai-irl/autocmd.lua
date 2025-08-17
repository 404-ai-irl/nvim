--- See `:help lua-guide-autocommands`

--- [[ Basic Autocommands ]]
-- Highlight yanks
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})
-- Terminal Settings
local function set_terminal_keymaps()
  local opts = { buffer = 0 }
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
end
vim.api.nvim_create_autocmd({ 'TermOpen' }, {
  pattern = { '*' },
  callback = function(_)
    vim.cmd.setlocal 'nonumber'
    set_terminal_keymaps()
  end,
})

vim.api.nvim_create_autocmd({ 'FocusGained', 'BufEnter' }, {
  pattern = { '*' },
  command = 'checktime',
})

--- [[ Code Actions ]]
--- Biome
-- Auto code actions on save for Biome
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = { '*.js', '*.jsx', '*.ts', '*.tsx', '*.json', '*.css' },
  callback = function()
    local bufnr = vim.api.nvim_get_current_buf()
    local clients = vim.lsp.get_clients { bufnr = bufnr, name = 'biome' }

    if #clients > 0 then
      -- Request code actions for fixAll and organize imports
      local params = {
        textDocument = vim.lsp.util.make_text_document_params(),
        range = {
          start = { line = 0, character = 0 },
          ['end'] = { line = vim.api.nvim_buf_line_count(bufnr), character = 0 },
        },
        context = {
          only = { 'source.fixAll', 'source.organizeImports' },
          diagnostics = {},
        },
      }

      local actions = vim.lsp.buf_request_sync(bufnr, 'textDocument/codeAction', params, 1000)

      if actions then
        for _, client_actions in pairs(actions) do
          if client_actions.result then
            for _, action in ipairs(client_actions.result) do
              if action.edit then
                vim.lsp.util.apply_workspace_edit(action.edit, 'utf-8')
              elseif action.command then
                vim.lsp.buf.code_action(action.command)
              end
            end
          end
        end
      end
    end
  end,
  desc = 'Auto code actions for Biome on save',
})
