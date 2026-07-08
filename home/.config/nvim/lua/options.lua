local o = vim.opt

-- Appearance
o.termguicolors = true
o.number = true
o.relativenumber = true
o.signcolumn = 'yes'
o.cursorline = true
o.scrolloff = 8
o.sidescrolloff = 8
o.wrap = false
o.showmode = false
o.laststatus = 3       -- single global statusline

-- Indentation
o.tabstop = 2
o.shiftwidth = 2
o.expandtab = true
o.smartindent = true

-- Search
o.ignorecase = true
o.smartcase = true
o.hlsearch = false
o.incsearch = true

-- Splits
o.splitright = true
o.splitbelow = true

-- Files
o.undofile = true
o.swapfile = false
o.backup = false
o.updatetime = 150
o.timeoutlen = 300

-- Clipboard
o.clipboard = 'unnamedplus'
