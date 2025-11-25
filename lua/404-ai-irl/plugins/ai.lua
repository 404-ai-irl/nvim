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
        nes = { enabled = true },
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
      {
        '<leader>ad',
        function()
          require('sidekick.cli').close()
        end,
        desc = 'Detach sesion',
      },
      {
        '<leader>at',
        function()
          require('sidekick.cli').send { msg = '{this}' }
        end,
        mode = { 'x', 'n' },
        desc = 'Send This',
      },
      {
        '<cleader>af',
        function()
          require('sidekick.cli').send { msg = '{file}' }
        end,
        desc = 'Send File',
      },
      {
        '<leader>av',
        function()
          require('sidekick.cli').send { msg = '{selection}' }
        end,
        mode = { 'x' },
        desc = 'Send Visual Selection',
      },
      {
        '<leader>ap',
        function()
          require('sidekick.cli').prompt()
        end,
        mode = { 'n', 'x' },
        desc = 'Sidekick Select Prompt',
      },
    },
  },
}
