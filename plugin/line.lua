-- statusline is a format string Neovim evaluates for each window. The active window uses StatusLine highlight group; inactive windows use StatusLineNC. See :h statusline.
-- Core building blocks
--
--     Alignment: %= splits the bar into zones (left | right; add another %= for a middle).
--     Truncation: %< marks where text to its left may be shortened when space is tight.
--     Literals: %% prints a literal %.
--     Expressions: %{...} evaluates an expression.
--     Highlighting: %#Group# switches highlight; %* resets to the default group.
--
-- Common built-ins (quick ref)
--
--     File: %t (tail), %f (relative path), %F (full path), %y (filetype)
--     Flags: %m (modified +), %r (readonly)
--     Position: %l (line), %c (col), %L (total), %p%% (percent)

vim.o.laststatus = 2
Line = {}

-- Active Line
function Line.active()
  return '  %f%= %y %=[%P %l:%v]'
end
-- Inactive Line
function Line.inactive()
  return ' &t'
end

--- Autocmds
local line_group = vim.api.nvim_create_augroup('Line', { clear = true })
-- set active statusline when win/buf focused
vim.api.nvim_create_autocmd({ 'WinEnter', 'BufEnter' }, {
  group = line_group,
  desc = 'Activate statusline on focus',
  callback = function()
    vim.opt_local.statusline = '%!v:lua.Line.active()'
  end,
})
-- set inactive statusline when win/buf unfocused
vim.api.nvim_create_autocmd({ 'WinLeave', 'BufLeave' }, {
  group = line_group,
  desc = 'Deactivate statusline on focus lost',
  callback = function()
    vim.opt_local.statusline = '%!v:lua.Line.inactive()'
  end,
})
