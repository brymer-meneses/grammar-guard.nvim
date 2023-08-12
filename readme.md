
```
  _____                                _____                 __
 / ___/______ ___ _  __ _  ___ _____  / ___/_ _____ ________/ /
/ (_ / __/ _ `/  ' \/  ' \/ _ `/ __/ / (_ / // / _ `/ __/ _  / 
\___/_/  \_,_/_/_/_/_/_/_/\_,_/_/    \___/\_,_/\_,_/_/  \_,_/  
                                                               
```

## 🚧 Status 

This plugin is archived. It was created when there wasn't an easy way to
install the `ltex` language server, prefer using [mason.nvim](https://github.com/williamboman) instead.


## ℹ️ Introduction

Grammar Guard is a [Neovim](https://github.com/neovim/neovim) plugin that uses [ltex-ls](https://github.com/valentjn/ltex-ls) to check your grammar.

It uses the built-in Neovim LSP to provide feedback while you're writing your L<big><sup>A</sup></big>T<big><sub>E</sub></big>X or Markdown Documents.

![Demo](assets/demo.gif)

## 🌟 Features
* Easy installer, just run `:GrammarInstall` from Neovim (requires [nvim-lsp-installer](https://github.com/williamboman/nvim-lsp-installer)).
* L<big><sup>A</sup></big>T<big><sub>E</sub></big>X, Markdown or plain text grammar checking.
* Integrates well with [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig).
* Work properly on Windows, Linux, MacOS.

## ⚡️ Requirements

+ Neovim >= 0.5.0

## 📦 Installation

Install via your favorite package manager:

To install `grammar-guard.nvim` you need to install it with your preferred neovim package manager.

#### [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use {
    "brymer-meneses/grammar-guard.nvim",
    requires = {
        "neovim/nvim-lspconfig",
        "williamboman/nvim-lsp-installer"
    }
}
```

Run `:GrammarInstall` or with [nvim-lsp-installer](https://github.com/williamboman/nvim-lsp-installer) `:LspInstall ltex`

Run `:LspInstallInfo` for more information about installed servers.

## ⚙️ Setup

Integrate the following to your neovim configuration:

```lua
-- hook to nvim-lspconfig
require("grammar-guard").init()
```
After that, you should tune the LSP configuration to your liking.

Example Configuration:
```lua
-- setup LSP config
require("lspconfig").grammar_guard.setup({
  cmd = { '/path/to/ltex-ls' }, -- add this if you install ltex-ls yourself
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

