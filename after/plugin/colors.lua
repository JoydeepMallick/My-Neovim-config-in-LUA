function ColorMyPencils(color)
    -- my selected color list 
    -- 1. "rose-pine"
    -- 2. "adventurous"
    -- 3. "Atelier_SeasideDark"
    -- 4. "base16-atelierforest"
    -- 5. "vim-material"
    -- 6. "ayu"
    -- 7. "inkpot"
    color = color or "gruvbox8_hard"
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

-- everytime screen losses color simply recolor or repaint using :lua ColorMyPencils()
ColorMyPencils()


