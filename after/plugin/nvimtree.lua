-- examples for your init.lua

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

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

