local builtin = require('telescope.builtin')
-- browse through project files
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
-- browse through all git files
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
-- build a keymap to search within a project
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

