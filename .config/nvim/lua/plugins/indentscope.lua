return {
    'echasnovski/mini.indentscope',
    version = false,
    opts = function()
        return {
            symbol = "│", 
            options = {try_as_border = true}
        }
    end,
    config = function(_, opts) 
        require("mini.indentscope").setup(opts) 
    end
}
