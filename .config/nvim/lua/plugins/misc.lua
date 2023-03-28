return {
    {'othree/yajs.vim'}, {'HerringtonDarkholme/yats.vim'}, {'matze/vim-move'},
    {'airblade/vim-gitgutter'}, {'kdheepak/lazygit.nvim'}, {'tpope/vim-repeat'},
    {'tpope/vim-surround'}, -- move this later
    {
        'neovim/nvim-lspconfig',
        config = function() require'lspconfig'.tsserver.setup {} end
    }, {
        "SmiteshP/nvim-navic",
        dependencies = {'neovim/nvim-lspconfig'},
        config = function()
            local navic = require("nvim-navic")

            require("lspconfig").tsserver.setup {
                on_attach = function(client, bufnr)
                    navic.attach(client, bufnr)
                end
            }
            navic.setup()
        end
    }, {
        "SmiteshP/nvim-navbuddy",
        dependencies = {
            "neovim/nvim-lspconfig", "SmiteshP/nvim-navic",
            "MunifTanjim/nui.nvim"
        },
        config = function()
            require('nvim-navbuddy').setup {lsp = {auto_attach = true}}
        end
    }

}
