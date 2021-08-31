
```
  _____                                _____                 __
 / ___/______ ___ _  __ _  ___ _____  / ___/_ _____ ________/ /
/ (_ / __/ _ `/  ' \/  ' \/ _ `/ __/ / (_ / // / _ `/ __/ _  / 
\___/_/  \_,_/_/_/_/_/_/_/\_,_/_/    \___/\_,_/\_,_/_/  \_,_/  
                                                               
```
                                                                                                             

## Introduction
Grammar Guard is a [Neovim](https://github.com/neovim/neovim) plugin that uses [ltex-ls](https://github.com/valentjn/ltex-ls) to 
check your grammar.

It uses the built-in Neovim LSP to provide feedback while you're writing your LaTeX or Markdown Documents.

![Demo](https://imgur.com/kiuTDT1)

## Features
* Easy installer, just run `:GrammarInstall` from Neovim.
* LaTeX, Markdown, or plain text grammar checking.
* Integrates well with [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig).

## Status
This plugin is currently on alpha stage, expect some changes to the API.

## Installation
To install `grammar-guard.nvim` you need to install it with your preferred neovim package manager.

Using [packer.nvim](https://github.com/wbthomason/packer.nvim):
```lua
use {
    "brymer-meneses/grammar-guard.nvim",
    requires = "neovim/nvim-lspconfig"
}
```

## Setup
First you need to run `:GrammarInstall` to install the ltex language server.
Then, integrate the following to your neovim configuration.

```lua
-- hook to nvim-lspconfig
require("grammar-guard").init()
```

After that, you should tune the LSP configuration to your liking.


Example Configuration:
```lua
-- setup LSP config
require("lspconfig").grammar_guard.setup({
	settings = {
		ltex = {
			enabled = { "latex", "tex", "bib", "markdown" },
			language = "en",
			diagnosticSeverity = "information",
			setenceCacheSize = 2000,
			additionalRules = {
				enablePickyRules = true,
				motherTongue = "en",
			},
			trace = { server = "verbose" },
			dictionary = {},
			disabledRules = {},
			hiddenFalsePositives = {},
		},
	},
})
```

## Disclaimer:
This plugin is *largely based* on the following [pull request](https://github.com/neovim/nvim-lspconfig/pull/863).

