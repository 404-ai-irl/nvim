return {
  'obsidian-nvim/obsidian.nvim',

  version = '*', -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = 'markdown',

  dependencies = {
    'nvim-lua/plenary.nvim',
    'Saghen/blink.cmp',
  },

  opts = {
    workspaces = {
      {
        name = 'personal',
        path = '~/Documents/Vaults/Artemis/',
      },
    },

    preferred_link_style = 'wiki',

    open = function()
      require('obsidian').open()
    end,

    picker = {
      name = require('snacks').picker,
    },

    ui = {
      default = true,
    },

    templates = {
      default = true,
    },

    note_frontmatter_func = function(note)
      -- Add the title of the note as an alias.
      if note.title then
        note:add_alias(note.title)
      end
      local out = { id = note.id, aliases = note.aliases, tags = note.tags }
      -- `note.metadata` contains any manually added fields in the frontmatter.
      -- So here we just make sure those fields are kept in the frontmatter.
      if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
        for k, v in pairs(note.metadata) do
          out[k] = v
        end
      end
      return out
    end,

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
