local lsp = require('lsp-zero')

lsp.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp.default_keymaps({buffer = bufnr})
end)

require("mason").setup({
    automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require("mason-lspconfig").setup({
  ensure_installed = {"lua_ls", "clangd", "phpactor", "jdtls"},
  automatic_installation = true,
	require("lspconfig").lua_ls.setup{ capabilities = capabilities },
	require("lspconfig").clangd.setup{},
	require("lspconfig").jdtls.setup{
		root_dir = function(fname)
			return vim.loop.cwd()
		end,
	},
	require("lspconfig").phpactor.setup{
		root_dir = function(fname)
        return vim.loop.cwd()
    end,
		capabilities = capabilities,
	}
})


-- require("lspconfig").lua_ls.setup{}
-- require'lspconfig'.clangd.setup{}
