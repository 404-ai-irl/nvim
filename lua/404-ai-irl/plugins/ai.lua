return {
  {
    'folke/sidekick.nvim',
    opts = {
      cli = {
        tools = {
          claude = { cmd = { 'claude' } },
          opencode = {
            cmd = { 'opencode' },
            env = { OPENCODE_THEME = 'system' },
          },
        },
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
  {
    'Exafunction/codeium.vim',
    cmd = { 'CodeiumToggle' },
    config = function()
      vim.g.codeium_enabled = false
      vim.keymap.set('n', '<leader><CR>', ':CodeiumToggle<CR>')
    end,
  },
}
