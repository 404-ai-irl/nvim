-- JavaScript-specific settings to work with TypeScript tooling

-- TypeScript error translation also works for JavaScript
require('ts-error-translator').setup {
  auto_override_publish_diagnostics = true,
}

-- JavaScript-specific file extensions
vim.opt_local.suffixesadd:prepend('.js,.jsx,.mjs')
vim.opt_local.include = [[\v<((import|export)\s+)@<=[^"']+|((import|export)(\s+\*\s+as\s+\w+\s+)?from\s+)@<=["'][^"']+]]