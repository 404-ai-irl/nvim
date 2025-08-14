-- TypeScript compiler integration
require('tsc').setup { 
  use_diagnostics = true, 
  auto_start_watch_mode = true,
  enable_progress_notifications = true,
  flags = {
    watch = true,
  },
}

-- TypeScript error translation for readable diagnostics  
require('ts-error-translator').setup {
  auto_override_publish_diagnostics = true,
  -- Ensure it works with ts_ls language server
  severity_overrides = {
    -- Make certain TypeScript errors more prominent
    [2307] = vim.diagnostic.severity.ERROR, -- Cannot find module
    [2339] = vim.diagnostic.severity.ERROR, -- Property does not exist
    [2322] = vim.diagnostic.severity.ERROR, -- Type is not assignable
  },
}

-- Additional TypeScript-specific settings
vim.opt_local.suffixesadd:prepend('.ts,.tsx,.d.ts')
vim.opt_local.include = [[\v<((import|export)\s+)@<=[^"']+|((import|export)(\s+\*\s+as\s+\w+\s+)?from\s+)@<=["'][^"']+]]

