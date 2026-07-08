return {
  -- Theme
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('tokyonight').setup({ style = 'night', transparent = true })
      vim.cmd('colorscheme tokyonight-night')
    end,
  },

  -- Status line
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup({
        options = { theme = 'tokyonight', section_separators = '', component_separators = '│' },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch', 'diff' },
          lualine_c = { { 'filename', path = 1 } },
          lualine_x = { 'diagnostics', 'filetype' },
          lualine_y = { 'progress' },
          lualine_z = { 'location' },
        },
      })
    end,
  },

  -- File tree
  {
    'stevearc/oil.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = { view_options = { show_hidden = true } },
    keys = { { '<leader>e', '<cmd>Oil<cr>', desc = 'File Browser' } },
  },

  -- Fuzzy finder
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' } },
    config = function()
      require('telescope').setup({
        defaults = { file_ignore_patterns = { 'node_modules', '.git/', 'vendor/' } },
      })
      require('telescope').load_extension('fzf')
    end,
  },

  -- Syntax highlighting (fixed: use config fn instead of main+opts for v0.10+)
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = { 'go', 'lua', 'python', 'typescript', 'javascript', 'json', 'yaml', 'markdown', 'markdown_inline', 'groovy' },
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },

  -- LSP
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
    },
    config = function()
      require('mason').setup()
      require('mason-lspconfig').setup({
        ensure_installed = { 'gopls', 'lua_ls', 'ts_ls', 'pyright' },
        automatic_installation = true,
      })
      vim.lsp.config('gopls', {})
      vim.lsp.config('lua_ls', { settings = { Lua = { diagnostics = { globals = { 'vim' } } } } })
      vim.lsp.config('ts_ls', {})
      vim.lsp.config('pyright', {})
      vim.lsp.enable({ 'gopls', 'lua_ls', 'ts_ls', 'pyright' })
    end,
  },

  -- Autocompletion
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
    },
    config = function()
      local cmp = require('cmp')
      local luasnip = require('luasnip')
      cmp.setup({
        snippet = { expand = function(args) luasnip.lsp_expand(args.body) end },
        mapping = cmp.mapping.preset.insert({
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<CR>']      = cmp.mapping.confirm({ select = true }),
          ['<Tab>']     = cmp.mapping(function(fallback)
            if cmp.visible() then cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then luasnip.expand_or_jump()
            else fallback() end
          end, { 'i', 's' }),
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then luasnip.jump(-1)
            else fallback() end
          end, { 'i', 's' }),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' }, { name = 'luasnip' }, { name = 'buffer' }, { name = 'path' },
        }),
      })
    end,
  },

  -- Git signs in gutter
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup({
        signs = { add = { text = '▎' }, change = { text = '▎' }, delete = { text = '▎' } },
      })
    end,
  },

  -- Auto pairs
  { 'windwp/nvim-autopairs', event = 'InsertEnter', config = true },

  -- Comment toggle
  { 'numToStr/Comment.nvim', config = true },

  -- Which-key
  {
    'folke/which-key.nvim',
    config = function()
      local wk = require('which-key')
      wk.setup({ delay = 500 })
      vim.keymap.set('n', '<M-?>', function()
        wk.show('<M-', { mode = 'n' })
      end, { desc = 'Show Alt keybinds' })
    end,
  },
}
