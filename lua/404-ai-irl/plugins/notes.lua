-- ~/.config/nvim/lua/plugins/obsidian.lua
return {
  -- Render Markdown Plugin
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'echasnovski/mini.icons', -- or "nvim-tree/nvim-web-devicons"
    },
    ft = { 'markdown' }, -- Lazy load on markdown and MDX files
    opts = {
      -- File types to enable rendering

      -- Enable rendering by default
      enabled = true,

      -- Performance settings
      max_file_size = 10.0,
      debounce = 100,

      -- Render modes - show rendered view in normal, command, terminal
      render_modes = { 'n', 'c', 't' },

      -- Anti-conceal for smooth editing experience
      anti_conceal = {
        enabled = true,
        above = 0,
        below = 0,
        ignore = {
          code_background = true,
          sign = true,
        },
      },

      -- === CLEAN, STYLISH HEADING CONFIGURATION ===
      heading = {
        enabled = true,
        sign = false, -- Cleaner look without sign column
        position = 'overlay',
        icons = { '󰎤 ', '󰎧 ', '󰎪 ', '󰎭 ', '󰎱 ', '󰎳 ' }, -- Minimal, clean icons
        width = 'block', -- Use block width for cleaner, focused look
        left_pad = 1,
        right_pad = 1,
        min_width = 0,
        border = false, -- No borders for minimal aesthetic
        border_virtual = false,
        backgrounds = {
          'RenderMarkdownH1Bg',
          'RenderMarkdownH2Bg',
          'RenderMarkdownH3Bg',
          'RenderMarkdownH4Bg',
          'RenderMarkdownH5Bg',
          'RenderMarkdownH6Bg',
        },
        foregrounds = {
          'RenderMarkdownH1',
          'RenderMarkdownH2',
          'RenderMarkdownH3',
          'RenderMarkdownH4',
          'RenderMarkdownH5',
          'RenderMarkdownH6',
        },
      },

      -- === CLEAN CODE BLOCK STYLING ===
      code = {
        enabled = true,
        sign = false, -- Cleaner without sign column
        style = 'full',
        position = 'left',
        disable_background = false,
        width = 'block', -- Focused block width
        left_pad = 1,
        right_pad = 1,
        min_width = 0,
        border = 'thin', -- Subtle thin borders
        above = '▄',
        below = '▀',
        highlight = 'RenderMarkdownCode',
        highlight_inline = 'RenderMarkdownCodeInline',
      },

      -- === CLEAN BULLET POINTS ===
      bullet = {
        enabled = true,
        icons = { '•', '◦', '▪', '▫' }, -- Simple, clean bullets
        left_pad = 0,
        right_pad = 1,
        highlight = 'RenderMarkdownBullet',
      },

      -- === CHECKBOX STYLING ===
      checkbox = {
        enabled = true,
        unchecked = {
          icon = '󰄱 ',
          highlight = 'RenderMarkdownUnchecked',
        },
        checked = {
          icon = '󰱒 ',
          highlight = 'RenderMarkdownChecked',
        },
        custom = {
          todo = { raw = '[-]', rendered = '󰥔 ', highlight = 'RenderMarkdownTodo' },
          important = { raw = '[!]', rendered = '󰀨 ', highlight = 'DiagnosticWarn' },
          question = { raw = '[?]', rendered = '󰘥 ', highlight = 'DiagnosticInfo' },
        },
      },

      -- === MINIMAL QUOTE STYLING ===
      quote = {
        enabled = true,
        icon = '│', -- Clean vertical line
        repeat_linebreak = false,
        highlight = 'RenderMarkdownQuote',
      },

      -- === CLEAN TABLE STYLING ===
      pipe_table = {
        enabled = true,
        preset = 'round', -- Rounded corners for modern look
        style = 'full',
        cell = 'padded',
        padding = 1,
        min_width = 0,
        border = {
          '╭',
          '┬',
          '╮',
          '├',
          '┼',
          '┤',
          '╰',
          '┴',
          '╯',
          '│',
          '─',
        },
        alignment_indicator = '━',
        head = 'RenderMarkdownTableHead',
        row = 'RenderMarkdownTableRow',
        filler = 'RenderMarkdownTableFill',
      },

      -- === OBSIDIAN CALLOUTS (GitHub + Obsidian) ===
      callout = {
        -- GitHub callouts
        note = { raw = '[!NOTE]', rendered = '󰋽 Note', highlight = 'DiagnosticInfo' },
        tip = { raw = '[!TIP]', rendered = '󰌶 Tip', highlight = 'DiagnosticOk' },
        important = { raw = '[!IMPORTANT]', rendered = '󰅾 Important', highlight = 'DiagnosticHint' },
        warning = { raw = '[!WARNING]', rendered = '󰀪 Warning', highlight = 'DiagnosticWarn' },
        caution = { raw = '[!CAUTION]', rendered = '󰳦 Caution', highlight = 'DiagnosticError' },

        -- Obsidian callouts
        abstract = { raw = '[!ABSTRACT]', rendered = '󰨸 Abstract', highlight = 'DiagnosticInfo' },
        todo = { raw = '[!TODO]', rendered = '󰄱 Todo', highlight = 'DiagnosticInfo' },
        success = { raw = '[!SUCCESS]', rendered = '󰗠 Success', highlight = 'DiagnosticOk' },
        question = { raw = '[!QUESTION]', rendered = '󰘥 Question', highlight = 'DiagnosticWarn' },
        failure = { raw = '[!FAILURE]', rendered = '󰅖 Failure', highlight = 'DiagnosticError' },
        danger = { raw = '[!DANGER]', rendered = '󱐌 Danger', highlight = 'DiagnosticError' },
        bug = { raw = '[!BUG]', rendered = '󰨰 Bug', highlight = 'DiagnosticError' },
        example = { raw = '[!EXAMPLE]', rendered = '󰉹 Example', highlight = 'DiagnosticHint' },
        quote = { raw = '[!QUOTE]', rendered = '󱆨 Quote', highlight = '@markup.quote' },
      },

      -- === LINK STYLING ===
      link = {
        enabled = true,
        image = '󰥶 ',
        email = '󰀓 ',
        hyperlink = '󰌹 ',
        highlight = 'RenderMarkdownLink',
        wiki = {
          icon = '󱗖 ',
          highlight = 'RenderMarkdownWikiLink',
        },
        custom = {
          web = { pattern = '^http', icon = '󰖟 ' },
        },
      },

      -- === BLINK.CMP INTEGRATION ===
      completions = {
        blink = { enabled = true },
      },

      -- Window options for concealment
      win_options = {
        conceallevel = {
          default = vim.o.conceallevel,
          rendered = 3,
        },
        concealcursor = {
          default = vim.o.concealcursor,
          rendered = '',
        },
      },
    },

    config = function(_, opts)
      -- Disable obsidian.nvim UI to use render-markdown instead
      local obsidian_status, obsidian = pcall(require, 'obsidian')
      if obsidian_status then
        local client = obsidian.get_client()
        if client and client.opts and client.opts.ui then
          client.opts.ui.enable = false
          -- Clear obsidian UI namespace
          local ns_id = vim.api.nvim_get_namespaces()['ObsidianUI']
          if ns_id then
            vim.api.nvim_buf_clear_namespace(0, ns_id, 0, -1)
          end
        end
      end

      require('render-markdown').setup(opts)
    end,
  },
  -- Obsidian.nvim Plugin
  {
    'obsidian-nvim/obsidian.nvim',
    version = '*',
    lazy = true,
    event = {
      'BufReadPre ' .. vim.fn.expand '~' .. '/vaults/**.md',
      'BufNewFile ' .. vim.fn.expand '~' .. '/vaults/**.md',
    },

    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
    },

    keys = {
      -- Quick access commands
      { '<leader>on', '<cmd>Obsidian new<cr>', desc = 'New note' },
      { '<leader>oo', '<cmd>Obsidian open<cr>', desc = 'Open in Obsidian app' },
      { '<leader>ob', '<cmd>Obsidian backlinks<cr>', desc = 'Show backlinks' },
      { '<leader>ot', '<cmd>Obsidian today<cr>', desc = 'Open daily note' },
      { '<leader>oy', '<cmd>Obsidian yesterday<cr>', desc = "Yesterday's note" },
      { '<leader>oT', '<cmd>Obsidian tomorrow<cr>', desc = "Tomorrow's note" },
      { '<leader>os', '<cmd>Obsidian search<cr>', desc = 'Search notes' },
      { '<leader>oq', '<cmd>Obsidian quick_switch<cr>', desc = 'Quick switch' },
      { '<leader>ol', '<cmd>Obsidian links<cr>', desc = 'Show links' },
      { '<leader>og', '<cmd>Obsidian tags<cr>', desc = 'Search tags' },
      { '<leader>ow', '<cmd>Obsidian workspace<cr>', desc = 'Switch workspace' },
      { '<leader>of', '<cmd>Obsidian template<cr>', desc = 'Insert template' },
      { '<leader>oc', '<cmd>Obsidian toggle_checkbox<cr>', desc = 'Toggle checkbox' },

      -- Smart actions
      {
        '<cr>',
        function()
          return require('obsidian').util.smart_action()
        end,
        desc = 'Obsidian smart action',
        buffer = true,
        expr = true,
      },

      -- Link navigation
      {
        '[o',
        function()
          return require('obsidian').util.nav_link 'prev'
        end,
        desc = 'Previous link',
        buffer = true,
      },
      {
        ']o',
        function()
          return require('obsidian').util.nav_link 'next'
        end,
        desc = 'Next link',
        buffer = true,
      },

      -- Visual mode mappings
      { '<leader>ol', ':<c-u>Obsidian link<cr>', mode = 'v', desc = 'Link selection' },
      { '<leader>oL', ':<c-u>Obsidian link_new<cr>', mode = 'v', desc = 'Link to new note' },
      { '<leader>oe', ':<c-u>Obsidian extract_note<cr>', mode = 'v', desc = 'Extract to new note' },
    },

    opts = {
      -- ===== WORKSPACE CONFIGURATION =====
      workspaces = {
        {
          name = 'personal',
          path = '~/vaults/personal',
        },
        {
          name = 'work',
          path = '~/vaults/work',
          -- Workspace-specific overrides
          overrides = {
            notes_subdir = 'notes',
            daily_notes = {
              folder = 'dailies',
            },
          },
        },
      },

      -- Or use a single vault:
      -- dir = "~/vaults/personal",

      -- Where to put new notes
      notes_subdir = 'notes',

      -- Logging level
      log_level = vim.log.levels.INFO,

      -- ===== DAILY NOTES =====
      daily_notes = {
        folder = 'dailies',
        date_format = '%Y-%m-%d',
        alias_format = '%B %-d, %Y',
        default_tags = { 'daily-notes' },
        template = nil, -- Set to template name if you want auto-template
        workdays_only = true, -- yesterday/tomorrow skip weekends
      },

      -- ===== COMPLETION =====
      completion = {
        nvim_cmp = false, -- Disable nvim-cmp since you're using blink
        min_chars = 2,
      },

      -- ===== NOTE CREATION =====
      new_notes_location = 'notes_subdir',

      -- Customize note IDs (Zettelkasten style with timestamp)
      note_id_func = function(title)
        local suffix = ''
        if title ~= nil then
          suffix = title:gsub(' ', '-'):gsub('[^A-Za-z0-9-]', ''):lower()
        else
          for _ = 1, 4 do
            suffix = suffix .. string.char(math.random(65, 90))
          end
        end
        return tostring(os.time()) .. '-' .. suffix
      end,

      -- Customize file paths
      note_path_func = function(spec)
        local path = spec.dir / tostring(spec.id)
        return path:with_suffix '.md'
      end,

      -- ===== LINK FORMATTING =====
      wiki_link_func = function(opts)
        return require('obsidian.util').wiki_link_id_prefix(opts)
      end,

      markdown_link_func = function(opts)
        return require('obsidian.util').markdown_link(opts)
      end,

      preferred_link_style = 'wiki', -- or "markdown"

      -- ===== FRONTMATTER =====
      disable_frontmatter = false,

      note_frontmatter_func = function(note)
        if note.title then
          note:add_alias(note.title)
        end

        local out = {
          id = note.id,
          aliases = note.aliases,
          tags = note.tags,
          created = os.date '%Y-%m-%d %H:%M:%S',
        }

        -- Preserve any manually added fields
        if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
          for k, v in pairs(note.metadata) do
            out[k] = v
          end
        end

        return out
      end,

      -- ===== TEMPLATES =====
      templates = {
        folder = 'templates',
        date_format = '%Y-%m-%d',
        time_format = '%H:%M',
        substitutions = {
          -- Custom template variables
          yesterday = function()
            return os.date('%Y-%m-%d', os.time() - 86400)
          end,
          tomorrow = function()
            return os.date('%Y-%m-%d', os.time() + 86400)
          end,
        },
      },

      -- ===== URL HANDLING =====
      follow_url_func = function(url)
        vim.ui.open(url)
      end,

      follow_img_func = function(img)
        vim.ui.open(img)
      end,

      -- ===== OPEN IN OBSIDIAN APP =====
      open = {
        use_advanced_uri = false,
        func = vim.ui.open,
      },

      -- ===== PICKER CONFIGURATION =====
      picker = {
        name = 'mini.pick', -- Using mini.pick
        note_mappings = {
          new = '<C-x>',
          insert_link = '<C-l>',
        },
        tag_mappings = {
          tag_note = '<C-x>',
          insert_tag = '<C-l>',
        },
      },

      -- ===== BACKLINKS =====
      backlinks = {
        parse_headers = true,
      },

      -- ===== SEARCH =====
      sort_by = 'modified',
      sort_reversed = true,
      search_max_lines = 1000,
      open_notes_in = 'current', -- or "vsplit", "hsplit"

      -- ===== UI CONFIGURATION =====
      -- IMPORTANT: Set to false since you're using render-markdown.nvim
      ui = {
        enable = false, -- Disable to avoid conflicts with render-markdown.nvim
        ignore_conceal_warn = true,
      },

      -- ===== ATTACHMENTS (Images) =====
      attachments = {
        img_folder = 'assets/imgs',
        img_name_func = function()
          return string.format('Pasted image %s', os.date '%Y%m%d%H%M%S')
        end,
        confirm_img_paste = true,
      },

      -- ===== CALLBACKS =====
      callbacks = {},
    },

    config = function(_, opts)
      require('obsidian').setup(opts)

      -- Additional autocommands or settings
      vim.api.nvim_create_autocmd('BufEnter', {
        pattern = '*.md',
        callback = function()
          -- Set up markdown-specific settings
          vim.opt_local.conceallevel = 2
          vim.opt_local.concealcursor = ''
        end,
      })
    end,
  },
}
