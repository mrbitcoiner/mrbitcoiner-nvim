local M = {}

M.setup = function()
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
	vim.cmd(":colorscheme torte")

	vim.keymap.set("n", "<leader>ex", ":Explore<CR>")
	vim.keymap.set("n", "<leader>cc", ":set colorcolumn=80<CR>")
	vim.keymap.set("n", "<leader>ncc", ":set colorcolumn-=80<CR>")
	vim.keymap.set("n", "<leader>t", ":tabnew<CR>")
	vim.keymap.set("n", "<leader>x", ":tabclose<CR>")
	vim.keymap.set("n", "<Tab>", ":tabnext<CR>")
	vim.keymap.set("n", "<S-Tab>", ":tabprevious<CR>")
	vim.keymap.set("i", "<C-j>", "<Down>")
	vim.keymap.set("i", "<C-k>", "<Up>")

	vim.keymap.set("i", "<C-a>", "<C-x><C-o>")
end

return M
