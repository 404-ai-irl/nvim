return {
  'catgoose/nvim-colorizer.lua',
  event = 'BufReadPre',
  opts = {
    filetypes = { '*' },
    buftypes = {},
    user_commands = true,
    lazy_load = false,
    css = true,
    css_fn = true,
    sass = {
      enable = true,
      parsers = { 'css' },
    },
    always_update = true,
    tailwind = true,
    tailwind_opts = {
      update_names = true,
    },
    mode = 'background',
  },
}
