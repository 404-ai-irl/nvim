return {
  {
    'olimorris/codecompanion.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
      'ravitemer/mcphub.nvim',
    },
    opts = {
      extensions = {
        mcphub = {
          callback = 'mcphub.extensions.codecompanion',
          opts = {
            make_vars = true,
            make_slash_commands = true,
            show_result_in_chat = true,
          },
        },
      },
      -- NOTE: The log_level is in `opts.opts`
      opts = {
        log_level = 'DEBUG', -- or "TRACE"
      },
    },
  },
  -- {
  --   'yetone/avante.nvim',
  --   build = 'make',
  --   event = 'VeryLazy',
  --   version = false,
  --   dependencies = {
  --     'nvim-treesitter/nvim-treesitter',
  --     'nvim-lua/plenary.nvim',
  --     'MunifTanjim/nui.nvim',
  --     'folke/snacks.nvim',
  --     {
  --       'MeanderingProgrammer/render-markdown.nvim',
  --       opts = {
  --         file_types = { 'markdown', 'Avante' },
  --       },
  --       ft = { 'markdown', 'Avante' },
  --     },
  --   },
  --   opts = {
  --     provider = {
  --       openai = {
  --         endpoint = 'https://openrouter.ai/api/v1/chat/completions',
  --         model = 'anthropic/claude-4.5-sonnet',
  --         api_key_name = 'OPENROUTER_API_KEY',
  --         timeout = 30000,
  --         extra_request_body = {
  --           temperature = 0,
  --           max_tokens = 4096,
  --         },
  --       },
  --       input = {
  --         provider = 'snacks',
  --         provider_opts = {
  --           title = 'Avante Input',
  --           icon = ' ',
  --         },
  --       },
  --       selector = {
  --         provider = 'snacks',
  --       },
  --     },
  --   },
  -- },
  {
    'folke/sidekick.nvim',
    opts = {
      cli = {
        tools = {
          claude = { cmd = { "claude-code" } },
          opencode = { 
            cmd = { "opencode" },
            env = { OPENCODE_THEME = "system" }
          },
        },
        mux = {
          backend = "tmux",
          enabled = true
        }
      }
    },
    keys = {
      {
        "<leader>aa", 
        function() require("sidekick.cli").toggle() end,
        desc = "Toggle AI CLI"
      },
      {
        "<leader>ac", 
        function() require("sidekick.cli").toggle("claude") end,
        desc = "Toggle Claude CLI"
      },
      {
        "<leader>ao", 
        function() require("sidekick.cli").toggle("opencode") end,
        desc = "Toggle OpenCode CLI"
      }
    }
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
