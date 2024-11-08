require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls", "pyright"}
})

local lspconfig = require('lspconfig')

local lsp_defaults = lspconfig.util.default_config

lsp_defaults.capabilities = vim.tbl_deep_extend(
  'force',
  lsp_defaults.capabilities,
  require('cmp_nvim_lsp').default_capabilities()
)

require("lspconfig").lua_ls.setup {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          [vim.fn.expand "$VIMRUNTIME/lua"] = true,
          [vim.fn.stdpath "config" .. "/lua"] = true,
        },
      },
    },
  }
}
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

require("lspconfig").solargraph.setup({})
require("lspconfig").gopls.setup({})
require("lspconfig").tailwindcss.setup({})
require("lspconfig").pyright.setup({capabilities = capabilities})

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})

local cmp = require('cmp')

cmp.setup({
  completion = {
    autocomplete = { require('cmp.types').cmp.TriggerEvent.TextChanged }
  },
  sources = {
    { name = 'nvim_lsp' },  -- For LSP-based completion
    { name = 'buffer' },    -- For buffer words completion
    { name = 'path' },      -- For file path completion
    { name = 'luasnip' },   -- For snippets
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
})


--local lsp_zero = require('lsp-zero')
--lsp_zero.on_attach(function(client, bufnr)
--  local opts = {buffer = bufnr, remap = false}
--
--  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
--  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
--  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
--  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
--  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
--  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
--  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
--  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
--  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
--  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
--end)

--require('lsp-zero').preset({})
--
--require('mason').setup({})
--require('mason-lspconfig').setup({
--  ensure_installed = {'pyright','tsserver'},  -- Only pyright
--  handlers = {
--    function(server_name)
--      if server_name ~= "tsserver" then
--        require('lsp-zero').default_setup(server_name)
--      end
--    end,
--    lua_ls = function()
--      local lua_opts = require('lsp-zero').nvim_lua_ls()
--      require('lspconfig').lua_ls.setup(lua_opts)
--    end,
--  }
--})

--require('mason').setup({})
--require('mason-lspconfig').setup({
--  ensure_installed = {'pyright'},
--    handlers = {
--    function(server_name)
--      if server_name ~= "tsserver" then
--        lsp_zero.default_setup(server_name)
--      end
--    end,
--    lua_ls = function()
--      local lua_opts = lsp_zero.nvim_lua_ls()
--      require('lspconfig').lua_ls.setup(lua_opts)
--    end,
--  }
--  handlers = {
--    lsp_zero.default_setup,
--    lua_ls = function()
--      local lua_opts = lsp_zero.nvim_lua_ls()
--      require('lspconfig').lua_ls.setup(lua_opts)
--    end,
--  }
--})


--local cmp = require('cmp')
--local cmp_select = {behavior = cmp.SelectBehavior.Select}
--
--cmp.setup({
--  sources = {
--    {name = 'path'},
--    {name = 'nvim_lsp'},
--    {name = 'nvim_lua'},
--    {name = 'luasnip', keyword_length = 2},
--    {name = 'buffer', keyword_length = 3},
--  },
--  formatting = lsp_zero.cmp_format(),
--  mapping = cmp.mapping.preset.insert({
--    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
--    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
--    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
--    ['<C-Space>'] = cmp.mapping.complete(),
--  }),
--})




