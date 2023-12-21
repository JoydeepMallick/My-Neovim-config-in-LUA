--
--------------------------------------------------------------------------------
--         File:  init.lua
--
--        Usage:  ./init.lua
--
--  Description:  
--
--      Options:  ---
-- Requirements:  packer.nvim(web browse how to install it😅)
--         Bugs:  Yanking them now and then
--        Notes:  currently work in progress...
--       Author:  JOYDEEP MALLICK, <>
-- Organization:  JMORG
--      Version:  1.0
--      Created:  24-01-2023
--     Revision:  ---
--      Support:  1. https://www.youtube.com/watch?v=-esgEOqwzVg
--      	      2. https://www.youtube.com/watch?v=ajmK0ZNcM4Q
--      	      3. https://www.youtube.com/watch?v=w7i4amO_zaE
--      	      4. https://www.youtube.com/watch?v=435-amtVYJ8
--      	      5. https://github.com/nanotee/nvim-lua-guide  
--------------------------------------------------------------------------------
--

print('init.lua loaded successfully!')
-- 🌟🌟🌟 load all lua files
require('base')
require('highlights')
require('keymaps')
require('plugins') -- using packer

-- add language server for lua[ Please Install a language server before head, we use npm]
-- use the following command in terminal/shell :-
-- npm i -g pyright
require'lspconfig'.pyright.setup{}

-- by default nvim or vim doesn't sync yanked text to the system clipboard or vice versa so we need to set it to do so

local has = function(x)
    return vim.fn.has(x) == 1 -- using has function of vim
end

--------------------------------------------------------------------------------
-- More work to be done on other systems.
-- unix, linux, openbsd,........
---------------------------------🔩🔩🔩🔩--------------------------------------
local is_mac = has "macunix"
local is_win = has "win32"

if is_mac then
    require('macos')
end

if is_win then
    require('windows')
end

--------------------------------------------------------------------------------

-- keeping the background transparent, credits https://stackoverflow.com/questions/37712730/set-vim-background-transparent
-- vim.api.nvim_set_hl(0, "Normal", {guibg=NONE, ctermbg=NONE})
-- below code no more works after installing rosepine hence we need to set it again in after folder.
vim.api.nvim_set_hl(0, "Normal", {ctermbg=NONE})

