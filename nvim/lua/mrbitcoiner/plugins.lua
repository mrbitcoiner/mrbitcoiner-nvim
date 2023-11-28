local M = {}

M.setup = function()
	local plugins = {
		"williamboman/mason.nvim",
		"neovim/nvim-lspconfig",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/nvim-cmp",
		"L3MON4D3/LuaSnip",
	}
	require("lazy").setup(plugins)
	require("mason").setup()
	require("mason-lspconfig").setup({
		ensure_installed = {
			"gopls",
			"rust_analyzer",
			"clangd",
			"lua_ls",
			"tsserver",
			"cssls",
			"html",
		},
	})

	local lspconfig = require("lspconfig")
	local cmp = require("cmp")
	local luasnip = require("luasnip")
	cmp.setup({
		snippet = {
			expand = function(args)
				luasnip.lsp_expand(args.body)
			end
		},
		sources = {
			{ name = "nvim_lsp" },
			{ name = "buffer" },
		},
		mapping = cmp.mapping.preset.insert({
			["<C-u>"] = cmp.mapping.scroll_docs(-4),
			["<C-d>"] = cmp.mapping.scroll_docs(4),
			["<Tab>"] = cmp.mapping.select_next_item(),
			["<S-Tab>"] = cmp.mapping.select_prev_item(),
			["<C-Space>"] = cmp.mapping.complete(),
			["<CR>"] = cmp.mapping.confirm {
				behavior = cmp.ConfirmBehavior.Replace,
				select = true,
			},
		})
	})
	local capabilities = require("cmp_nvim_lsp").default_capabilities()
	local on_attach = function()
			vim.keymap.set("n", "<leader>gd", ":lua vim.lsp.buf.definition()<CR>")
			vim.keymap.set("n", "<leader>q", ":lua vim.diagnostic.open_float()<CR>")
			vim.keymap.set("n", "<leader>ra", ":lua vim.lsp.buf.rename(\"")
	end
	lspconfig.gopls.setup {
		on_attach = on_attach,
		capabilities = capabilities,
	}
	lspconfig.rust_analyzer.setup {
		on_attach = on_attach,
		capabilities = capabilities,
	}
	lspconfig.clangd.setup {
		on_attach = on_attach,
		capabilities = capabilities,
	}
	lspconfig.lua_ls.setup {
		on_attach = on_attach,
		capabilities = capabilities,
	}
	lspconfig.tsserver.setup {
		on_attach = on_attach,
		capabilities = capabilities,
	}
	lspconfig.cssls.setup {
		on_attach = on_attach,
		capabilities = capabilities,
	}
	lspconfig.html.setup {
		on_attach = on_attach,
		capabilities = capabilities,
	}

end

return M
