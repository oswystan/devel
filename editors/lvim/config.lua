-------------------------------------------------------------------------------
--                  Copyright (C) 2023 wystan
--
--       filename: config.lua
--    description: init configuration for lvim
--        created: 2023/05/10
--         author: wystan
--
-------------------------------------------------------------------------------

----------------------------------
-- base options
----------------------------------
vim.opt.mouse       = nil
vim.opt.tabstop     = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth  = 4
vim.opt.expandtab   = true
vim.opt.ignorecase  = true
vim.opt.guicursor   = "a:block"
vim.opt.whichwrap   = "<,>"
vim.cmd[[au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif]]

----------------------------------
-- key mapping
----------------------------------
lvim.leader = ","
lvim.keys.normal_mode["<leader>z"] = ":qa!<CR>"
lvim.keys.normal_mode["<leader>x"] = ":wqa!<CR>"
lvim.keys.normal_mode["H"]         = ":BufferLineCyclePrev<CR>"
lvim.keys.normal_mode["L"]         = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<leader>t"] = ":TagbarToggle<CR>"
lvim.keys.normal_mode["<leader>w"] = ":NERDTreeToggle<CR>"
lvim.keys.visual_mode["<leader>e"] = ":Tabularize /=<CR>"
lvim.keys.visual_mode["<leader>c"] = ":Tabularize /:<CR>"

----------------------------------
-- plugins
----------------------------------
vim.g.tagbar_left  = 1
vim.g.tagbar_width = 30
lvim.plugins = {
    {"scrooloose/nerdcommenter"},
    {"scrooloose/nerdtree"},
    {"majutsushi/tagbar"},
    {"godlygeek/tabular"},
    {"vim-scripts/a.vim"}
}

-------------------------------------------------------------------------------
