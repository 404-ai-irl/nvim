local markdown_config = require '404-ai-irl.configs.markdown'

return {
  { -- Render Markdown Plugin
    'MeanderingProgrammer/render-markdown.nvim',
    opts = markdown_config.render_markdown_opts,
  },
}
