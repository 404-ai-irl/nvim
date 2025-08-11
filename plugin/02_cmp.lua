vim.pack.add {
  { src = 'https://github.com/Saghen/blink.cmp', version = vim.version.range '1.*' },
  { src = 'https://github.com/Saghen/blink.nvim', version = 'main' },
  { src = 'https://github.com/moyiz/blink-emoji.nvim' },
  { src = 'https://github.com/alexandre-abrioux/blink-cmp-npm.nvim' },
  { src = 'https://github.com/L3MON4D3/LuaSnip' },
  { src = 'https://github.com/rafamadriz/friendly-snippets' },
}

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

local kset = vim.keymap.set
-- , toggles ,
kset({ 'n', 'v' }, ',', function()
  require('blink.chartoggle').toggle_char_eol ','
end)
-- Control + ; = toggle ;
kset({ 'n', 'v' }, '<C-;>', function()
  require('blink.chartoggle').toggle_char_eol ';'
end)
