require('obsidian').setup {
  -- core
  workspaces = {
    {
      name = 'dev_notes',
      path = '~/documents/notes/dev',
    },
    {
      name = 'tt_ai',
      path = '~/code/tt.ai/notes',
    },
  },
  log_level = vim.log.levels.INFO,
  daily_notes = {
    -- folder = 'notes/dailies',
    -- date_format = '%Y-%m-%d',
    -- alias_format = '%B %-d, %Y',
    default_tags = { 'daily-notes', 'todos' },
    template = nil,
    workdays_only = true,
  },
  completion = {
    nvim_cmp = false,
    blink = true,
    min_chars = 2,
    create_new = true,
  },
  new_notes_location = 'current_dir',
  legacy_commands = false,

  -- Note title,id,link formatting functions
  ---@param title string|?
  ---@return string
  note_id_func = function(title)
    local suffix = ''
    if title ~= nil then
      suffix = title:gsub(' ', '-'):gsub('[^A-Za-z0-9-]', ''):lower()
    else
      -- If title is nil, just add 4 random uppercase letters to the suffix.
      for _ = 1, 4 do
        suffix = suffix .. string.char(math.random(65, 90))
      end
    end
    return tostring(os.time()) .. '-' .. suffix
  end,
  ---@param spec { id: string, dir: obsidian.Path, title: string|? }
  ---@return string|obsidian.Path The full path to the new note.
  note_path_func = function(spec)
    local path = spec.dir / tostring(spec.id)
    return path:with_suffix '.md'
  end,
  wiki_link_func = 'use_alias_only',
  markdown_link_func = function(opts)
    return require('obsidian.util').markdown_link(opts)
  end,
  preferred_link_style = 'wiki',

  -- frontmatter options
  disable_frontmatter = false,
  -- Optional, alternatively you can customize the frontmatter data.
  ---@return table
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

  -- template options
  templates = {
    -- Optional, for templates (see https://github.com/obsidian-nvim/obsidian.nvim/wiki/Using-templates)
    folder = 'templates',
    date_format = '%Y-%m-%d',
    time_format = '%H:%M',
    -- See: https://github.com/obsidian-nvim/obsidian.nvim/wiki/Template#substitutions
    substitutions = {},
    --- See: https://github.com/obsidian-nvim/obsidian.nvim/wiki/Template#customizations
    customizations = {},
  },

  -- opening options
  ---@param url string
  follow_url_func = function(url)
    vim.ui.open(url)
    -- vim.ui.open(url, { cmd = { "firefox" } })
  end,
  -- Sets how you follow images
  ---@param img string
  follow_img_func = function(img)
    vim.ui.open(img)
    -- vim.ui.open(img, { cmd = { "loupe" } })
  end,
  ---@class obsidian.config.OpenOpts
  ---
  ---Opens the file with current line number
  ---@field use_advanced_uri? boolean
  ---
  ---Function to do the opening, default to vim.ui.open
  ---@field func? fun(uri: string)
  open = {
    use_advanced_uri = false,
    func = vim.ui.open,
  },
  -- picker options
  picker = {
    name = 'telescope.nvim',
    note_mappings = {
      new = '<C-x>',
      insert_link = '<C-l>',
    },
    tag_mappings = {
      tag_note = '<C-x>',
      insert_tag = '<C-l>',
    },
  },
  backlinks = {
    parse_headers = true,
  },

  -- search options
  -- Optional, sort search results by "path", "modified", "accessed", or "created".
  -- The recommend value is "modified" and `true` for `sort_reversed`, which means, for example,
  -- that `:Obsidian quick_switch` will show the notes sorted by latest modified time
  sort_by = 'modified',
  sort_reversed = true,
  search_max_lines = 1000,
  open_notes_in = 'current',

  -- callback functions
  callbacks = {
    -- Runs at the end of `require("obsidian").setup()`.
    ---@param client obsidian.Client
    post_setup = function(client) end,
    -- Runs anytime you enter the buffer for a note.
    ---@param client obsidian.Client
    ---@param note obsidian.Note
    enter_note = function(client, note) end,
    -- Runs anytime you leave the buffer for a note.
    ---@param client obsidian.Client
    ---@param note obsidian.Note
    leave_note = function(client, note) end,
    -- Runs right before writing the buffer for a note.
    ---@param client obsidian.Client
    ---@param note obsidian.Note
    pre_write_note = function(client, note) end,
    -- Runs anytime the workspace is set/changed.
    ---@param workspace obsidian.Workspace
    post_set_workspace = function(workspace) end,
  },

  -- ui (disabled)
  ui = {
    enable = false, -- set to false to disable all additional syntax features
  },

  -- attachements
  attachments = {
    img_folder = 'assets/imgs',
    img_name_func = function()
      return string.format('Pasted image %s', os.date '%Y%m%d%H%M%S')
    end,
    confirm_img_paste = true,
  },

  -- footer options
  footer = {
    enabled = true,
    format = '{{backlinks}} backlinks  {{properties}} properties  {{words}} words  {{chars}} chars',
    hl_group = 'Comment',
    separator = string.rep('-', 80),
  },
  ---@class obsidian.config.CheckboxOpts
  checkbox = {
    order = { ' ', '~', '!', '>', 'x' },
  },
}

-- render md
require('render-markdown').setup {
  enabled = true,
  latex = { enabled = false },
  completions = { blink = { enabled = true } },
  max_file_size = 10.0,
  debounce = 100,
  render_modes = { 'n', 'c', 't' },
  anti_conceal = {
    enabled = true,
    ignore = {
      code_background = true,
      sign = true,
    },
  },
  heading = {
    enabled = true,
    sign = true,
    position = 'overlay',
    icons = { '󰲡 ', '󰲣 ', '󰲥 ', '󰲧 ', '󰲩 ', '󰲫 ' },
    signs = { '󰌕 ' },
    width = 'full',
    left_margin = 0,
    left_pad = 0,
    right_pad = 0,
    min_width = 0,
    border = false,
    border_prefix = false,
    above = '▄',
    below = '▀',
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
  paragraph = {
    enabled = true,
    left_margin = 0,
    min_width = 0,
  },
  code = {
    enabled = true,
    sign = true,
    style = 'full',
    position = 'left',
    language_pad = 0,
    disable_background = { 'diff' },
    width = 'full',
    left_margin = 0,
    left_pad = 0,
    right_pad = 0,
    min_width = 0,
    border = 'thin',
    above = '▄',
    below = '▀',
    highlight = 'RenderMarkdownCode',
    highlight_inline = 'RenderMarkdownCodeInline',
  },
  dash = {
    enabled = true,
    icon = '─',
    width = 'full',
    highlight = 'RenderMarkdownDash',
  },
  bullet = {
    enabled = true,
    icons = { '●', '○', '◆', '◇' },
    left_pad = 0,
    right_pad = 0,
    highlight = 'RenderMarkdownBullet',
  },
  checkbox = {
    enabled = true,
    unchecked = {
      icon = '󰄱 ',
      highlight = 'RenderMarkdownUnchecked',
      scope_highlight = nil,
    },
    checked = {
      icon = '󰱒 ',
      highlight = 'RenderMarkdownChecked',
      scope_highlight = nil,
    },
    custom = {
      todo = { raw = '[-]', rendered = '󰥔 ', highlight = 'RenderMarkdownTodo' },
      important = { raw = '[!]', rendered = '󰀦 ', highlight = 'RenderMarkdownError' },
    },
  },
  quote = {
    enabled = true,
    icon = '▋',
    repeat_linebreak = false,
    highlight = 'RenderMarkdownQuote',
  },
  pipe_table = {
    enabled = true,
    preset = 'none',
    style = 'full',
    cell = 'padded',
    padding = 1,
    min_width = 0,
    border = {
      '┌',
      '┬',
      '┐',
      '├',
      '┼',
      '┤',
      '└',
      '┴',
      '┘',
      '│',
      '─',
    },
    alignment_indicator = '━',
    head = 'RenderMarkdownTableHead',
    row = 'RenderMarkdownTableRow',
    filler = 'RenderMarkdownTableFill',
  },
  callout = {
    note = { raw = '[!NOTE]', rendered = '󰋽 Note', highlight = 'RenderMarkdownInfo' },
    tip = { raw = '[!TIP]', rendered = '󰌶 Tip', highlight = 'RenderMarkdownSuccess' },
    important = { raw = '[!IMPORTANT]', rendered = '󰅾 Important', highlight = 'RenderMarkdownHint' },
    warning = { raw = '[!WARNING]', rendered = '󰀪 Warning', highlight = 'RenderMarkdownWarn' },
    caution = { raw = '[!CAUTION]', rendered = '󰳦 Caution', highlight = 'RenderMarkdownError' },
    abstract = { raw = '[!ABSTRACT]', rendered = '󰨸 Abstract', highlight = 'RenderMarkdownInfo' },
    todo = { raw = '[!TODO]', rendered = '󰗡 Todo', highlight = 'RenderMarkdownInfo' },
    success = { raw = '[!SUCCESS]', rendered = '󰄬 Success', highlight = 'RenderMarkdownSuccess' },
    question = { raw = '[!QUESTION]', rendered = '󰘥 Question', highlight = 'RenderMarkdownWarn' },
    failure = { raw = '[!FAILURE]', rendered = '󰅖 Failure', highlight = 'RenderMarkdownError' },
    danger = { raw = '[!DANGER]', rendered = '󱐌 Danger', highlight = 'RenderMarkdownError' },
    bug = { raw = '[!BUG]', rendered = '󰨰 Bug', highlight = 'RenderMarkdownError' },
    example = { raw = '[!EXAMPLE]', rendered = '󰉹 Example', highlight = 'RenderMarkdownHint' },
    quote = { raw = '[!QUOTE]', rendered = '󱆨 Quote', highlight = 'RenderMarkdownQuote' },
  },
  link = {
    enabled = true,
    image = '󰥶 ',
    email = '󰀓 ',
    hyperlink = '󰌹 ',
    highlight = 'RenderMarkdownLink',
    custom = {
      web = { pattern = '^http[s]?://', icon = '󰖟 ', highlight = 'RenderMarkdownLink' },
    },
  },
  sign = {
    enabled = true,
    highlight = 'RenderMarkdownSign',
  },
}
