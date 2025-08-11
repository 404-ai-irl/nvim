vim.pack.add {
  { 
    src = 'https://github.com/folke/noice.nvim',
    depends = { 'MunifTanjim/nui.nvim' }
  },
  { src = 'https://github.com/rcarriga/nvim-notify' },
}

require('notify').setup {
  background_colour = '#000000',
  render = 'wrapped-compact',
  timeout = 3000,
  top_down = false,
}

vim.notify = require('notify')

require('noice').setup {
  lsp = {
    override = {
      ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
      ['vim.lsp.util.stylize_markdown'] = true,
    },
  },
  presets = {
    bottom_search = false,
    command_palette = true,
    long_message_to_split = true,
    inc_rename = false,
    lsp_doc_border = true,
  },
  routes = {
    {
      view = 'notify',
      filter = { event = 'msg_showmode' },
    },
  },
}