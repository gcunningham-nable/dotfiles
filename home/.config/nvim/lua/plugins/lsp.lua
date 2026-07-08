return {
  {
    'neovim/nvim-lspconfig',
    event = 'BufWinEnter',
    config = function()
      require('lspconfig').gopls.setup({
        settings = {
          gopls = {
            analyses = { unusedparams = true },
            staticcheck = true,
            gofumpt = true,
          },
        },
      })
    end,
    keys = {
      { 'K',          vim.lsp.buf.hover,       desc = 'Hover Docs' },
      { '<leader>r',  vim.lsp.buf.rename,      desc = 'Rename' },
      { '<leader>ca', vim.lsp.buf.code_action, desc = 'Code Action' },
      { 'gr',         vim.lsp.buf.references,  desc = 'References' },
    },
  },
}
