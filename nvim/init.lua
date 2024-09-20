local M = {}

M.lazySetup = function()
	local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
	if not vim.loop.fs_stat(lazypath) then
		vim.fn.system({
			"git",
			"clone",
			"--filter=blob:none",
			"https://github.com/folke/lazy.nvim.git",
			"--branch=stable",
			lazypath,
		})
	end
	vim.opt.rtp:prepend(lazypath)
end

M.pluginsSetup = function()
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
			"ts_ls",
			"cssls",
			"html",
			"pylsp"
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
	lspconfig.pylsp.setup {
		on_attach = on_attach,
		capabilities = capabilities,
	}
end

M.vimRCSetup = function()
	vim.g.mapleader = " "

	vim.cmd(":syntax on")
	vim.cmd(":set number")
	vim.cmd(":set relativenumber")
	vim.cmd(":set tabstop=2")
	vim.cmd(":set shiftwidth=2")
	vim.cmd(":set softtabstop=2")
	vim.cmd(":set autoindent")
	vim.cmd(":set smartindent")
	vim.cmd(":set noexpandtab")
	vim.cmd(":set scrolloff=8")
	vim.cmd(":set showcmd")
	vim.cmd(":set ruler")
	vim.cmd(":colorscheme habamax")

	vim.keymap.set("n", "<leader>ex", ":Explore<CR>")
	vim.keymap.set("n", "<leader>cc", ":set colorcolumn=80<CR>")
	vim.keymap.set("n", "<leader>ncc", ":set colorcolumn-=80<CR>")
	vim.keymap.set("n", "<leader>t", ":tabnew<CR>")
	vim.keymap.set("n", "<leader>x", ":tabclose<CR>")
	vim.keymap.set("n", "<Tab>", ":tabnext<CR>")
	vim.keymap.set("n", "<S-Tab>", ":tabprevious<CR>")
	vim.keymap.set("n", "<C-j>", "<C-w>j")
	vim.keymap.set("n", "<C-k>", "<C-w>k")
	vim.keymap.set("n", "<C-l>", "<C-w>l")
	vim.keymap.set("n", "<C-h>", "<C-w>h")
	vim.keymap.set("n", "=", "<C-w>+")
	vim.keymap.set("n", "-", "<C-w>-")
	vim.keymap.set("n", "+", "<C-w>>")
	vim.keymap.set("n", "_", "<C-w><")
	vim.keymap.set("t", "<C-x>", "<C-\\><C-n>")
	vim.keymap.set("i", "<C-a>", "<C-x><C-o>")
end

M.lazySetup()
M.pluginsSetup()
M.vimRCSetup()
