return {
  'echaya/neowiki.nvim',
  opts = {
    wiki_dirs = {
      {
        name = 'TT.AI',
        path = '~/documents/tt.ai.notes/',
      },
      {
        name = 'dev',
        path = '~/documents/notes/dev/',
      },
    },
  },
  keys = {
    {
      '<leader>ww',
      "<cmd>lua require('neowiki').open_wiki()<cr>",
      desc = 'Open Wiki',
    },
    {
      '<leader>wW',
      "<cmd>lua require('neowiki').open_wiki_floating()<cr>",
      desc = 'Open Wiki in Floating Window',
    },
    {
      '<leader>wT',
      "<cmd>lua require('neowiki').open_wiki_new_tab()<cr>",
      desc = 'Open Wiki in Tab',
    },
  },
}
