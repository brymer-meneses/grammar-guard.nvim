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
  if vim.fn.executable('ltex-ls') == 1 then
    return true
  end
	local install_path = require("grammar-guard.vars").install_path
	if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
		return false
	else
		return true
	end
end

return M
