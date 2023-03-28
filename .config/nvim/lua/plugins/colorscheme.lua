return {
    'folke/tokyonight.nvim',
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    opts = function()
        return {
            style = "moon",
            styles = {
                comments = {italic = true},
                keywords = {italic = false},
                functions = {italic = true},
                variables = {italic = false}
            }
        }
    end,
    config = function(_, opts)
        local status_ok, tokyonight = pcall(require, 'tokyonight')
        if not status_ok then return end

        tokyonight.setup(opts)
        tokyonight.load()
    end
}
