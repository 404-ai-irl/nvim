vim.pack.add {
  {
    src = 'https://github.com/dmmulroy/ts-error-translator.nvim',
  },
  {
    src = 'https://github.com/dmmulroy/tsc.nvim',
  },
}

require('tsc').setup {}
require('ts-error-translator').setup {}
