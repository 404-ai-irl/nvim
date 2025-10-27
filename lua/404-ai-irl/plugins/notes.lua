return {
  {
    'echaya/neowiki.nvim',
    dependencies = {
      {
        'OXY2DEV/markview.nvim',
        lazy = false,
        opts = {
          preview = {
            filetypes = { 'markdown', 'codecompanion' },
            ignore_buftypes = {},
          },
        },
      },
      {
        'HakonHarnes/img-clip.nvim',
        event = 'VeryLazy',
        opts = {
          filetypes = {
            codecompanion = {
              prompt_for_file_name = true,
              template = '[Image]($FILE_PATH)',
              use_absolute_path = true,
            },
          },
          keys = { { '<leader>p', '<cmd>PasteImage<cr>', desc = 'Paste image from system clipboard' } },
        },
      },
    },
    opts = {
      wiki_dirs = {
        {
          name = 'TT.AI',
          path = '~/documents/tt.ai.notes/',
        },
        {
          name = 'dev',
          path = '~/documents/notes/dev/',
        },
      },
    },
    keys = {
      { '<leader>ww', "<cmd>lua require('neowiki').open_wiki()<cr>", desc = 'Open Wiki' },
      { '<leader>wW', "<cmd>lua require('neowiki').open_wiki_floating()<cr>", desc = 'Open Wiki in Floating Window' },
      { '<leader>wT', "<cmd>lua require('neowiki').open_wiki_new_tab()<cr>", desc = 'Open Wiki in Tab' },
    },
  },
}
-- Obsidian integration
-- {
--   "epwalsh/obsidian.nvim",
--   version = "*",
--   lazy = true,
--   ft = "markdown",
--   dependencies = {
--     "nvim-lua/plenary.nvim",
--   },
--   config = function()
--     require('obsidian').setup {
--       -- core
--       workspaces = {
--         {
--           name = 'dev_notes',
--           path = '~/documents/notes/dev',
--         },
--         {
--           name = 'tt_ai',
--           path = '~/code/tt.ai/notes',
--         },
--       },
--       log_level = vim.log.levels.INFO,
--       daily_notes = {
--         default_tags = { 'daily-notes', 'todos' },
--         template = nil,
--         workdays_only = true,
--       },
--       completion = {
--         nvim_cmp = false,
--         blink = true,
--         min_chars = 2,
--         create_new = true,
--       },
--       new_notes_location = 'current_dir',
--       legacy_commands = false,
--
--       -- Note title,id,link formatting functions
--       ---@param title string|?
--       ---@return string
--       note_id_func = function(title)
--         local suffix = ''
--         if title ~= nil then
--           suffix = title:gsub(' ', '-'):gsub('[^A-Za-z0-9-]', ''):lower()
--         else
--           -- If title is nil, just add 4 random uppercase letters to the suffix.
--           for _ = 1, 4 do
--             suffix = suffix .. string.char(math.random(65, 90))
--           end
--         end
--         return tostring(os.time()) .. '-' .. suffix
--       end,
--       ---@param spec { id: string, dir: obsidian.Path, title: string|? }
--       ---@return string|obsidian.Path The full path to the new note.
--       note_path_func = function(spec)
--         local path = spec.dir / tostring(spec.id)
--         return path:with_suffix '.md'
--       end,
--       wiki_link_func = 'use_alias_only',
--       markdown_link_func = function(opts)
--         return require('obsidian.util').markdown_link(opts)
--       end,
--       preferred_link_style = 'wiki',
--
--       -- frontmatter options
--       disable_frontmatter = false,
--       -- Optional, alternatively you can customize the frontmatter data.
--       ---@return table
--       note_frontmatter_func = function(note)
--         -- Add the title of the note as an alias.
--         if note.title then
--           note:add_alias(note.title)
--         end
--         local out = { id = note.id, aliases = note.aliases, tags = note.tags }
--         -- `note.metadata` contains any manually added fields in the frontmatter.
--         -- So here we just make sure those fields are kept in the frontmatter.
--         if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
--           for k, v in pairs(note.metadata) do
--             out[k] = v
--           end
--         end
--         return out
--       end,
--
--       -- template options
--       templates = {
--         -- Optional, for templates (see https://github.com/obsidian-nvim/obsidian.nvim/wiki/Using-templates)
--         folder = 'templates',
--         date_format = '%Y-%m-%d',
--         time_format = '%H:%M',
--         -- See: https://github.com/obsidian-nvim/obsidian.nvim/wiki/Template#substitutions
--         substitutions = {},
--         --- See: https://github.com/obsidian-nvim/obsidian.nvim/wiki/Template#customizations
--         customizations = {},
--       },
--
--       -- opening options
--       ---@param url string
--       follow_url_func = function(url)
--         vim.ui.open(url)
--       end,
--       -- Sets how you follow images
--       ---@param img string
--       follow_img_func = function(img)
--         vim.ui.open(img)
--       end,
--       ---@class obsidian.config.OpenOpts
--       ---
--       ---Opens the file with current line number
--       ---@field use_advanced_uri? boolean
--       ---
--       ---Function to do the opening, default to vim.ui.open
--       ---@field func? fun(uri: string)
--       open = {
--         use_advanced_uri = false,
--         func = vim.ui.open,
--       },
--       -- picker options
--       picker = {
--         name = 'snacks.picker',
--         note_mappings = {
--           new = '<C-x>',
--           insert_link = '<C-l>',
--         },
--         tag_mappings = {
--           tag_note = '<C-x>',
--           insert_tag = '<C-l>',
--         },
--       },
--
--       -- search options
--       -- Optional, sort search results by "path", "modified", "accessed", or "created".
--       -- The recommend value is "modified" and `true` for `sort_reversed`, which means, for example,
--       -- that `:Obsidian quick_switch` will show the notes sorted by latest modified time
--       sort_by = 'modified',
--       sort_reversed = true,
--       search_max_lines = 1000,
--       open_notes_in = 'current',
--
--       -- callback functions
--       callbacks = {
--         -- Runs at the end of `require("obsidian").setup()`.
--         ---@param client obsidian.Client
--         post_setup = function(client) end,
--         -- Runs anytime you enter the buffer for a note.
--         ---@param client obsidian.Client
--         ---@param note obsidian.Note
--         enter_note = function(client, note) end,
--         -- Runs anytime you leave the buffer for a note.
--         ---@param client obsidian.Client
--         ---@param note obsidian.Note
--         leave_note = function(client, note) end,
--         pre_write_note = function(client, note) end,
--         post_set_workspace = function(workspace) end,
--       },
--
--       -- ui (disabled - let markview handle rendering)
--       ui = {
--         enable = false,
--       },
--
--       -- attachements
--       attachments = {
--         img_folder = 'assets/imgs',
--         img_name_func = function()
--           return string.format('Pasted image %s', os.date '%Y%m%d%H%M%S')
--         end,
--         confirm_img_paste = true,
--       },
--
--       -- footer options
--       footer = {
--         enabled = true,
--         format = '{{backlinks}} backlinks  {{properties}} properties  {{words}} words  {{chars}} chars',
--         hl_group = 'Comment',
--         separator = string.rep('-', 80),
--       },
--       ---@class obsidian.config.CheckboxOpts
--       checkbox = {
--         order = { ' ', '!', 'x' },
--       },
--     }
--   end,
-- },
