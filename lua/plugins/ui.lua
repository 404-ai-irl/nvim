return {
  {"j-hui/fidget.nvim"},
  {"rebelot/kanagawa.nvim", opts = {
compile = true,
  undercurl = false,
  commentStyle = { italic = true },
  functionStyle = {},
  keywordStyle = { italic = true },
  statementStyle = { bold = true },
  typeStyle = { italic = true },
  transparent = true,
  dimInactive = true,
  terminalColors = true,
  colors = {
    palette = {},
    theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
  },
  background = {
    dark = 'dragon',
    light = 'lotus',
  },
  },
},
{
  "shellRaining/hlchunk.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("hlchunk").setup({chunk = {
        enable = true,
        use_treesitter = true,
      },
      line_num = {
        enable = false,
        style = { fg = 'Background' },
      }})
  end
  }
}
