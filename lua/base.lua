--print("base.lua loaded")

vim.cmd('autocmd!')

vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

vim.wo.number = true
vim.wo.relativenumber = true

vim.opt.title = true
vim.opt.autoindent = true
vim.opt.hlsearch = true
--vim.opt.backup = false
vim.opt.cmdheight = 1
vim.opt.laststatus = 2

-- used to have at least 10 extra rows after or before cursor  
vim.opt.scrolloff = 10
--vim.opt.shell = 'cmd'
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
