require('blink.cmp').setup {
  sources = {
    default = { 'lsp', 'path', 'snippets', 'npm', 'emoji' },
    providers = {
      emoji = {
        module = 'blink-emoji',
        name = 'Emoji',
        score_offset = 93, -- the higher the number, the higher the priority
        min_keyword_length = 2,
        opts = { insert = true }, -- Insert emoji (default) or complete its name
      },
      npm = {
        name = 'npm',
        module = 'blink-cmp-npm',
        async = true,
        score_offset = 100,
      },
    },
  },
  completion = {
    ghost_text = {
      --- NOTE: Specific Options avaliable
      enabled = true,
    },
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 500,
      window = {
        border = 'rounded',
        winblend = 30,
      },
    },
    menu = {
      winblend = 20,
      draw = {
        align_to = 'cursor',
      },
    },
  },
  cmdline = { enabled = true },
  term = { enabled = true },
  signature = { enabled = true },
  appearance = {
    nerd_font_variant = 'mono',
  },
}

require('blink.chartoggle').setup {
  enabled = true,
}

-- Clear Vue.js treesitter cache when completion menu closes
vim.api.nvim_create_autocmd('User', {
  pattern = 'BlinkCmpMenuClosed',
  callback = function()
    local bufnr = vim.api.nvim_get_current_buf()
    vim.b[bufnr]._vue_ts_cached_is_in_start_tag = nil
  end,
})

local kset = vim.keymap.set
-- , toggles ,
kset({ 'n', 'v' }, ',', function()
  require('blink.chartoggle').toggle_char_eol ','
end)
-- Control + ; = toggle ;
kset({ 'n', 'v' }, '<C-;>', function()
  require('blink.chartoggle').toggle_char_eol ';'
end)
