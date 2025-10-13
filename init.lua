-- Build command registry
local build_registry = {}

-- Global build function for plugins
function BuildPlugin(plugin_name, build_func)
  local plugin_path = vim.fn.stdpath 'data' .. '/site/pack/core/opt/' .. plugin_name
  local build_cmd = build_func:match '^(%S+)'

  if vim.fn.isdirectory(plugin_path) == 1 and vim.fn.executable(build_cmd) == 1 then
    vim.notify('Building ' .. plugin_name .. '...')
    local result = vim.fn.system('cd ' .. plugin_path .. ' && ' .. build_func)
    if vim.v.shell_error == 0 then
      vim.notify('Build completed for ' .. plugin_name)
    else
      vim.notify('Build failed for ' .. plugin_name .. ': ' .. result, vim.log.levels.ERROR)
    end
  else
    if vim.fn.isdirectory(plugin_path) == 0 then
      vim.notify('Plugin directory not found: ' .. plugin_path, vim.log.levels.WARN)
    elseif vim.fn.executable(build_cmd) == 0 then
      vim.notify('Build command not executable: ' .. build_cmd, vim.log.levels.WARN)
    end
  end
end

function Add(specs) -- Global function to add plugins
  specs = vim
    .iter(specs)
    :map(function(s)
      local spec = type(s) == 'string' and { src = s } or s
      if not spec.src:match '^https?' and not spec.src:match '^/' then
        spec.src = 'https://github.com/' .. spec.src
      end

      -- Store build command if provided
      if spec.build then
        local plugin_name = spec.name or spec.src:match('([^/]+)$'):gsub('%.git$', '')
        build_registry[plugin_name] = spec.build
        -- Remove build from spec as vim.pack.add doesn't understand it
        local clean_spec = vim.deepcopy(spec)
        clean_spec.build = nil
        return clean_spec
      end

      return spec
    end)
    :totable()
  vim.pack.add(specs)
end

-- Autocmd to automatically build plugins when installed or updated
vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(event)
    if event.data.kind == 'install' or event.data.kind == 'update' then
      local plugin_name

      -- Extract plugin name from path or spec
      if event.data.path then
        plugin_name = vim.fn.fnamemodify(event.data.path, ':t')
      elseif event.data.spec and event.data.spec.src then
        plugin_name = event.data.spec.name or event.data.spec.src:match('([^/]+)$'):gsub('%.git$', '')
      end

      -- Check if we have a build command for this plugin
      if plugin_name and build_registry[plugin_name] then
        vim.schedule(function()
          vim.notify('Auto-building ' .. plugin_name .. ' after ' .. event.data.kind .. '...')
          BuildPlugin(plugin_name, build_registry[plugin_name])
        end)
      end
    end
  end,
})

-- Manual build command
vim.api.nvim_create_user_command('Build', function(opts)
  local args = vim.split(opts.args, ' ', { trimempty = true })
  local plugin_name = args[1]

  if not plugin_name then
    vim.notify('Usage: :Build <plugin_name> [build_command]', vim.log.levels.ERROR)
    return
  end

  -- If build command provided, use it directly
  if #args > 1 then
    local build_cmd = table.concat(vim.list_slice(args, 2), ' ')
    BuildPlugin(plugin_name, build_cmd)
    return
  end

  -- Check if plugin has registered build command
  if build_registry[plugin_name] then
    BuildPlugin(plugin_name, build_registry[plugin_name])
    return
  end

  -- Prompt user for build command
  vim.ui.input({
    prompt = 'Build command for ' .. plugin_name .. ': ',
    default = 'make',
  }, function(build_cmd)
    if build_cmd and build_cmd ~= '' then
      BuildPlugin(plugin_name, build_cmd)
    else
      vim.notify('Build cancelled', vim.log.levels.INFO)
    end
  end)
end, {
  nargs = '+',
  desc = 'Build a plugin manually',
  complete = function()
    -- Auto-complete with plugin names from registry
    local plugins = {}
    for name, _ in pairs(build_registry) do
      table.insert(plugins, name)
    end
    return plugins
  end,
})

Add {
  -- dependencies
  { src = 'nvim-lua/plenary.nvim' },
  { src = 'MunifTanjim/nui.nvim' },
  -- core
  { src = 'neovim/nvim-lspconfig' },
  { src = 'williamboman/mason.nvim' },
  { src = 'williamboman/mason-lspconfig.nvim' },
  { src = 'stevearc/conform.nvim' },
  { src = 'mfussenegger/nvim-lint' },
  { src = 'monaqa/dial.nvim' },
  -- AI
  { src = 'yetone/avante.nvim', build = 'make', version = 'main' },
  { src = 'HakonHarnes/img-clip.nvim' },
  { src = 'zbirenbaum/copilot.lua' },
  { src = 'HakonHarnes/img-clip.nvim' },
  { src = 'zbirenbaum/copilot.lua' },
  -- QoL
  { src = 'folke/which-key.nvim' },
  { src = 'folke/snacks.nvim' },
  -- Treesitter
  { src = 'nvim-treesitter/nvim-treesitter', version = 'master' },
  { src = 'nvim-treesitter/nvim-treesitter-context' },
  { src = 'nvim-treesitter/nvim-treesitter-textobjects' },
  { src = 'windwp/nvim-ts-autotag' },
  --- File Explorers
  { src = 'nvim-telescope/telescope.nvim' },
  { src = 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  { src = 'nvim-telescope/telescope-symbols.nvim' },
  { src = 'stevearc/oil.nvim' },
  { src = 'JezerM/oil-lsp-diagnostics.nvim' },
  --- UI
  { src = 'nvim-tree/nvim-web-devicons' },
  { src = 'akinsho/bufferline.nvim' },
  { src = 'lewis6991/hover.nvim' },
  { src = 'j-hui/fidget.nvim' },
  { src = 'rebelot/kanagawa.nvim' },
  { src = 'shellRaining/hlchunk.nvim' },
  { src = 'NMAC427/guess-indent.nvim' },
  { src = 'obsidian-nvim/obsidian.nvim' },
  -- { src = 'MeanderingProgrammer/render-markdown.nvim' },
  { src = 'OXY2DEV/markview.nvim' },
  { src = 'alex-popov-tech/store.nvim' },
  --- Extras
  { src = 'gruvw/strudel.nvim', build = 'npm install' },
  --- DB Management
  { src = 'tpope/vim-dadbod' },
  { src = 'kristijanhusak/vim-dadbod-ui' },
  { src = 'kristijanhusak/vim-dadbod-completion' },
}

vim.schedule(function()
  vim.cmd.colorscheme 'kanagawa-dragon'
end)

require '404-ai-irl'
