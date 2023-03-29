local fn = vim.fn
local api = vim.api

local function map(mode, lhs, rhs, opts)
  local options = { noremap=true, silent=true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Use arrow keys to resize panes
map('n', '<up>', ':resize -2<CR>')
map('n', '<down>', ':resize +2<CR>')
map('n', '<left>', ':vertical resize +2<CR>')
map('n', '<right>', ':vertical resize -2<CR>')


-- Reload config with <leader> <enter>
map('n', '<leader><CR>', ':so ~/.config/nvim/init.lua<CR>', { silent = false })

-- Switch between buffers with <leader><leader>
map('n', '<leader><leader>', '<C-^>')

-- Quick save with <leader> and s
map('n', '<leader>s', ':w<CR>', { desc = "Quick save" })

-- Clear search highlighting with <leader> and c
map('n', '<leader>c', ':nohl<CR>', { desc = "Clear search" })

map('n', '<leader>bp', '<CMD>BufferLinePick<CR>', { desc = "Pick buffer" })
map('n', '<leader>bd', ':bd<CR>', { desc = "Close buffer"})

-- disable recording until i understand it
map('n', 'q', '<nop>')

-- NvimTree
map('n', '<C-b>', ':NvimTreeToggle<CR>', { desc = "Toggle NvimTree" })            -- open/close
map('n', '<leader>tf', ':NvimTreeRefresh<CR>', { desc = "Refresh NvimTree"})       -- refresh

-- Coc
function check_back_space()
    local col = fn.col('.') - 1
    if col == 0 or fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

function show_docs()
    local cw = fn.expand('<cword>')
    if fn.index({ 'vim', 'help' }, vim.bo.filetype) >= 0 then
        cmd('h ' .. cw)
    elseif api.nvim_eval('coc#rpc#ready()') then
        fn.CocActionAsync('doHover')
    else
        cmd('!' .. vim.o.keywordprg .. ' ' .. cw)
    end
end

map('n', 'gd', '<Plug>(coc-definition)', { desc = "Go to definition" })
map('n', 'gy', '<Plug>(coc-type-definition)', { desc = "Go to type definition" })
map('n', 'gi', '<Plug>(coc-implementation)', { desc = "Go to implementation" })
map('n', 'gr', '<Plug>(coc-references)', { desc = "Find references" })
map('n', 'K', '<CMD>lua _G.show_docs()<CR>', { desc = "Show documentation" })
map('n', '<leader>.', '<Plug>(coc-codeaction-cursor)', { desc = "Show code actions" })
map('n', '<leader>as', '<Plug>(coc-codeaction-source)')
map('n', '<leader>qf', '<Plug>(coc-fix-current)', { desc = "Quickfix" })
map('n', '<F2>', '<Plug>(coc-rename)')
map('i', '<c-space>', 'coc#refresh()', { expr = true })


map('i', '<TAB>', 'pumvisible() ? "<C-N>" : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', { expr = true })
map('i', '<S-TAB>', 'pumvisible() ? "<C-P>" : "<C-H>"', { expr = true })

vim.cmd([[
  inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                                \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

]])


-- telescope
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<c-p>', builtin.find_files, { desc = "Find files"})
vim.keymap.set('n', '<c-f>', builtin.live_grep, { desc = "Find in files" })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Find buffer"})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- lazygit
map('n', '<leader>gg', ':LazyGit<CR>', { desc = "Open lazygit" })

-- vim test
map('n', '<leader>t', ':TestNearest<CR>', { desc = "Test nearest" })
map('n', '<leader>T', ':TestFile<CR>', { desc = "Test file" })
map('n', '<leader>ta', ':TestSuite<CR>', { desc = "Test suite" })
map('n', '<leader>te', 'TestEdit:<CR>', { desc = "Edit test file" })


-- nvim-spotify
map('n', '<leader>sp', '<Plug>(SpotifyPause)', { desc = "Pause Spotify track" }) -- Pause/Resume the current track

-- nvim-navbuddy
map('n', '<leader>nb', ':Navbuddy<CR>', { desc = 'Show Navbuddy'})

-- trouble
map('n', '<leader>xx', '<cmd>TroubleToggle<cr>', { desc = "Toggle Trouble"})
map('n', '<leader>xw', '<cmd>TroubleToggle workspace_diagnostics<cr>', { desc = 'Show Trouble workspace diagnostics' })
map('n', '<leader>xd', '<cmd>TroubleToggle document_diagnostics<cr>', { desc = 'Show Trouble document diagnostics' })
map('n', 'gR', '<cmd>TroubleToggle lsp_references<cr>', { desc = 'Show Trouble LSP references' })
