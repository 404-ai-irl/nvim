return {
  {
    'EdenEast/nightfox.nvim',
    colorscheme = { 'carbonfox' },
    opts = {
      options = {
        transparent = true,
        terminal_colors = true,
        colorblind = {
          enable = true,
          severity = {
            protan = 0.3,
            deutan = 0.6,
          },
        },
      },
      groups = {
        all = {
          -- Render Markdown custom highlights for carbonfox
          RenderMarkdownH1Bg = { bg = '#2a2a2a' },
          RenderMarkdownH2Bg = { bg = '#252525' },
          RenderMarkdownH3Bg = { bg = '#232323' },
          RenderMarkdownH4Bg = { bg = '#212121' },
          RenderMarkdownH5Bg = { bg = '#1f1f1f' },
          RenderMarkdownH6Bg = { bg = '#1d1d1d' },
          RenderMarkdownCode = { bg = '#1a1a1a' },
          RenderMarkdownCodeInline = { bg = '#1e1e1e' },
        },
      },
    },
  },
  {
    'jpwol/thorn.nvim',
    lazy = false,
    priority = 1000,
    opts = {},
  },
  {
    'brenoprata10/nvim-highlight-colors',
    event = 'VeryLazy',
    opts = { render = 'virtual', enable_tailwind = true },
  },
}
