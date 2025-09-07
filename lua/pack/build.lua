--- Smart build function for plugins
function ensure_plugins_built()
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
  local blink_cmp_target = blink_cmp_path .. '/target/release'
  if vim.fn.isdirectory(blink_cmp_path) == 1 and vim.fn.isdirectory(blink_cmp_target) == 0 then
    if vim.fn.executable 'cargo' == 1 then
      print 'Building blink.cmp...'
      vim.fn.system('cd ' .. blink_cmp_path .. ' && cargo build --release')
    end
  end

  -- Check blink.nvim (uses cargo)
  local blink_nvim_path = data_path .. '/site/pack/core/opt/blink.nvim'
  local blink_nvim_target = blink_nvim_path .. '/target/release'
  if vim.fn.isdirectory(blink_nvim_path) == 1 and vim.fn.isdirectory(blink_nvim_target) == 0 then
    if vim.fn.executable 'cargo' == 1 then
      print 'Building blink.nvim...'
      vim.fn.system('cd ' .. blink_nvim_path .. ' && cargo build --release')
    end
  end

  -- Check LuaSnip jsregexp
  local luasnip_path = data_path .. '/site/pack/core/opt/LuaSnip'
  local jsregexp_lib = luasnip_path .. '/deps/jsregexp/jsregexp.so'
  if vim.fn.isdirectory(luasnip_path) == 1 and vim.fn.filereadable(jsregexp_lib) == 0 then
    if vim.fn.executable 'make' == 1 then
      print 'Building LuaSnip jsregexp...'
      vim.fn.system('cd ' .. luasnip_path .. ' && make install_jsregexp')
    end
  end
end

return ensure_plugins_built()
