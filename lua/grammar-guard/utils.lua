local M = {}
M.read_files = function(files)
	local dict = {}
	for _, file in ipairs(files) do
		if not file then
			return nil
		end

		for line in io.lines(file) do
			table.insert(dict, line)
		end
	end
	return dict
end

M._check_ltex_installation = function()
	local install_path = require("grammar-guard.vars").install_path
	if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
		vim.notify("[grammar-guard] The ltex language server has not been installed.")
	end
end

return M
