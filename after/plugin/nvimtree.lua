-- examples for your init.lua

-- disable netrw at the very start of your init.lua (strongly advised)
-- people who comment below lines are doomed!!!(WHY the heck did you download NvimTree)
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})


-- Remap <C-b> to toggle NvimTree in insert and normal mode
vim.api.nvim_set_keymap('n', '<C-b>', ':NvimTreeToggle<CR>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('i', '<C-b>', '<C-o>:NvimTreeToggle<CR>', {noremap=true, silent=true})

-- Note :- 
--
-- click on the file to delete then press d and then y 
-- to create a new file in a specific folder click on the folder and then click a and then filename then enter
-- to rename a file click on it and then press r and rename it.
--
--
-- More commands to be listed soon...
