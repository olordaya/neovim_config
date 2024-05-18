local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {'tsserver', 'rust_analyzer','pyright'},
  handlers = {
    lsp_zero.default_setup,
    lua_ls = function()
      local lua_opts = lsp_zero.nvim_lua_ls()
      require('lspconfig').lua_ls.setup(lua_opts)
    end,
  }
})

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}

cmp.setup({
  sources = {
    {name = 'path'},
    {name = 'nvim_lsp'},
    {name = 'nvim_lua'},
    {name = 'luasnip', keyword_length = 2},
    {name = 'buffer', keyword_length = 3},
  },
  formatting = lsp_zero.cmp_format(),
  mapping = cmp.mapping.preset.insert({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ['<C-Space>'] = cmp.mapping.complete(),
  }),
})







-- local cmp = require'cmp'
--
--  cmp.setup({
--    snippet = {
--      -- REQUIRED - you must specify a snippet engine
--      expand = function(args)
--        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
--         require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
--         require('snippy').expand_snippet(args.body) -- For `snippy` users.
--         vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
--      end,
--    },
--    window = {
--       completion = cmp.config.window.bordered(),
--       documentation = cmp.config.window.bordered(),
--    },
--    mapping = cmp.mapping.preset.insert({
--      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
--      ['<C-f>'] = cmp.mapping.scroll_docs(4),
--      ['<C-Space>'] = cmp.mapping.complete(),
--      ['<C-e>'] = cmp.mapping.abort(),
--      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
--    }),
--    sources = cmp.config.sources({
--      { name = 'nvim_lsp' },
--      { name = 'vsnip' }, -- For vsnip users.
--      { name = 'luasnip' }, -- For luasnip users.
--      { name = 'ultisnips' }, -- For ultisnips users.
--      { name = 'snippy' }, -- For snippy users.
--    }, {
--      { name = 'buffer' },
--    })
--  })
--
--  -- Set configuration for specific filetype.
--  cmp.setup.filetype('gitcommit', {
--    sources = cmp.config.sources({
--      { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
--    }, {
--      { name = 'buffer' },
--    })
--  })
--
--  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
--  cmp.setup.cmdline({ '/', '?' }, {
--    mapping = cmp.mapping.preset.cmdline(),
--    sources = {
--      { name = 'buffer' }
--    }
--  })
--  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
--  cmp.setup.cmdline(':', {
--    mapping = cmp.mapping.preset.cmdline(),
--    sources = cmp.config.sources({
--      { name = 'path' }
--    }, {
--      { name = 'cmdline' }
--    })
--  })
--
--  -- Set up lspconfig.
--  local capabilities = require('cmp_nvim_lsp').default_capabilities()
--  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
--  require('lspconfig')['pyright'].setup {
--    capabilities = capabilities
--  }
--  require('lspconfig')['clangd'].setup {
--    capabilities = capabilities
--  }

  
--``k`k
--local lsp = require("lsp-zero")
--require("mason-lspconfig").setup()
--
--lsp.extend_lspconfig()
--
--vim.g.lsp_zero_extend_lspconfig = 0
--
--require('lspconfig').pyright.setup({})
--require('lspconfig').clangd.setup({})
--
--lsp.on_attach(function(client, bufnr)
--lsp.default_keymaps({buffer = bufnr})
--end)
--
--local cmp  = require('cmp')
--local cmp_action = require('lsp-zero').cmp_action()
--cmp.setup({
--window = {
--  completion = cmp.config.window.bordered(),
--  documentation = cmp.config.window.bordered(),
--},
--mapping = cmp.mapping.preset.insert({
--    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
--    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
--    ['<C-y>'] = cmp.mapping.confirm({select = true}),
--    ['<C-space>'] = cmp.mapping.complete(),
--    })
--})
--
--local cmp = require('cmp')
--
--cmp.setup({
--sources = {
--  {name = 'nvim_lsp'},
--}
--})

--lsp.setup_nvim_cmp({
--    mapping = cmp_mappings
--})
--
--lsp.setup()
