-- JavaScript React (.jsx) specific settings

-- TypeScript error translation also works for JavaScript React
require('ts-error-translator').setup {
  auto_override_publish_diagnostics = true,
}

-- JavaScript React specific file extensions  
vim.opt_local.suffixesadd:prepend('.jsx,.js,.tsx,.ts')
vim.opt_local.include = [[\v<((import|export)\s+)@<=[^"']+|((import|export)(\s+\*\s+as\s+\w+\s+)?from\s+)@<=["'][^"']+]]