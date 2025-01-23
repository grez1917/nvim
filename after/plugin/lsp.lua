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

require('cmp').setup{
	sources = {
		{ name = 'nvim_lsp'}
	},
	completion = {
		autocompete = true
	}
}

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require("mason-lspconfig").setup({
  ensure_installed = {"lua_ls", "clangd", "jdtls", "pylsp"},
  automatic_installation = true,
	require("lspconfig").lua_ls.setup{ capabilities = capabilities },
	require("lspconfig").clangd.setup{},
	require("lspconfig").jdtls.setup{
		root_dir = function(fname)
			return vim.loop.cwd()
		end,
	},
	require("lspconfig").phpactor.setup{
		cmd = { 'phpactor', 'language-server', '-vvv' },
		filetypes = { 'php' },
		on_attach = on_attach,
		root_dir = function(fname)
        return vim.loop.cwd()
    end,
		capabilities = capabilities,
	},
	require("lspconfig").pylsp.setup {
		on_attach = custom_attach,
		settings = {
				pylsp = {
				plugins = {
						-- formatter options
						black = { enabled = true },
						autopep8 = { enabled = false },
						yapf = { enabled = false },
						-- linter options
						pylint = { enabled = true, executable = "pylint" },
						pyflakes = { enabled = false },
						pycodestyle = { enabled = false },
						-- type checker
						pylsp_mypy = { enabled = true },
						-- auto-completion options
						jedi_completion = { fuzzy = true },
						-- import sorting
						pyls_isort = { enabled = true },
				},
				},
		},
		flags = {
				debounce_text_changes = 200,
		},
		capabilities = capabilities,
		}
})


require("lspconfig").lua_ls.setup{}
require'lspconfig'.clangd.setup{}
