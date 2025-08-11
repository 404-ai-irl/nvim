--- Needed by other plugins
vim.pack.add {
  {
    src = 'https://github.com/nvim-lua/plenary.nvim',
  },
  {
    src = 'https://github.com/MunifTanjim/nui.nvim',
  },
  {
    src = 'https://github.com/rcarriga/nvim-notify',
  },
  {
    src = 'https://github.com/nvim-tree/nvim-web-devicons',
  },
}


vim.notify = require 'notify'
