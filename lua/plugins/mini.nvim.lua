return {
  {
    { 'nvim-mini/mini.ai', opts = {} },
    { 'nvim-mini/mini.surround', opts = {} },
    { 'nvim-mini/mini.comment', opts = {} },
    { 'nvim-mini/mini.statusline', opts = {} },
    { 'nvim-mini/mini.icons', opts = {} },
    { 'nvim-mini/mini.animate', opts = {} },
    {
      'nvim-mini/mini.diff',
      config = function()
        local diff = require 'mini.diff'
        diff.setup {
          source = diff.gen_source.none(),
        }
      end,
    },
  },
}
