require 'pack.plugins'
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

  -- Check LuaSnip jsregexp
  local luasnip_path = data_path .. '/site/pack/core/opt/LuaSnip'
  local jsregexp_check = luasnip_path .. '/deps'
  if vim.fn.isdirectory(luasnip_path) == 1 and vim.fn.isdirectory(jsregexp_check) == 0 then
    if vim.fn.executable 'make' == 1 then
      print 'Building LuaSnip jsregexp...'
      vim.fn.system('cd ' .. luasnip_path .. ' && make install_jsregexp')
    end
  end
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

  -- Check LuaSnip jsregexp
  local luasnip_path = data_path .. '/site/pack/core/opt/LuaSnip'
  local jsregexp_check = luasnip_path .. '/deps'
  if vim.fn.isdirectory(luasnip_path) == 1 and vim.fn.isdirectory(jsregexp_check) == 0 then
    if vim.fn.executable 'make' == 1 then
      print 'Building LuaSnip jsregexp...'
      vim.fn.system('cd ' .. luasnip_path .. ' && make install_jsregexp')
    end
  end
end
