return {
  {
    'folke/trouble.nvim',
    cmd = 'Trouble',
    opts = {
      modes = {
        qflist = {
          mode = 'qflist',
          preview = {
            type = 'split',
            relative = 'win',
            position = 'left',
            size = 0.6,
          },
        },
        loclist = {
          mode = 'loclist',
          preview = {
            type = 'split',
            relative = 'win',
            position = 'right',
            size = 0.6,
          },
        },
      },
    },
    keys = {
      { '<leader>xx', '<cmd>Trouble diagnostics toggle<cr>', desc = 'Diagnostics (Trouble)' },
      { '<leader>xX', '<cmd>Trouble diagnostics toggle filter.buf=0<cr>', desc = 'Buffer Diagnostics (Trouble)' },
      { '<leader>xs', '<cmd>Trouble symbols toggle focus=false<cr>', desc = 'Symbols (Trouble)' },
      { '<leader>xl', '<cmd>Trouble lsp toggle focus=false win.position=right<cr>', desc = 'LSP References (Trouble)' },
      { '<leader>xL', '<cmd>Trouble loclist toggle<cr>', desc = 'Location List (Trouble)' },
      { '<leader>xq', '<cmd>Trouble qflist toggle<cr>', desc = 'Quickfix List (Trouble)' },
    },
  },
  {
    'stevearc/quicker.nvim',
    ft = 'qf',
    opts = {
      keys = {
        {
          '>',
          function()
            require('quicker').expand { before = 2, after = 2, add_to_existing = true }
          end,
          desc = 'Expand quickfix context',
        },
        {
          '<',
          function()
            require('quicker').collapse()
          end,
          desc = 'Collapse quickfix context',
        },
      },
      highlight = {
        load_buffers = false,
      },
      opts = {
        number = true,
        relativenumber = false,
        signcolumn = 'auto',
        winfixheight = true,
      },
    },
    init = function()
      vim.api.nvim_create_autocmd('FileType', {
        pattern = 'qf',
        callback = function()
          local buf = vim.api.nvim_get_current_buf()

          vim.keymap.set('n', '<leader>t', function()
            local qf_list = vim.fn.getqflist()
            if #qf_list > 0 then
              vim.cmd 'Trouble qflist toggle'
            else
              vim.notify('Quickfix list is empty', vim.log.levels.WARN)
            end
          end, { buffer = buf, desc = 'Open in Trouble' })

          vim.keymap.set('n', '<leader>T', function()
            local trouble = require 'trouble'
            if trouble.is_open 'qflist' then
              trouble.close 'qflist'
              vim.cmd 'copen'
            else
              vim.cmd 'cclose'
              trouble.open 'qflist'
            end
          end, { buffer = buf, desc = 'Toggle Trouble/Quicker view' })
        end,
      })

      vim.api.nvim_create_autocmd('QuickFixCmdPost', {
        pattern = { 'grep', 'vimgrep', 'helpgrep', 'lgrep', 'lvimgrep' },
        callback = function()
          local qf_list = vim.fn.getqflist()
          if #qf_list > 0 then
            vim.cmd 'copen'
          end
        end,
      })
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
