vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.opt.autoindent = true

-- Keep one status bar across the editor and file explorer.
vim.opt.laststatus = 3

require("config.lazy")
    
    
 vim.opt.relativenumber = true   
    
