local M = {}
M.install = function()
	-- install ltex-lsp server
	require("grammar-guard.installer").install_ltex_ls()
end

M.init = function()
	-- hook to nvim-lspconfig
	require("grammar-guard.base-config").setup()

	-- check if ltex-ls is installed
	require("grammar-guard.utils")._check_ltex_installation()
end

return M
