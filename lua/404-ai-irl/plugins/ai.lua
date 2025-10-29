return {
  ---@module  "sidekick"
  {
    'folke/sidekick.nvim',
    ---@module 'sidekick.config'
    opts = {
      cli = {
        tools = {
          claude = { cmd = { 'claude' } },
          opencode = {
            cmd = { 'opencode' },
            env = { OPENCODE_THEME = 'system' },
          },
        },
        nes = {},
        mux = {
          backend = 'tmux',
          enabled = true,
        },
      },
    },
    keys = {
      {
        '<leader>aa',
        function()
          require('sidekick.cli').toggle()
        end,
        desc = 'Toggle AI CLI',
      },
      {
        '<leader>ac',
        function()
          require('sidekick.cli').toggle 'claude'
        end,
        desc = 'Toggle Claude CLI',
      },
      {
        '<leader>ao',
        function()
          require('sidekick.cli').toggle 'opencode'
        end,
        desc = 'Toggle OpenCode CLI',
      },
    },
  },
}
