-- print("base.lua loaded")

vim.cmd('autocmd!')

vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

vim.wo.number = true
vim.wo.relativenumber = true

-- redefining split rules, defaults are splitleft and splittop
vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.title = true
vim.opt.autoindent = true
vim.opt.ignorecase = true -- do case insensitive search 
vim.opt.hlsearch = true -- highlight all matches
vim.opt.incsearch = true -- do incremental search
--vim.opt.backup = false
vim.opt.cmdheight = 1
vim.opt.laststatus = 2

vim.opt.autochdir = true  -- Enable autochdir(set current file's directory as pwd)

vim.opt.scrolloff = 10 -- used to have at least 10 extra rows after or before cursor  
--vim.opt.backupskip = '/tmp/*,/private/tmp/*'
vim.opt.inccommand = 'split'
vim.opt.breakindent = true
vim.opt.ai = true   --auto indent
vim.opt.backspace = 'start,eol,indent'
-- vim.opt.path:append { '**' } -- finding files, searching down into sub folders
-- vim.opt.wildignore:append { '*/node_modules/*' }

-- Undercurl
-- vim.cmd([[let &t_Cs = "\e[4:3m"]])
-- vim.cmd([[let &t_Cs = "\e[4:0m"]])

-- turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
        pattern = '*',
        command = "set nopaste"
})

-- add asterisks in block commands
-- vim.opt.formatoptions:append{ 'r' }

-- tab properties
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smarttab = true
vim.opt.expandtab = true
-- fast update time 
vim.opt.updatetime = 50

-- Always Show Tabline
vim.o.showtabline = 2

-- Check if pwsh is available, otherwise use powershell or cmd
-- local shell = 'pwsh'

-- local pwsh_path = vim.fn.trim(vim.fn.system('where pwsh'))
-- if pwsh_path ~= '' then
--   shell = pwsh_path
-- else
--   if vim.fn.has('win32') == 1 then
--     shell = 'powershell'
--   else
--     shell = 'cmd'
--   end
--   print("PowerShell not found, using " .. shell .. " instead.")
-- end

-- Set shell options for PowerShell
-- vim.o.shell = shell
-- vim.o.shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;'
-- vim.o.shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
-- vim.o.shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
-- vim.o.shellquote = ''
-- vim.o.shellxquote = ''


-- enable "bracketed paste mode" in your terminal emulator, which allows the terminal to distinguish between pasted text and manually typed text.(no benefit)
vim.o.t_BE = "\x1b[200~"


-- |||||Netrw specific tips|||||
-- After ":cd <path>" netrw wont update automatically 
-- so  run ":edit ."  to update it.
-- below code  tries to automate updation of netrw on change of directory(does not work as intended).

vim.cmd([[
  autocmd BufEnter * if &filetype == 'netrw' | edit . | endif
]])
