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

return M
