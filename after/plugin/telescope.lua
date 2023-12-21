local builtin = require('telescope.builtin')

-- browse through project files
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})

-- browse through all git files
vim.keymap.set('n', '<leader>gf', builtin.git_files, {})

-- build in live grep 
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})

-- build a keymap to search within a project
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

