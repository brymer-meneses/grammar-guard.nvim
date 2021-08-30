local M = {}
local is_ltex_installed = require("grammar-guard.utils")._check_ltex_installation()
M.install = function()
	if is_ltex_installed then
		vim.notify("[grammar-guard] The ltex language server has already been installed.")
		return
	end
	-- install ltex-lsp server
	require("grammar-guard.installer").install_ltex_ls()
end

M.init = function()
	-- check if ltex-ls is installed
	if not is_ltex_installed then
		vim.notify(
			"[grammar-guard] The ltex language server has not been installed. Run :GrammarInstall to install it."
		)
		return
	end
	-- hook to nvim-lspconfig
	require("grammar-guard.base-config").setup()
end

return M
