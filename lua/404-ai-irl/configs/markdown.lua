-- Markdown rendering configuration
local M = {}

M.render_markdown_opts = {
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

  bullet = {
    enabled = true,
    icons = { '•', '◦', '▪', '▫' }, -- Simple, clean bullets
    left_pad = 0,
    right_pad = 1,
    highlight = 'RenderMarkdownBullet',
  },

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

  quote = {
    enabled = true,
    icon = '│', -- Clean vertical line
    repeat_linebreak = false,
    highlight = 'RenderMarkdownQuote',
  },

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

  completions = {
    blink = { enabled = true },
  },

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
}

M.obsidian_opts = {
  legacy_commands = false,
  workspaces = {
    {
      name = 'tt.ai',
      path = '~/documents/notes/tt.ai/',
    },
    {
      name = 'dev',
      path = '~/documents/notes/dev/',
    },
    {
      name = 'life',
      path = '~/documents/notes/life',
    },
  },
  picker = {
    name = 'snacks.pick',
    note_mappings = {
      -- new = '<C-x>',
      -- insert_link = '<C-l>',
    },
    tag_mappings = {
      -- tag_note = '<C-x>',
      -- insert_tag = '<C-l>',
    },
  },
  ui = {
    enable = false,
    ignore_conceal_warn = true,
  },
  attachments = {
    img_folder = 'images',
    img_name_func = function()
      return string.format('Pasted image %s', os.date '%Y%m%d%H%M%S')
    end,
    confirm_img_paste = false,
  },
  completion = { blink = true, min_chars = 2, create_new = true },
}

return M
