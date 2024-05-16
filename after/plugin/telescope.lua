local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {silent = true})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

require('telescope').setup{
	defaults = {
		file_ignore_patterns = {
     "node_modules", "vendor"
   },  find_command = {
		 "rg",
		 "--hidden",
		 "--column",
		 "--with-filename"
	 }, find_files = {
			hidden = true
	 },
	}
}
