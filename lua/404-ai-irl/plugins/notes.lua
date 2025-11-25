local markdown_config = require '404-ai-irl.configs.markdown'

return {
  { --- Obsidian.nvim
    'obsidian-nvim/obsidian.nvim',
    version = '*',
    ft = 'markdown',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        -- docx type keymaps for formatting
        'antonk52/markdowny.nvim',
        filetype = { 'markdown', 'text' },
        opts = {},
      },
      { -- excalidraw integration
        'marcocofano/excalidraw.nvim',
        config = function()
          require('excalidraw').setup {
            storage_dir = '~/documents/notes/.excalidraw',
            templates_dir = '~/documents/notes/.excalidraw/templates',
            open_on_create = true,
            relative_path = true,
            picker = {
              link_scene_mapping = '<C-l>',
            },
          }
        end,
      },
      { -- Treesitter syntax in .md files
        'jmbuhr/otter.nvim',
        opts = {},
      },
    },
    opts = markdown_config.obsidian_opts,
  },
  { -- Render Markdown Plugin
    'MeanderingProgrammer/render-markdown.nvim',
    opts = markdown_config.render_markdown_opts,
  },
}
