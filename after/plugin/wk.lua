local wk = require 'which-key'
---@type wk.Opts
local options = {
  preset = 'modern',
  delay = function(ctx)
    return ctx.operator and 0 or 200
  end,
  expand = 2, -- Reduce expand to avoid clutter
  notify = true,
  replace = {
    key = {
      { '<Space>', 'SPACE' },
      { '<cr>', 'RET' },
      { '<tab>', 'TAB' },
      { '<BS>', 'BSPC' },
    },
  },
  icons = {
    breadcrumb = '»', -- symbol used in the command line area that shows your active key combo
    separator = '-', -- symbol used between a key and it's label
    goup = '+', -- symbol prepended to a group
  },
  spec = {
    -- Core groups
    { '<leader>g', group = 'Git', icon = '󰊢' },
    { '<leader>t', group = 'Trouble', icon = '󱖫' },
    { '<leader>l', group = 'Diagnostics', icon = '󰒡' },
  },
}

wk.setup { options }
wk.add {
  {
    '<leader>q',
    function()
      vim.cmd 'bdelete'
    end,
    desc = '󰅖 Delete buffer',
  },
  -- Diagnostics mappings
  {
    '<leader>ln',
    function()
      vim.diagnostic.get_next()
    end,
    desc = '󰒭 Next diagnostic',
  },
  {
    '<leader>lp',
    function()
      vim.diagnostic.get_prev()
    end,
    desc = '󰒮 Previous diagnostic',
  },
  {
    '<leader>e',
    function()
      vim.diagnostic.open_float()
    end,
    desc = '󰙵 Open diagnostic float',
  },
  {
    '<leader>lo',
    function()
      vim.diagnostic.open_float()
    end,
    desc = '󰙵 Open diagnostic float',
  },
  {
    '<leader>ll',
    function()
      vim.diagnostic.setloclist()
    end,
    desc = '󰙵 Diagnostics to loclist',
  },
  {
    '<leader>lq',
    function()
      vim.diagnostic.setqflist()
    end,
    desc = '󰙵 Diagnostics to quickfix',
  },
  {
    '<leader>lt',
    function()
      vim.diagnostic.config {
        virtual_text = not vim.diagnostic.config().virtual_text,
      }
    end,
    desc = '󰙵 Toggle virtual text',
  },
  {
    '<leader>ls',
    function()
      vim.diagnostic.config {
        signs = not vim.diagnostic.config().signs,
      }
    end,
    desc = '󰙵 Toggle signs',
  },
  {
    '<leader>la',
    function()
      local actions = vim.lsp.buf.code_action()
      if not actions or #actions == 0 then
        vim.notify('No code actions available', vim.log.levels.INFO)
        return
      end
      
      -- Filter out disabled actions
      local available_actions = {}
      for _, action in ipairs(actions) do
        if not action.disabled then
          table.insert(available_actions, action)
        end
      end
      
      if #available_actions == 0 then
        vim.notify('No enabled code actions available', vim.log.levels.INFO)
        return
      end
      
      vim.ui.select(available_actions, {
        prompt = 'Code Actions:',
        format_item = function(action)
          return action.title
        end,
      }, function(selected_action)
        if selected_action then
          vim.lsp.buf.execute_command(selected_action.command)
        end
      end)
    end,
    desc = '󰌶 Code actions',
  },
}
