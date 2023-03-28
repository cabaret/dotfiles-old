local augroup = vim.api.nvim_create_augroup   -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd   -- Create autocommand

-- Highlight on yank
augroup('YankHighlight', { clear = true })
autocmd('TextYankPost', {
  group = 'YankHighlight',
  callback = function()
    vim.highlight.on_yank({ higroup = 'IncSearch', timeout = '500' })
  end
})

-- Remove whitespace on save
autocmd('BufWritePre', {
  pattern = '',
  command = ":%s/\\s\\+$//e"
})

-- Don't auto commenting new lines
autocmd('BufEnter', {
  pattern = '',
  command = 'set formatoptions-=cro'
})

augroup('setLineLength', { clear = true })


-- open nvim-tree on startup
local function open_nvim_tree()
  require("nvim-tree.api").tree.open()
end

autocmd({ "VimEnter" }, { callback = open_nvim_tree })

-- -- Coc
-- vim.cmd([[
--   " highlight selected word on cursor hold
--   autocmd CursorHold * silent call CocActionAsync('highlight')
--   " add Fold command
--   command! -nargs=? Fold :call     CocAction('fold', <f-args>)
-- ]])

