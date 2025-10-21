local nf = require 'nightfox'
nf.setup {
  options = {
    options = {
      colorblind = {
        enable = true,
        severity = {
          protan = 0.3,
          deutan = 0.6,
        },
      },
    },
  },
}
nf.compile()
vim.cmd 'colorscheme carbonfox'
