return {
  {
    'Equilibris/nx.nvim',
    opts = {
      -- See below for config options
      nx_cmd_root = 'npx nx',
    },
    -- Plugin will load when you use these keys
    keys = {
      { '<leader>nx', '<cmd>Snacks.picker(nx actions)<CR>', desc = 'nx actions' },
    },
  },
  {
    'Ripple-TS/ripple',
    config = function(plugin)
      vim.opt.rtp:append(plugin.dir .. '/packages/nvim-plugin')
      require('ripple').setup(plugin)
    end,
  },

  {
    'dmmulroy/ts-error-translator.nvim',
    ft = { 'typescript', 'typescriptreact' },
    config = function()
      require('ts-error-translator').setup()
    end,
  },
}
