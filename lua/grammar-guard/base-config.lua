local M = {}

M.setup = function()
	local configs = require("lspconfig/configs")
	local util = require("lspconfig/util")

	local bin_path = require("grammar-guard.vars").bin_path

	configs.grammar_guard = {
		default_config = {
			cmd = { bin_path },
			filetypes = { "tex", "bib", "markdown" },
			root_dir = function(filename)
				return util.path.dirname(filename)
			end,
			settings = {
				ltex = {
					checkFrequency = "edit",
					enabled = { "latex", "markdown", "bib" },
				},
			},
		},
		docs = {
			package_json = "https://raw.githubusercontent.com/valentjn/vscode-ltex/develop/package.json",
			description = [[
                https://github.com/valentjn/ltex-ls

                LTeX Language Server: LSP language server for LanguageTool 🔍✔️ with support for LaTeX 🎓, Markdown 📝, and others

                To install, download the latest [release](https://github.com/valentjn/ltex-ls/releases) and ensure `ltex-ls` is on your path.

                ]],

			default_config = {
				root_dir = "vim's starting directory",
			},
		},
	}
end

return M
