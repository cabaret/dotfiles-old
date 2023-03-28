local g = vim.g                     -- global variables
local opt = vim.opt                 -- options

opt.termguicolors = true            -- enable true colors

opt.mouse = 'a'                     -- enable mouse support
opt.clipboard = 'unnamedplus'       -- use system clipboard
opt.swapfile = false                -- dont write swap files
opt.updatetime = 100                -- lower update time from 4s to 100ms

opt.autowrite = true                -- enable auto write

opt.number = true                   -- line numbers
opt.relativenumber = true           -- relative numbers
opt.numberwidth = 6
opt.signcolumn = 'auto'             -- draw signs in the line number column

opt.scrolloff = 10                  -- scrolloffset top/bottom of window

opt.showmatch = true                -- highlight matching parentheses

local TAB_WIDTH = 2
opt.expandtab = true                -- Use spaces instead of tabs
opt.shiftwidth = TAB_WIDTH          -- Shift 2 spaces when tab
opt.tabstop = TAB_WIDTH             -- 1 tab == 2 spaces
opt.smartindent = true              -- Autoindent new lines

opt.hidden = true                   -- Enable background buffers
opt.history = 100                   -- Remember N lines in history
opt.lazyredraw = true               -- Faster scrolling
opt.synmaxcol = 240                 -- Max column for syntax highlight

opt.ignorecase = true               -- ignore case in search
opt.smartcase = true                -- override ignorecase if query contains uppercase

opt.breakindent = true              -- preserve indentation on wrapped lines

opt.showmode = false                -- dont show mode since there's a status line
opt.list = true                     -- show invisible characters

opt.foldcolumn = "1"
opt.foldlevel = 99                  -- Using ufo provider need a large value, feel free to decrease the value
opt.foldlevelstart = 99
opt.foldenable = true
opt.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

-- Disable builtin plugins
local disabled_built_ins = {
    "2html_plugin", "getscript", "getscriptPlugin", "gzip", "logipat",
    "matchit", "tar", "tarPlugin", "rrhelper", "spellfile_plugin", "vimball",
    "vimballPlugin", "zip", "zipPlugin", "tutor", "rplugin", "synmenu",
    "optwin", "compiler", "bugreport", "ftplugin"
}

for _, plugin in pairs(disabled_built_ins) do g["loaded_" .. plugin] = 1 end
