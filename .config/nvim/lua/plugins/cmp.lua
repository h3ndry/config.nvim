return {
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = {
    {
      'L3MON4D3/LuaSnip',
      build = (function()
        if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
          return
        end
        return 'make install_jsregexp'
      end)(),
    },
    'saadparwaiz1/cmp_luasnip',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-path',
    'rafamadriz/friendly-snippets',
    'onsails/lspkind-nvim',
    'tamago324/cmp-zsh',
    'ray-x/cmp-treesitter',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-calc',
    'lukas-reineke/cmp-rg',
    'jmederosalvarado/roslyn.nvim',
    -- "jalvesaq/cmp-nvim-r",
    'R-nvim/cmp-r',
    'hrsh7th/cmp-buffer',
    'f3fora/cmp-spell',
    'saadparwaiz1/cmp_luasnip',
  },
  config = function()
    local cmp = require 'cmp'
    local luasnip = require 'luasnip'
    luasnip.config.setup {}
    local lspkind = require 'lspkind'

    local has_words_before = function()
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match '%s' == nil
    end

    local buildtime_path = vim.split(package.path, ';')
    table.insert(buildtime_path, 'lua/?.lua')
    table.insert(buildtime_path, 'lua/?/init.lua')

    cmp.setup {
      mapping = {
        ['<C-n>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item { behavior = cmp.SelectBehavior.Select }
          elseif luasnip.expand_or_jumpable() then
            luasnip.jump(1)
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { 'i', 's' }),

        ['<C-p>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item { behavior = cmp.SelectBehavior.Select }
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { 'i', 's' }),

        ['<Down>'] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Select },
        ['<Up>'] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Select },
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<C-y>'] = cmp.mapping.confirm { select = true }, -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ['<C-k>'] = cmp.mapping.confirm { select = true }, -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      },

      window = {
        completion = {
          border = 'rounded',
          scrollbar = '-',
        },
        documentation = {
          border = 'rounded',
          scrollbar = '-',
        },
      },

      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body)
        end,
      },

      sources = {
        { name = 'nvim_lsp' },
        { name = 'cmp_r' },
        { name = 'luasnip' },
        { name = 'nvim_lua' },
        { name = 'cmp-cmdline' },
        { name = 'zsh' },
        { name = 'calc' },
        { name = 'path' },
        { name = 'buffer' },
        { name = 'vim-dadbod-completion' },
      },
      experimental = {},
      formatting = {
        format = lspkind.cmp_format {
          menu = {
            nvim_lsp = '[LSP]',
            cmp_nvim_r = '[R]',
            luasnip = '[SNIP]',
            nvim_lua = '[API]',
            calc = '[CALC]',
            cmdline = '[CMD]',
            path = '[PATH]',
          },
        },
      },
    }

    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources {
        { name = 'path' },
        { name = 'cmdline' },
      },
    })

    -- cmp.setup.filetype({ 'sql' }, {
    --   sources = cmp.config.sources {
    --     { name = 'path' },
    --     { name = 'vim-dadbod-completion' },
    --   },
    -- })

    cmp.setup.cmdline('/', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources {
        { name = 'buffer' },
      },
    })

    cmp.setup.cmdline('?', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources {
        { name = 'buffer' },
      },
    })

    require('luasnip.loaders.from_vscode').lazy_load {
      paths = { './snippets/' },
    }

    vim.keymap.set({ 'i' }, '<C-K>', function()
      luasnip.expand()
    end, { silent = true })

    vim.keymap.set({ 'i', 's' }, '<C-E>', function()
      if luasnip.choice_active() then
        luasnip.change_choice(1)
      end
    end, { silent = true })
  end,
}
