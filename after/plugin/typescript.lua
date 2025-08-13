require('ts-error-translator').setup {
  auto_override_publish_diagnostics = true,
}
require('tsc').setup { use_diagnostics = true, auto_start_watch_mode = true }
require('typescript-tools').setup {}
