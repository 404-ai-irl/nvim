return {
  'EdenEast/nightfox.nvim',
  priority = 1000,
  config = function()
    ---@diagnostic disable-next-line: missing-fields
    require('nightfox').setup {
      transparent = true,
      colorblind = {
        enable = true,
        simulate_only = false,
        severity = {
          protan = 1,
          deutan = 0,
          tritan = 0,
        },
      },
      styles = {
        comments = 'italic',
        types = 'bold',
      },
      modules = {
        telescope = true,
        fidget = true,
        mini = true,
        lazy = true,
        snacks = true,
      },
    }
    vim.cmd.colorscheme 'carbonfox'
  end,
}
