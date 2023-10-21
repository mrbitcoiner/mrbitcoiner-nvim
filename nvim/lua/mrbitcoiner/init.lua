local M = {}

M.setup = function()
	require("mrbitcoiner.lazy").setup()
	require("mrbitcoiner.plugins").setup()
	require("mrbitcoiner.vimrc").setup()
end

return M
