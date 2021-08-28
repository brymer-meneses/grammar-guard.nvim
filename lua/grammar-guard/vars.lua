local M = {}

M.install_path = vim.fn.stdpath("data") .. "/grammar-guard/"
M.bin_path = M.install_path .. "/ltex/bin/ltex-ls"

return M
