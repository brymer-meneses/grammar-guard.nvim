local M = {}

-- Using nvim-lsp-installer path
M.install_path = vim.fn.stdpath("data") .. "/lsp_servers/ltex/ltex-ls/bin"

if vim.fn.has("win32") == 1 then
    M.bin = "/ltex-ls.bat"
else
    M.bin ="/ltex-ls"
end

M.bin_path = M.install_path .. M.bin

return M
