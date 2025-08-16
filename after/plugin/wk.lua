require('which-key').setup {
  preset = 'modern',
  delay = function(ctx)
    -- Show immediately for operators like d, c, y
    return ctx.operator and 0 or 400
  end,
  expand = 1, -- Reduce expand to avoid clutter
  notify = false,
  replace = {
    key = {
      { '<Space>', 'SPC' },
      { '<cr>', 'RET' },
      { '<tab>', 'TAB' },
      { '<BS>', 'BSPC' },
    },
  },
  icons = {
    breadcrumb = '»', -- symbol used in the command line area that shows your active key combo
    separator = '➜', -- symbol used between a key and it's label
    group = '+', -- symbol prepended to a group
  },
  spec = {
    -- Core groups
    { '<leader>b', group = '󰓩 Buffer', icon = '󰓩' },
    { '<leader>d', group = '󰆼 Database', icon = '󰆼' },
    { '<leader>f', group = '󰍉 Find', icon = '󰍉' },
    { '<leader>g', group = '󰊢 Git', icon = '󰊢' },
    { '<leader>l', group = '󰒲 LSP', icon = '󰒲' },
    { '<leader>o', group = '󱞁 Obsidian', icon = '󱞁' },
    { '<leader>m', group = '󰽛 Markdown', icon = '󰽛' },
    { '<leader>t', group = '󰔡 Toggle', icon = '󰔡' },
    { '<leader>w', group = '󰖲 Window', icon = '󰖲' },
    
    -- Window management
    { '<C-h>', desc = '← Move focus left' },
    { '<C-j>', desc = '↓ Move focus down' },
    { '<C-k>', desc = '↑ Move focus up' },
    { '<C-l>', desc = '→ Move focus right' },
    { '<C-S-h>', desc = '⇤ Move window left' },
    { '<C-S-j>', desc = '⇣ Move window down' },
    { '<C-S-k>', desc = '⇡ Move window up' },
    { '<C-S-l>', desc = '⇥ Move window right' },
    
    -- Core navigation
    { '<Esc>', desc = 'Clear search highlight' },
    { 'jj', desc = 'Escape insert mode', mode = 'i' },
    { 'jk', desc = 'Escape insert mode', mode = 'i' },
    { '-', desc = '󰉋 Oil file explorer' },
    
    -- Special characters
    { ',', desc = 'Toggle comma at EOL' },
    { '<C-;>', desc = 'Toggle semicolon at EOL' },
  },
}

-- Add all keybindings with proper grouping and descriptions
require('which-key').add {
  -- Buffer management
  { '<leader>bx', desc = '󰅖 Delete buffer' },
  
  -- Telescope (Find)
  { '<leader>ff', desc = '󰈞 Files' },
  { '<leader>fg', desc = '󰊄 Live grep' },
  { '<leader>fb', desc = '󰘦 Buffers' },
  { '<leader>fh', desc = '󰋖 Help tags' },
  { '<leader>fs', desc = '󰜎 Symbols' },
  { '<leader>fn', desc = '󰔡 Nerd font glyphs' },
  
  -- Database
  { '<leader>du', desc = '󰆼 Toggle DBUI' },
  { '<leader>df', desc = '󰍉 Find DB buffer' },
  { '<leader>dr', desc = '󰑕 Rename DB buffer' },
  { '<leader>dq', desc = '󰋖 Last query info' },
  
  -- LSP
  { 'gd', desc = '󰒲 Go to definition' },
  { 'gD', desc = '󰒲 Go to declaration' },
  { 'gr', desc = '󰒲 Go to references' },
  { 'gi', desc = '󰒲 Go to implementation' },
  { 'K', desc = '󰋖 Hover documentation' },
  { '<leader>rn', desc = '󰑕 Rename symbol' },
  { '<leader>ca', desc = '󰌵 Code actions' },
  { '<leader>D', desc = '󰒲 Type definition' },
  { '<leader>ws', desc = '󰜎 Workspace symbols' },
  { '<leader>f', desc = '󰉼 Format code' },
  { '<leader>q', desc = '󰁨 Diagnostics to quickfix' },
  { '<leader>e', desc = '󰒒 Show diagnostic' },
  { '[d', desc = '⬆ Previous diagnostic' },
  { ']d', desc = '⬇ Next diagnostic' },
  
  -- Obsidian notes
  { '<leader>on', desc = '󱞁 New note' },
  { '<leader>oo', desc = '󱞁 Open note' },
  { '<leader>os', desc = '󰍉 Search notes' },
  { '<leader>oq', desc = '󰘶 Quick switch' },
  { '<leader>od', desc = '󰃮 Today\'s note' },
  { '<leader>oy', desc = '󰸘 Yesterday\'s note' },
  { '<leader>ot', desc = '󰓹 List tags' },
  { '<leader>ob', desc = '󰌷 Show backlinks' },
  { '<leader>ol', desc = '󰌷 Show links', mode = { 'n', 'v' } },
  { '<leader>of', desc = '󰌷 Follow link under cursor' },
  { '<leader>or', desc = '󰑕 Rename note' },
  { '<leader>oi', desc = '󰗇 Insert template' },
  { '<leader>on', desc = '󱞁 Create note from selection', mode = 'v' },
  
  -- Markdown
  { '<leader>mp', desc = '󰽛 Toggle markdown preview' },
  
  -- Terminal (defined in autocmd)
  { '<esc>', desc = 'Exit terminal mode', mode = 't' },
  { '<C-h>', desc = '← Move focus left', mode = 't' },
  { '<C-j>', desc = '↓ Move focus down', mode = 't' },
  { '<C-k>', desc = '↑ Move focus up', mode = 't' },
  { '<C-l>', desc = '→ Move focus right', mode = 't' },
}
