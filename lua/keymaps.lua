-- default leader is backslash '\'
vim.g.mapleader = "\\"

-- kind of setting an alias
local keymap = vim.keymap

---------------------------------------------------------------
-- Quite helpful videos, do check out :-
--
-- https://www.youtube.com/watch?v=435-amtVYJ8
-- https://www.youtube.com/watch?v=w7i4amO_zaE
----------------------------------------------------------------

-- do not yank with x(cut only but don't save it on clipboard)
-- keymap.set('n', 'x', '"_x')

-- increment/decrement an entire number by pressing + or -
keymap.set('n', '-', '<C-a>')
keymap.set('n', '+', '<C-x>')

-- delete a word backwords
keymap.set('n', 'dw', 'vb"_d')

-- select all using Ctrl+a in normal mode 
keymap.set('n', '<C-a>', '<Esc>ggVG')

-- new tab, keep it silent if not active else all edited at same time 

keymap.set('n' ,'te', ':tabedit<Return>', {silent = true})

-- split window, keep it silent if not active else all edited at same time 
keymap.set('n','ss', ':split<Return><C-w>w', {silent = true})   -- Horizontal split
keymap.set('n','sv', ':vsplit<Return><C-w>w', {silent = true})  -- Vertical split

-- move window
keymap.set('n','<Space>', '<C-w>w') -- move between all windows

keymap.set('', '<C-left>', '<C-w>h')
keymap.set('', '<C-down>', '<C-w>j')
keymap.set('', '<C-up>', '<C-w>k')
keymap.set('', '<C-right>', '<C-w>l')

keymap.set('', '<C-h>', '<C-w>h')
keymap.set('', '<C-j>', '<C-w>j') 
keymap.set('', '<C-k>', '<C-w>k')
keymap.set('', '<C-l>', '<C-w>l')

-- resize window, first press <C-w> then the desired key
keymap.set('n', '<C-w><left>', '<C-w><')
keymap.set('n', '<C-w><right>', '<C-w>>')
keymap.set('n', '<C-w><up>', '<C-w>+')
keymap.set('n', '<C-w><down>', '<C-w>-')

-- launch file explorer with :Ex and our remap
keymap.set('n', '<leader>ex', vim.cmd.Ex)

-- save using ctrl+s and source neovim in any mode currently
keymap.set('', '<C-s>', '<Esc>:w<cr>:so<cr>')


------------------ my personal keymaps to compile various programs in different programming language-------------------
-- read this for help :- https://github.com/abzcoding/lvim/blob/main/lua/user/autocommands.lua
--
-- ------------------------------------- 💔💔💔💔💔not working --------------------------------------------------------

vim.api.nvim_create_autocmd("FileType", { pattern = "cpp", 
    command = "nnoremap <buffer> <C-c> :split<CR>:te g++ -std=c++14 -Wshadow -Wall -o %:t:r % -g -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG && ./%:t:r<CR>i"})

vim.api.nvim_create_autocmd("Filetype", {
    pattern = {"cpp","CPP","cxx","CXX","hpp","hxx","Hxx","HXX"},
    command = "nnoremap <F5> <ESC> :w <bar> :split<cr> :term g++ % -std=c++20 -pipe -Wall -Wextra -Wshadow -Og -o %:r.exe && ./%:r.exe<CR> i"
})
