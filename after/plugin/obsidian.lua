-- Obsidian.nvim
require('obsidian').setup {
  workspaces = {
    {
      name = 'Artemis',
      path = '~/documents/Vaults/Artemis/',
    },
  },
  log_level = vim.log.levels.INFO,

  ---@class obsidian.config.DailyNotesOpts
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
    name = 'snacks.pick',
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
  callbacks = {
    enter_note = function(_, note)
      vim.keymap.set('n', '<leader>ch', '<cmd>Obsidian toggle_checkbox<cr>', {
        buffer = note.bufnr,
        desc = 'Toggle checkbox',
      })
    end,
  },
  -- UI is handled by render-markdown
  legacy_commands = false,
  ui = { enable = false },
}

--- Autocommands
-- Format Code Blocks
vim.api.nvim_create_autocmd('User', {
  pattern = 'ObsidianNoteWritePost',
  callback = function(ev)
    require('conform').format {
      bufnr = ev.buf,
      formatters = { 'prettier', 'injected' },
    }
  end,
})

--- Keymaps
-- Global Keymaps
local wk = require 'which-key'
wk.add {
  { '<leader>o', group = 'Obsidian', icon = '🪬' },

  -- Note Creation
  { '<leader>on', group = 'New', icon = '📝' },
  { '<leader>onn', '<CMD>Obsidian new<CR>', desc = 'New Note' },
  { '<leader>ont', '<CMD>Obsidian new_from_template<CR>', desc = 'New from Template' },
  { '<leader>onl', '<CMD>Obsidian link_new<CR>', desc = 'Link New Note' },
  { '<leader>one', '<CMD>Obsidian extract_note<CR>', desc = 'Extract to New Note' },

  -- Navigation
  { '<leader>og', group = 'Go/Navigate', icon = '🧭' },
  { '<leader>ogs', '<CMD>Obsidian quick_switch<CR>', desc = 'Quick Switch' },
  { '<leader>ogf', '<CMD>Obsidian follow_link<CR>', desc = 'Follow Link' },
  { '<leader>ogb', '<CMD>Obsidian backlinks<CR>', desc = 'Backlinks' },
  { '<leader>ogl', '<CMD>Obsidian links<CR>', desc = 'Links in Buffer' },
  { '<leader>ogo', '<CMD>Obsidian open<CR>', desc = 'Open in Obsidian App' },

  -- Daily Notes
  { '<leader>od', group = 'Daily', icon = '📅' },
  { '<leader>odd', '<CMD>Obsidian today<CR>', desc = 'Today' },
  { '<leader>ody', '<CMD>Obsidian yesterday<CR>', desc = 'Yesterday' },
  { '<leader>odt', '<CMD>Obsidian tomorrow<CR>', desc = 'Tomorrow' },
  { '<leader>odl', '<CMD>Obsidian dailies<CR>', desc = 'List Dailies' },

  -- Search & Tags
  { '<leader>os', group = 'Search', icon = '🔍' },
  { '<leader>oss', '<CMD>Obsidian search<CR>', desc = 'Search Notes' },
  { '<leader>ost', '<CMD>Obsidian tags<CR>', desc = 'Search by Tags' },

  -- Utilities
  { '<leader>ou', group = 'Utilities', icon = '🔧' },
  { '<leader>our', '<CMD>Obsidian rename<CR>', desc = 'Rename Note' },
  { '<leader>out', '<CMD>Obsidian template<CR>', desc = 'Insert Template' },
  { '<leader>oui', '<CMD>Obsidian paste_img<CR>', desc = 'Paste Image' },
  { '<leader>ouw', '<CMD>Obsidian workspace<CR>', desc = 'Switch Workspace' },
}

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
