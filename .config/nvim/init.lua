vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_perl_provider = 1

-- Change leader to a comma
vim.g.mapleader = ' '

require('core/lazy')
require('core/keymaps')
require('core/autocmds')
require('core/options')
