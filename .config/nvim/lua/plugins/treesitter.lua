-- See: https://github.com/nvim-treesitter/nvim-treesitter#quickstart
return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    opts = function()
        return {
            ensure_installed = {
                'bash', 'c', 'cpp', 'css', 'html', 'javascript', 'json', 'lua',
                'ruby', 'rust', 'typescript', 'tsx', 'vim', 'yaml', 'prisma'
            },
            sync_install = false,
            highlight = {
                -- `false` will disable the whole extension
                enable = true
            }
        }
    end,
    config = function(_, opts) 
      require('nvim-treesitter.configs').setup(opts) 
    end
}
