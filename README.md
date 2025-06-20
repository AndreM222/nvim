# NVIM Dotfiles

## Contents 📦

- Neovim Configuration

## Navigation ✈️

[Back To Windows-Dotfiles <-](https://github.com/AndreM222/Windows-Dotfiles) (For Detailed Setup)

- [Navigate To Powershell Dotfiles <-](https://github.com/AndreM222/PowerShell) (For Detailed Setup)

- [Navigate To Dotfile Automizer <-](https://github.com/AndreM222/Dotfile-Automizer) (For Detailed Setup)

## Dependencies 📃

- Neovim >= 0.11.0 (needs to be built with LuaJIT)

- Nerd Fonts >= 3.0

- Chafa (Image support for telescope preview)

## Setup ⚒️

##### Scoop - Needs Installation [Windows]

- [Fira-Font](https://github.com/ryanoasis/nerd-fonts) - `scoop install FiraCode-NF-Mono`

<div align=center>or</div>

- [Fira-Font](https://formulae.brew.sh/cask/font-fira-code-nerd-font#default) - `brew install --casck font-fira-code-nerd-font`

- [Chafa](https://formulae.brew.sh/formula/chafa#default) - `brew install chafa`

##### Brew - Needs Installation [MacOS]

- [Chafa]()

## Neovim Plugins 📲

- [Lualine](https://github.com/nvim-lualine/lualine.nvim) - Neovim Bar
- [copilot](https://github.com/zbirenbaum/copilot.lua) - Copilot
  <details> <summary>Dependencies</summary>

  - [Copilot-Lualine](https://github.com/AndreM222/copilot-lualine) - Copilot Status Setup

  - [Blink-CMP-Copilot](https://github.com/giuxtaposition/blink-cmp-copilot) - Copilot Setup
  </details>

- [nvim-Web-Devicons](https://github.com/kyazdani42/nvim-web-devicons) - Icons
- [Nvim-Tree](https://github.com/kyazdani42/nvim-tree.lua) - Neovim Tree
- [Mini.Surround](https://github.com/echasnovski/mini.surround) - Sorround Selection With Desired Character
- [LSPConfig](https://github.com/neovim/nvim-lspconfig) - Keys Configuration
- [Telescope](https://github.com/nvim-telescope/telescope.nvim) - Telescope
  <details> <summary>Dependencies</summary>

  - [Plenary](https://github.com/nvim-lua/plenary.nvim) - Lua Files Setup

  - [Telescope-File-Browser](https://github.com/nvim-telescope/telescope-file-browser.nvim) - Browsing Setup

  - [Telescope-UI-Select](https://github.com/nvim-telescope/telescope-ui-select.nvim) - Select UI Setup
  </details>

- [Markdown Preview](https://github.com/iamcco/markdown-preview.nvim) - Live Markdown Preview
- [Blink.CMP](https://github.com/Saghen/blink.cmp) - Auto Complete Setup
  <details> <summary>Dependencies</summary>

  - [CMP_LuaSnip]('https://github.com/saadparwaiz1/cmp_luasnip') - Snippet Setup

  - [Friendly-Snippets](https://github.com/rafamadriz/friendly-snippets) - More Snippets
  </details>

- [Lspkind-Nvim](https://github.com/onsails/lspkind.nvim) - Icons for Nvim LSP
- [Mason-nvim](https://github.com/williamboman/mason.nvim) - Package manager for neovim
  <details> <summary>Dependencies</summary>

  - [Mason-Null-LS](https://github.com/jay-babu/mason-null-ls.nvim) - Null-LS Setup

  - [Mason-LSPConfig](https://github.com/williamboman/mason-lspconfig.nvim) - LSPConfig Setup
  </details>

- [Buffer-Line](https://github.com/akinsho/bufferline.nvim) - File Tabs
- [Git-Signs](https://github.com/lewis6991/gitsigns.nvim) - Git Changes Sign Bar
- [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - Highlight Functions
- [Comment](https://github.com/numToStr/Comment.nvim) - Commenter For Languages
- [Auto-Pair](https://github.com/jiangmiao/auto-pairs) - Auto Pair Characters
- [LuaSnip](https://github.com/L3MON4D3/LuaSnip) - Snippets
- [NVim-Colorizer](https://github.com/NvChad/nvim-colorizer.lua) - Color Preview
- [None-LS](https://github.com/nvimtools/none-ls.nvim) - Formatting Languages And Linter
- [Indent-Blankline](https://github.com/lukas-reineke/indent-blankline.nvim) - Indent Lines
- [Lspsaga](https://github.com/glepnir/lspsaga.nvim) - LSP UI
- [Nvim-NIO](https://github.com/nvim-neotest/nvim-nio) - Asynchronous IO
- [Nvim-UFO](https://github.com/kevinhwang91/nvim-ufo) - Folding Design
  <details> <summary>Dependencies</summary>

  - [Promise-Async](https://github.com/kevinhwang91/promise-async) - Port With JavaScript Setup
  </details>

- [Vim-Illuminate](https://github.com/RRethy/vim-illuminate) - Highlight
- [Dashboard-Nvim](https://github.com/nvimdev/dashboard-nvim) - Startup Screen
- [Dial](https://github.com/monaqa/dial.nvim) - Improved Increment And Decrement
- [Inc-Rename](https://github.com/smjonas/inc-rename.nvim) - Increment Renaming
- [Incline](https://github.com/b0o/incline.nvim) - Floating statusline
- [Noice](https://github.com/folke/noice.nvim) - UI For Messages, CMDLine, and Popmenu
  <details> <summary>Dependencies</summary>

  - [Nvim-Notify](https://github.com/rcarriga/nvim-notify) - Animated Notifications

  - [NUI](https://github.com/MunifTanjim/nui.nvim) - UI Component Setup
  </details>

- [Refactoring](https://github.com/ThePrimeagen/refactoring.nvim) - Refactoring
  <details> <summary>Dependencies</summary>

  - [Plenary](https://github.com/nvim-lua/plenary.nvim) - Lua Files Setup

  - [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - Highlight Functions Setup
  </details>


## Directory Structure 🗂️

```
📂 $HOME/AppData/Local/Nvim
|__📂lua/andrem222
|   |__📂 lang
|   |   |__📑 All Translations Files
|   |__📂 pluginDev
|   |   |__📑 All Personal Plugin Installation and Setup Files
|   |__📂 plugins
|   |   |__📑 All Plugin Installation and Setup Files
|   |__📄bindings.lua
|   |__📄config.lua
|   |__📄debug.lua
|   |__📄devconfig.lua
|   |__📄langMSG.lua
|   |__📄lazy.lua
|   |__📄theme.lua
|__📄init.lua
```

## Languages 🗣️
<details>
<summary>Completion, Format, Compiler, and Linter</summary>

### Servers 🗃️
---

##### Winget - Windows Installed

`C++` winget install clangd

`Lua` winget install lua-language-server

##### NodeJS - Needs Installation

`Live-Server` npm install -g live-server

`Python` npm install -g pyright

`Typescript` npm install -g typescript typescript-language-server

`Tailwind CSS` npm install -g tailwindcss-language-server

##### Dotnet - Windows Installed

`C-Sharp` dotnet tool install --global csharp-ls

### Format Languages 📄
---

`C++` at the setup of llvm

##### Pip - Needs Installation

`Python` pip install --upgrade autopep8

##### NodeJS - Needs Installation

`Marksman` npm install -g marksman

`Typescript` npm install -g prettier

### Compilers And Intrepeters ⚙️
---

##### Winget - Windows Installed

- [Python](https://www.python.org/) - At the installation of Python Package Manager

- [Rust](https://www.rust-lang.org/) - At the installation of Rust Package Manager

- [C++](https://winlibs.com/) - winget install -i LLVM.LLVM

##### NodeJS - Needs Installation

- [NodeJS](https://github.com/nvm-sh/nvm) - At the installation of NodeJS Package Manager
</details>

## Translations 🌐

Because I am currently learning japanese and trying to use it daily I wanted to change the language
of the setup. But knowing some people who use english may want to use my setup I have decided to add
translations in the dotfiles.

When run nvim will pass the language you have set and translate it to the desired language.
If no language available or translation than it will setup the default message.

> [!WARNING]
> Japanese is now available. Translations might still be a bit wierd.
> Will improve them as I keep learning the language.

Format for translations:
```json
    "Message to print (message Id)": {
        "msgstr (Translated message/Id)": ""
    },

```

Location of translation files:
```
📂 $HOME/AppData/Local/Nvim/lua/andrem222/lang
|__📑 All Translations Files
```


## Info ℹ️

> [!INFO]
> To visualize on vim the keybindings press F5. I also documented all my custom bindings.

<details>
<summary>Debugging 🐞</summary>

Problem: `Icons are not showing completly`

Fix:
```
Some fonts do not work well with some color themes and can cause that issue or the terminal.
You have to try until you find the right font, switch the theme, terminal or make tweaks by yourself. Generaly fonts ending with mono work.
```

problem: `Transparency Not Available`

Fix:
```lua
Check you enabled transparency in the temrinal. If you still encounter
problems then you probably have to enable it from your nvim configuration.
Dracula theme transparency is not sufficient so some tweaks are requried.
For example:
                colors = {},
                transparent_bg = true,
                show_end_of_buffer = true,
                overrides = {
                    EndOfBuffer = { fg = "#282A36" }
                },

This will disable the background from dracula so transparency can be seen.
```

Problem: `C-Sharp not running`

Fix: `You are required to create a project for it to work`

Problem: `Customize format`

Fix:
```
Look for the documentation to make the changes on the CLI.

For clang-format: https://clang.llvm.org/docs/ClangFormat.html
For prettier: https://prettier.io/docs/en/options.html#vue-files-script-and-style-tags-indentation
```

Problem: `C++ compiler not working`

Fix:
```
When installing LLVM choose add to path.
Also be use clang if you are using LLVM
```

Problem: `Markdown-Preview not installing`

Fix:
```
In case of not installing. You can go directly to the installed plugins
folder, and run the installer manually.
```

</details>
