local api = require("nvim-tree.api")
vim.keymap.set('n', '<leader>pv', api.tree.toggle, {})
vim.keymap.set('n', '%', api.fs.create, {})

require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})
