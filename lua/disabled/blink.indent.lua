return {
  'saghen/blink.indent',
  --- @module 'blink.indent'
  --- @type blink.indent.Config
  opts = {
    -- disabled for certain filetypes
    blocked = {
      buftypes = {},
      filetypes = {},
    },
    static = {
      enabled = false,
      char = '│ ',
      priority = 1,
      highlights = { 'BlinkIndent' },
    },
    scope = {
      enabled = true,
      char = '│ ',
      priority = 2,
      highlights = {
        -- 'BlinkIndentRed',
        -- 'BlinkIndentYellow',
        'BlinkIndentBlue',
        -- 'BlinkIndentOrange',
        'BlinkIndentGreen',
        'BlinkIndentViolet',
        'BlinkIndentCyan',
      },
      underline = {
        -- enable to show underlines on the line above the current scope
        enabled = true,
        highlights = {
          -- 'BlinkIndentRedUnderline',
          -- 'BlinkIndentYellowUnderline',
          'BlinkIndentBlueUnderline',
          'BlinkIndentOrangeUnderline',
          -- 'BlinkIndentGreenUnderline',
          -- 'BlinkIndentVioletUnderline',
          'BlinkIndentCyanUnderline',
        },
      },
    },
  },
}
