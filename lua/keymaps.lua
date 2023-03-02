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
-- delete current window
keymap.set('', '<leader>c', '<C-w>c')
-- Horizontal split
keymap.set('', '<leader>v', '<C-w>v')
-- Vertical split
keymap.set('','<leader>s', '<C-w>s')
-- Balance window 
keymap.set('', '<leader>=', '<C-w>=')

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

-- switch between mutiple tabs 
keymap.set('','<S-tab>', '<Esc> :bNext <CR>')

-- launch file explorer with :Ex and our remap
keymap.set('n', '<leader>ex', vim.cmd.Ex)

-- save using ctrl+s and write the file 
keymap.set('', '<C-s>', '<Esc>:w<cr>')
-- while in insert mode ctrl-v paste copied text
keymap.set('i', '<C-v>', '<Esc>:w<cr>')

---------personal keymaps to compile various programs in different programming language----------

-- Usage :-
--
-- press <F5> to run,  till now only support for 4 languages java, python, c and c++ 
-- others to be included at time = ♾  or at interest
--
-- ⭐Note :-
--
-- if shell is set to cmd then in c++ executable can be called using .... && %:r 
-- else if shell is set to pwsh or if :term pwsh......... is used then call using ...... && ./%:r 
--
-- --------------------------------------------------------------------------------------------

-- ⭐Note :- 
-- passing input file to .exe in powershell is not same as in cmd wherein  out.exe < inputfile works fine.
-- read this :- https://stackoverflow.com/questions/2148746/the-operator-is-reserved-for-future-use

-- to paste something in vim command line(the lower portion where you type  :<commands...> ) press '<Ctrl+R> +' and enter


function CreateInputFile(filename)
  -- Get the current working directory
  local cwd = vim.fn.getcwd()
  print("cwd:", cwd)

  filename = filename or vim.fn.expand("%:r")  -- use current file name if no filename provided
  local dir = vim.fn.expand('%:p:h')
  local input_file = dir .. "/" .. filename .. ".in"

  -- Prompt the user to enter input
  local input = vim.fn.input("Enter input:\n")

  -- Write input to the input file
  local file = io.open(input_file, "w")
  if file == nil then
    -- If the file couldn't be created in the current directory, try again in the
    -- parent directory
    input_file = cwd .. "/" .. filename .. ".in"
    file = io.open(input_file, "w")
    if file == nil then
      -- If the file couldn't be created in the parent directory either, show an error
      vim.api.nvim_out_write("Error: could not create input file in current or parent directory\n")
      return
    end
  end
  file:write(input)
  file:close()

  -- Show a message indicating the input file has been created
  vim.api.nvim_out_write("Created input file: " .. input_file .. "\n")

  -- Delay for 2 seconds and then clear the message
  vim.defer_fn(function()
    vim.api.nvim_command("echo ''")
  end, 2000)
end

-- enter last recent copied data to input file named according to current file name pressing <Ctrl + v> in normal mode(simple copy required data and then press ctrl-v in neovim )
vim.api.nvim_create_autocmd("Filetype",{
    command = "nnoremap <C-v> :lua CreateInputFile()<CR> <C-r>+ <CR>"
})


-- C++ code runner using std=c++20 with input file containing latest copied data in register !!!
vim.api.nvim_create_autocmd("Filetype", {
    pattern = {"cpp","CPP","cxx","CXX","hpp","hxx","Hxx","HXX"},
    command = "nnoremap <F5> :lua CreateInputFile() <CR> <C-r>+ <CR> <CR> :w <bar> :split<CR> :term g++ % -std=c++20 -pipe -Wall -Wextra -Wshadow -Og -o %:r && %:r < %:r.in <CR> i" 
})

-- C code runner using std=c17
vim.api.nvim_create_autocmd("Filetype", {
    pattern = {"c","C","h","H"},
    command = "nnoremap <F5> <ESC> :w <bar> :split<cr> :term gcc -std=c17 -Wall -Wextra -Wshadow -Ofast -o %< % && %< <CR> i"
})

-- Python code runner
vim.api.nvim_create_autocmd("Filetype", {
    pattern = {"python"},
    command = "nnoremap <F5> <ESC> :w <bar> :split<cr> :term python % <CR> i"
})

-- Java code runner(untested)
vim.api.nvim_create_autocmd("Filetype", {
    pattern = {"java"},
    command = "nnoremap <F5> <ESC> :w <bar> :split<cr> :term javac % && java %:r <CR> i"
})


------------- loading template for CP(my personal config, don't blindly copy) ---------------

-- press cps in normal mode to get my template
vim.api.nvim_set_keymap('n', 'cps', ':-1read H:\\Mytemplates\\cp_template_simple.cpp<CR>', { noremap = true })


-- below code is specific to my codeforces and codechef folder wherin any file with .cpp extension will automatically load my template 
-- we use escape sequence '\ '
-- in Lua, the backslash \ is used as an escape character. It is used to indicate that the character following it should be treated specially ie. to denote a space here.
vim.cmd([[
  augroup cpp_template
    autocmd!
    autocmd BufNewFile C:/Users/JOYDEEP/Documents/PERSONAL\ ACHIEVEMENTS/{CODEFORCES,CODECHEF}/*.cpp 0r H:/Mytemplates/cp_template_simple.cpp
  augroup END
]])

---------------------------------- manipulating the neovim terminal(🥺not yet working) ----------------------------------

-- paste in neovim terminal for exe file wont seperate lines
-- https://stackoverflow.com/questions/65695772/how-do-i-paste-the-copied-text-in-neovim-integrated-terminal-while-keeping-its-i

-- vim.api.nvim_buf_set_option(0, 'modifiable', true)

-- function Paste()
--   local clipboard = vim.fn.split(vim.fn.system("powershell.exe -command 'Get-Clipboard'"), "\n")
--   local term_buf = vim.fn.termopen('cmd.exe', { curwin = 1 })
--   vim.fn.term_sendkeys(term_buf, table.concat(clipboard, "\\<cr>"), 1)
--   vim.api.nvim_feedkeys(":startinsert\\<cr>", "n", true)
--   vim.fn.term_wait(term_buf)
--   vim.api.nvim_feedkeys("\\<C-\\>\\<C-n>", "n", true)
-- end
--
--
-- vim.api.nvim_set_keymap("t", "<C-v>", "<C-\\><C-n>:lua Paste()<CR>", {noremap = true})
--
