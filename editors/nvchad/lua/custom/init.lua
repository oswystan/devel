-------------------------------------------------------------------------------
--                  Copyright (C) 2023 wystan
--
--       filename: init.lua
--    description: init configuration for nvchad
--        created: 2023/06/24
--         author: wystan
--
-------------------------------------------------------------------------------
local opt = vim.opt
local g = vim.g
local cmd = vim.cmd
local autocmd = vim.api.nvim_create_autocmd

--------------------
-- base options
--------------------
opt.mouse = nil
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.ignorecase = true
opt.guicursor = "a:block"
opt.whichwrap = "<,>"

g.mapleader = ","

g.vscode_snippets_path = vim.fn.stdpath("config") .. "/lua/custom/snippets"

-- goto last postion
cmd([[au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif]])

-- toggle quickfix window borrowed from lvim
cmd([[
  function! QuickFixToggle()
    if empty(filter(getwininfo(), 'v:val.quickfix'))
      copen
    else
      cclose
    endif
  endfunction
]])

autocmd("FileType", {
  pattern = { "c", "cpp", "lua", "sh", "go" },
  callback = function()
    autocmd("BufWritePre", {
      callback = function()
        vim.lsp.buf.format()
      end,
    })
  end,
})

-------------------------------------------------------------------------------
