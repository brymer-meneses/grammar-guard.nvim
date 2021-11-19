
" check for recent version of neovim
if !has('nvim-0.5')
  echoerr 'Neovim Version should be >= 0.5'
  finish
endif

command GrammarInstall LspInstall ltex

