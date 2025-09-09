---@diagnostic disable-next-line
require('claudecode').setup {
  auto_start = true,
  connection_timeout = 99,
  connection_wait_delay = 200,
  log_level = 'info',
}

local wk = require 'which-key'
wk.add {
  { '<leader>a', group = 'Claude', desc = 'AI' },
  { '<leader>ac', '<cmd>ClaudeCode<cr>', desc = 'Toggle Claude' },
  { '<leader>af', '<cmd>ClaudeCodeFocus<cr>', desc = 'Focus Claude' },
  { '<leader>ar', '<cmd>ClaudeCode --resume<cr>', desc = 'Resume Claude' },
  { '<leader>aC', '<cmd>ClaudeCode --continue<cr>', desc = 'Continue Claude' },
  { '<leader>am', '<cmd>ClaudeCodeSelectModel<cr>', desc = 'Select Claude model' },
  { '<leader>ab', '<cmd>ClaudeCodeAdd %<cr>', desc = 'Add current buffer' },
  { '<leader>as', '<cmd>ClaudeCodeSend<cr>', mode = 'v', desc = 'Send to Claude' },
  { '<leader>aa', '<cmd>ClaudeCodeDiffAccept<cr>', desc = 'Accept diff' },
  { '<leader>ad', '<cmd>ClaudeCodeDiffDeny<cr>', desc = 'Deny diff' },
}
