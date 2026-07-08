local map = vim.keymap.set

-- Essentials
map('n', '<leader>w', '<cmd>w<cr>', { desc = 'Save' })
map('n', '<leader>q', '<cmd>q<cr>', { desc = 'Quit' })
map('n', '<leader>x', '<cmd>x<cr>', { desc = 'Save & quit' })

-- Clear search highlight
map('n', '<Esc>', '<cmd>nohlsearch<cr>')

-- Better movement
map('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true })
map('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true })

-- Move lines (Alt+j/k)
map('v', '<M-j>', ":m '>+1<cr>gv=gv")
map('v', '<M-k>', ":m '<-2<cr>gv=gv")

-- Splits
map('n', '<M-Right>', '<cmd>vsplit<cr>', { desc = 'Split right' })
map('n', '<M-Down>',  '<cmd>split<cr>',  { desc = 'Split down' })

-- Navigate splits (Alt+WASD)
map('n', '<M-a>', '<C-w>h', { desc = 'Pane left' })
map('n', '<M-d>', '<C-w>l', { desc = 'Pane right' })
map('n', '<M-w>', '<C-w>k', { desc = 'Pane up' })
map('n', '<M-s>', '<C-w>j', { desc = 'Pane down' })

-- Buffers (Alt+1-9)
for i = 1, 9 do
  map('n', '<M-' .. i .. '>', '<cmd>b' .. i .. '<cr>', { desc = 'Buffer ' .. i })
end
map('n', '<M-q>', '<cmd>bprev<cr>', { desc = 'Prev buffer' })
map('n', '<M-e>', '<cmd>bnext<cr>', { desc = 'Next buffer' })
map('n', '<M-x>', '<cmd>bd<cr>',    { desc = 'Close buffer' })

-- Fuzzy find
map('n', '<leader>f', '<cmd>Telescope find_files<cr>',  { desc = 'Find files' })
map('n', '<leader>g', '<cmd>Telescope live_grep<cr>',   { desc = 'Live grep' })
map('n', '<leader>b', '<cmd>Telescope buffers<cr>',     { desc = 'Buffers' })
map('n', '<leader>/', '<cmd>Telescope current_buffer_fuzzy_find<cr>', { desc = 'Search buffer' })

-- File tree
map('n', '<leader>e', '<cmd>NvimTreeToggle<cr>', { desc = 'File tree' })

-- LSP
map('n', 'K',          vim.lsp.buf.hover,         { desc = 'Hover docs' })
map('n', 'gd',         vim.lsp.buf.definition,    { desc = 'Go to definition' })
map('n', 'gr',         vim.lsp.buf.references,    { desc = 'References' })
map('n', '<leader>rn', vim.lsp.buf.rename,        { desc = 'Rename' })
map('n', '<leader>ca', vim.lsp.buf.code_action,   { desc = 'Code action' })
map('n', '<leader>d',  vim.diagnostic.open_float, { desc = 'Diagnostics' })
map('n', '[d',         vim.diagnostic.goto_prev,  { desc = 'Prev diagnostic' })
map('n', ']d',         vim.diagnostic.goto_next,  { desc = 'Next diagnostic' })
