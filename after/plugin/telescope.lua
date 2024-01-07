local builtin = require('telescope.builtin')

-- Browse through project files
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})

-- Browse through all Git files
vim.keymap.set('n', '<leader>gf', builtin.git_files, {})

-- Built-in live grep
vim.keymap.set('n', '<leader>rg', builtin.live_grep, {})

-- Search within a project
vim.keymap.set('n', '<leader>ps', function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

-- Fuzzy command history
vim.keymap.set('n', '<leader>ch', builtin.command_history, {})

-- Fuzzy marks navigation
vim.keymap.set('n', '<leader>fm', function()
  builtin.marks({
    previewer = false,
    shorten_path = false,
  })
end)

-- Fuzzy help tags search
vim.keymap.set('n', '<leader>ht', builtin.help_tags, {})

-- Fuzzy lines search within the current buffer
vim.keymap.set('n', '<leader>ln', builtin.current_buffer_fuzzy_find, {})

-- View all references of text under cursor in current file
vim.keymap.set('n', '<leader>fr', builtin.lsp_references, { noremap = true, silent = true })
