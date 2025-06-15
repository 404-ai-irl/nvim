return {
  -- NF Icons
  {
    '2kabhishek/nerdy.nvim',
    dependencies = {
      'folke/snacks.nvim',
    },
    cmd = 'Nerdy',
    config = function()
      vim.keymap.set('n', '<leader>si', function()
        require('telescope').extensions.nerdy.nerdy()
      end, { desc = '[S]each Nerd [I]cons' })
    end,
  },
  -- Emojis
  {
    'allaman/emoji.nvim',
    version = '1.0.0', -- optionally pin to a tag
    ft = 'markdown', -- adjust to your needs
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
    },
    opts = {
      enable_cmp_integration = true,
    },
    config = function(_, opts)
      require('emoji').setup(opts)
      local ts = require('telescope').load_extension 'emoji'
      vim.keymap.set('n', '<leader>se', ts.emoji, { desc = '[S]earch [E]moji' })
    end,
  },
}
