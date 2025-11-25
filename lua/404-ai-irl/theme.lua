---@module 'eldritch.config'
require('eldritch').setup {
  transparent = true,
  terminal_colors = true,
  styles = {
    comments = { italic = true },
    keywords = { italic = true },
    functions = { bold = true, italic = true },
    sidebars = 'dark',
    floats = 'dark',
  },
  sidebars = { 'qf', 'help' },
  hide_inactive_statusline = true,
  ---@param colors ColorScheme
  on_colors = function(colors) end,

  ---@param highlights Highlights
  ---@param colors ColorScheme
  on_highlights = function(highlights, colors) end,
}
