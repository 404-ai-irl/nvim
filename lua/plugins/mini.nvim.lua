-- Plugin: nvim-mini/mini.nvim
-- Installed via store.nvim

return {
  'nvim-mini/mini.nvim',
  version = false,
  config = function()
    -- Text Actions
    require('mini.ai').setup()
    require('mini.surround').setup()
    require('mini.comment').setup()
    -- QoL
    require('mini.bufremove').setup { silent = false }
    require('mini.git').setup()
    require('mini.diff').setup()
    -- UI
    require('mini.icons').setup()
    require('mini.clue').setup()
    require('mini.animate').setup()
    require('mini.statusline').setup()
  end,
}

