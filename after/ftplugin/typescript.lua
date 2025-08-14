require('ts-error-translator').setup {
  auto_override_publish_diagnostics = true,
}
require('tsc').setup { use_diagnostics = true, auto_start_watch_mode = true }
local translate = require('ts-error-translator').translate_diagnostics
require('typescript-tools').setup {
  handlers = {
    ['textDocument/publishDiagnostics'] = function(err, result, ctx)
      translate(err, result, ctx)
      vim.lsp.diagnostic.on_publish_diagnostics(err, result, ctx)
    end,
  },
}

