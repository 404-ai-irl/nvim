vim.pack.add {{ src = 'https://github.com/nvim-treesitter/nvim-treesitter', version = 'master' }}
--- Treesitter
require('nvim-treesitter.configs').setup({
    sync_install = true,
    ensure_installed = {
        'lua',
        'yaml',
        'json',
        'jsonc',
        'javascript',
        'typescript',
        'vue',
        'c',
        'vim',
        'vimdoc',
        'markdown',
        'markdown_inline'
    },
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    indent = {
        enable = true
    },
    ignore_install = {},
    modules = {},
})

-- Auto Updates
vim.api.nvim_create_autocmd('PackChanged', {
    desc = 'Handle nvim-treesitter updates',
    group = vim.api.nvim_create_augroup('nvim-treesitter-pack-update-handler', {clear = true }),
    callback = function(event)
        if event.data.kind == 'update' then
            vim.notify('nvim-treesitter updated, running TSUpdate...', vim.log.levels.INFO)
            ---@diagnostic disable-next-line: param-type-mismatch
            local ok = pcall(vim.cmd, 'TSUpdate')
            if ok then
                vim.notify('TSUpdate completed successfully!', vim.log.levels.INFO)
            else
                vim.notify('TSUpdate command not avaliable yet, skipping', vim.log.levels.WARN)
            end
        end
    end,
})
