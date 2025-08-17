-- Obsidian.nvim
require('obsidian').setup {
  workspaces = {
    {
      name = 'Artemis',
      path = '~/documents/Vaults/Artemis/',
    },
  },
  log_level = vim.log.levels.INFO,

  daily_notes = {
    folder = '/daily',
    date_format = '%Y-%m-%d',
    alias_format = '%B %-d, %Y',
    default_tags = { 'daily-notes' },
    template = nil,
    workdays_only = true,
  },

  completion = {
    nvim_cmp = false,
    blink = true,
    min_chars = 2,
    create_new = true,
  },

  picker = {
    name = 'fzf-lua',
    note_mappings = {
      new = '<C-x>',
      insert_link = '<C-l>',
    },
    tag_mappings = {
      tag_note = '<C-x>',
      insert_tag = '<C-l>',
    },
  },
  attachments = {
    img_folder = 'assets/imgs',
    img_name_func = function()
      return string.format('%s', os.date '%Y%m%d%H%M%S')
    end,
    confirm_img_paste = true,
  },

  legacy_commands = false,
  -- UI is handled by render-markdown
  ui = { enable = true },
}

--- Keymaps
local wk = require 'which-key'
wk.add {
  { '<leader>o', group = 'Obsidian Notes', icon = '' },
}
