-- 
-- mason
--
require('mason').setup()
require('mason-lspconfig').setup()


-- 
-- Setup language servers
--
local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local on_attach = function(_, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  vim.api.nvim_buf_set_option(bufnr, 'tagfunc', 'v:lua.vim.lsp.tagfunc')
end

lspconfig.pyright.setup { capabilities = capabilities, on_attach = on_attach }
lspconfig.tsserver.setup {
  on_attach = on_attach,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript", "javascriptreact", "javascript.jsx" },
  capabilities = capabilities
}
lspconfig.custom_elements_ls.setup { capabilities = capabilities, on_attach = on_attach }
lspconfig.cssls.setup { capabilities = capabilities, on_attach = on_attach }
lspconfig.html.setup { capabilities = capabilities, on_attach = on_attach }
lspconfig.lua_ls.setup { capabilities = capabilities, on_attach = on_attach }


--
-- keybindings
--
keymap = vim.keymap

keymap.set('n', '<Space>lo', vim.diagnostic.open_float)
keymap.set('n', '<Space>lp', vim.diagnostic.goto_prev)
keymap.set('n', '<Space>ln', vim.diagnostic.goto_next)
keymap.set('n', '<space>ll', vim.diagnostic.setloclist)


vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    local opts = { buffer = ev.buf }
    keymap.set('n', '<Space>lD', vim.lsp.buf.declaration, opts)
    keymap.set('n', '<Space>ld', vim.lsp.buf.definition, opts)
    keymap.set('n', '<Space>lh', vim.lsp.buf.hover, opts)
    keymap.set('n', '<Space>li', vim.lsp.buf.implementation, opts)
    keymap.set('n', '<Space>ls', vim.lsp.buf.signature_help, opts)
    keymap.set('n', '<Space>lf', vim.lsp.buf.add_workspace_folder, opts)
    keymap.set('n', '<Space>lr', vim.lsp.buf.remove_workspace_folder, opts)
    keymap.set('n', '<Space>lF', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    keymap.set('n', '<Space>lt', vim.lsp.buf.type_definition, opts)
    keymap.set('n', '<Space>lR', vim.lsp.buf.rename, opts)
    keymap.set({ 'n', 'v' }, '<Space>lc', vim.lsp.buf.code_action, opts)
    keymap.set('n', '<Space>lH', vim.lsp.buf.references, opts)
    keymap.set('n', '<space>lI', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})
