return {
  'catgoose/nvim-colorizer.lua',
  event = 'BufReadPre',
  opts = {
    filetypes = { '*' },
    buftypes = {},
    lazy_load = false,
    css = true,
    css_fn = true,
    sass = {
      enable = true,
      parsers = { 'css' },
    },
    always_update = true,
  },
}
