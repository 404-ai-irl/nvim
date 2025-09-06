local add = function(specs)
  specs = vim
    .iter(specs)
    :map(function(s)
      local spec = type(s) == 'string' and { src = s } or s
      if not spec.src:match '^https?' and not spec.src:match '^/' then
        spec.src = 'https://github.com/' .. spec.src
      end
      return spec
    end)
    :totable()
  vim.pack.add(specs)
end

--- TODO Complete plugin updates
add {
  ---TODO Testing
  { src = 'nvimtools/hydra.nvim' },
  { src = 'lewis6991/hover.nvim' },
  { src = 'jbyuki/venn.nvim' },
  -- Vim Pack Mods, pick one?
  --- NOTE need setup
  { src = 'L3MON4D3/LuaSnip' },
  { src = 'rafamadriz/friendly-snippets' },
  --- NOTE configuration review
  { src = 'coder/claudecode.nvim' },
  { src = 'onsails/lspkind.nvim' },
  { src = 'alexandre-abrioux/blink-cmp-npm.nvim' },
  --- depricating
  { src = 'folke/snacks.nvim' }, -- TODO depricated
  { src = 'folke/which-key.nvim' }, -- mini.hint?
  { src = 'sschleemilch/slimline.nvim' }, -- lualine or custom?
  { src = 'akinsho/bufferline.nvim', version = vim.version.range '*' }, --bloat?
}

add {
  { src = 'adriankarlen/plugin-view.nvim' }, -- Plugin updates
  { src = 'folke/lazydev.nvim' }, -- Lua development
  { src = 'stevearc/conform.nvim' }, -- Formatting
  { src = 'mfussenegger/nvim-lint' }, -- Linting
  { src = 'tpope/vim-fugitive' }, -- Git
  -- Lsp
  { src = 'neovim/nvim-lspconfig' },
  { src = 'williamboman/mason.nvim' },
  { src = 'williamboman/mason-lspconfig.nvim' },
  -- Mini
  { src = 'echasnovski/mini.ai' },
  { src = 'echasnovski/mini.surround' },
  -- Blink
  { src = 'Saghen/blink.cmp' },
  { src = 'Saghen/blink.nvim' },
  -- Treesitter
  { src = 'nvim-treesitter/nvim-treesitter', version = 'master' },
  { src = 'nvim-treesitter/nvim-treesitter-context' },
  { src = 'nvim-treesitter/nvim-treesitter-textobjects' },
  { src = 'JoosepAlviste/nvim-ts-context-commentstring' },
  { src = 'windwp/nvim-ts-autotag' },
  --- Telescope
  { src = 'nvim-telescope/telescope.nvim' },
  { src = 'nvim-telescope/telescope-fzf-native.nvim' },
  { src = 'MahanRahmati/blink-nerdfont.nvim' },
  --- UI
  { src = 'nvim-tree/nvim-web-devicons' },
  { src = 'j-hui/fidget.nvim' },
  { src = 'rebelot/kanagawa.nvim' },
  { src = 'shellRaining/hlchunk.nvim' },
  { src = 'NMAC427/guess-indent.nvim' },
  { src = 'numToStr/Comment.nvim' },
  --- Extras
  { src = 'stevearc/oil.nvim' },
  { src = 'JezerM/oil-lsp-diagnostics.nvim' },
  { src = 'monaqa/dial.nvim' },
  { src = 'tpope/vim-dadbod' },
  { src = 'kristijanhusak/vim-dadbod-ui' },
  { src = 'kristijanhusak/vim-dadbod-completion' },
  { src = 'MeanderingProgrammer/render-markdown.nvim' },
  -- Dependencies
  { src = 'nvim-lua/plenary.nvim' },
  { src = 'rcarriga/nvim-notify' },
  { src = 'MunifTanjim/nui.nvim' },
}

--- Smart build function for plugins
function Ensure_plugins_built()
  local data_path = vim.fn.stdpath 'data'

  -- Check telescope-fzf-native
  local fzf_path = data_path .. '/site/pack/core/opt/telescope-fzf-native.nvim'
  local fzf_lib = fzf_path .. '/build/libfzf.so'
  if vim.fn.isdirectory(fzf_path) == 1 and vim.fn.filereadable(fzf_lib) == 0 then
    print 'Building telescope-fzf-native...'
    vim.fn.system('make -C ' .. fzf_path)
  end

  -- Check blink.cmp (uses cargo)
  local blink_cmp_path = data_path .. '/site/pack/core/opt/blink.cmp'
  local blink_target = blink_cmp_path .. '/target/release'
  if vim.fn.isdirectory(blink_cmp_path) == 1 and vim.fn.isdirectory(blink_target) == 0 then
    if vim.fn.executable 'cargo' == 1 then
      print 'Building blink.cmp...'
      vim.fn.system('cd ' .. blink_cmp_path .. ' && cargo build --release')
    end
  end
end
