return {
  'obsidian-nvim/obsidian.nvim',
  version = '*', -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = 'markdown',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'Saghen/blink.cmp',
  },
  ---@module 'obsidian'
  ---@type obsidian.config.ClientOpts
  opts = {
    workspaces = {
      {
        name = 'personal',
        path = '~/Documents/Vaults/Artemis/',
      },
    },
    preferred_link_style = 'wiki',
    open_app_foreground = true,
    statusline = {
      enabled = true,
      format = '{{properties}} properties {{backlinks}} backlinks {{words}} words {{chars}} chars',
    },
    picker = {
      name = snacks.pick,
    },
    ui = {
      default = true,
    },
    templates = {
      default = true,
    },

    completion = {
      blink = true,
      min_chars = 2,
      match_case = false,
    },
    daily_notes = {
      folder = 'daily',
    },
    mappings = {
      -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
      ['gf'] = {
        action = function()
          return require('obsidian').util.gf_passthrough()
        end,
        opts = { noremap = false, expr = true, buffer = true },
      },
      -- Toggle check-boxes.
      ['<leader>ch'] = {
        action = function()
          return require('obsidian').util.toggle_checkbox()
        end,
        opts = { buffer = true },
      },
      -- Smart action depending on context: follow link, show notes with tag, toggle checkbox, or toggle heading fold
      ['<cr>'] = {
        action = function()
          return require('obsidian').util.smart_action()
        end,
        opts = { buffer = true, expr = true },
      },
    },
  },
}
