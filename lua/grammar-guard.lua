local M = {}
local is_ltex_installed = require("grammar-guard.utils")._check_ltex_installation()

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
