return {
    'vim-test/vim-test',
    init = function()
        local g = vim.g

        g['test#strategy'] = 'neovim'
        g['test#neovim#term_position'] = 'vert rightbelow'
    end
}
