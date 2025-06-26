return {
  'sschleemilch/slimline.nvim',
  opts = {
    style = 'fg',
    bold = true,
    components = {
      left = {
        'mode',
        'path',
      },
      center = {
        'diagnostics',
      },
      right = {
        'filetype_lsp',
        'git',
        'progress',
      },
    },

    configs = {
      mode = {
        verbose = false,
        hl = {
          normal = 'Type',
          insert = 'Function',
          pending = 'Boolean',
          visual = 'Keyword',
          command = 'jString',
        },
      },
      path = {
        directory = true, -- Whether to show the directory
        icons = {
          folder = ' ',
          modified = ' ',
          read_only = ' ',
        },
        hl = {
          primary = 'Label',
        },
      },
      git = {
        icons = {
          branch = '󰮠 ',
          added = ' ',
          modified = ' ',
          removed = '',
        },
      },
      diagnostics = {
        workspace = false,
        icons = {
          ERROR = '󰯇 ',
          WARN = ' ',
          HINT = '󱐋 ',
          INFO = ' ',
        },
      },
      filetype_lsp = {},
      progress = {
        follow = 'mode',
        column = false, -- Enables a secondary section with the cursor column
        icon = '󰺾 ',
      },
      recording = {
        icon = ' ',
      },
    },

    -- Spacing configuration
    spaces = {
      components = ' ', -- string between components
      left = ' ', -- string at the start of the line
      right = ' ', -- string at the end of the line
    },

    -- Seperator configuartion
    sep = {
      hide = {
        first = false, -- hides the first separator of the line
        last = false, -- hides the last separator of the line
      },
      left = '', -- left separator of components
      right = '', -- right separator of components
    },

    -- Global highlights
    hl = {
      base = 'Normal', -- highlight of the background
      primary = 'Boolean', -- highlight of primary parts (e.g. filename)
      secondary = 'Comment', -- highlight of secondary parts (e.g. filepath)
    },
  },
}
