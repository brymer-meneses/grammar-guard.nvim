local M = {}

M.install_ltex_ls = function()
	local path = require("grammar-guard.vars").install_path
	local function onExit(_, code)
		if code ~= 0 then
			if vim.fn.delete(path, "rf") ~= 0 then -- here 0: success, -1: fail
				error("[grammar-guard] Could not delete directory grammar-guard.")
			end
			error("[grammar-guard] Could not install language server.")
		end
		vim.notify("[grammar-guard] Successfully installed language server.")
	end
	local install_script = [[
      os=$(uname -s | tr "[:upper:]" "[:lower:]")
      case $os in
      linux)
      platform="linux"
      ;;
      darwin)
      platform="macos"
      ;;

      esac
      curl -L -o ltex.tar.gz $(curl -s https://api.github.com/repos/valentjn/ltex-ls/releases/latest | grep 'browser_' | cut -d\" -f4 | grep "$platform")
      tar -xzf ltex.tar.gz
      rm ltex.tar.gz
      for i in ./*ltex*; do mv "$i" "ltex";done
      ]]

	vim.fn.mkdir(path, "p")
	vim.cmd("new")
	local shell = vim.o.shell
	vim.o.shell = "/usr/bin/env bash"
	vim.fn.termopen("set -e\n" .. install_script, { cwd = path, on_exit = onExit })
	vim.o.shell = shell
	vim.cmd("startinsert")
end

return M
