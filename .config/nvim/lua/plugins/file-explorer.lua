return {
    'nvim-tree/nvim-tree.lua',
    dependencies = {'nvim-tree/nvim-web-devicons'},
    opts = function()
        return {
            disable_netrw = true,
            hijack_unnamed_buffer_when_opening = false,
            hijack_directories = {
              enable = true, 
              auto_open = true
            },
            update_focused_file = {
                enable = true,
                update_root = true,
                ignore_list = {
                    "nofile", "terminal", "toggleterm", "term", "quickfix"
                }
            }
        }
    end,
    config = function(_, opts)
      require('nvim-tree').setup(opts)
    end
}
