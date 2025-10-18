--- TS Core
require('nvim-treesitter.configs').setup {
  sync_install = true,
  ensure_installed = {
    'lua',
    'yaml',
    'jsonc',
    'json5',
    'javascript',
    'typescript',
    'vue',
    'vim',
    'vimdoc',
    'markdown',
    'javascript',
    'markdown_inline',
    'markdown',
    'vue',
    'latex',
    'regex',
  },
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true,
  },
  indent = {
    enable = true,
  },
  ignore_install = {},
  modules = {},
}

--- TS Context
require('treesitter-context').setup {
  enable = true,
  multiwindow = false,
  max_lines = 0,
  line_numbers = true,
  multiline_threshold = 20,
  trim_scope = 'outer',
  mode = 'cursor', -- 'cursor' | 'topline'
  seperator = '---',
  zindex = 20,
  on_attach = nil, -- (fun(buf: integer): boolean) false = disabled
}

--- TS Autotag
require('nvim-ts-autotag').setup {
  opts = {
    enable_close = true,
    enable_rename = true,
    enable_close_on_slash = true,
  },
  per_filetype = {
    ['html'] = {
      enable_close = true,
    },
  },
}

--- Auto Updates (TSUpdate)
vim.api.nvim_create_autocmd('PackChanged', {
  desc = 'Handle nvim-treesitter updates',
  group = vim.api.nvim_create_augroup('nvim-treesitter-pack-update-handler', { clear = true }),
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
