---@module 'obsidian'
require('obsidian').setup {
  legacy_commands = false,
  workspaces = {
    { name = 'tt.ai', path = '~/documents/notes/tt.ai' },
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
  ui = {
    enable = false, -- Disable to avoid conflicts with render-markdown.nvim
    ignore_conceal_warn = true,
  },
  attachments = {
    img_folder = 'assets/imgs',
    img_name_func = function()
      return string.format('Pasted image %s', os.date '%Y%m%d%H%M%S')
    end,
    confirm_img_paste = true,
  },
}
