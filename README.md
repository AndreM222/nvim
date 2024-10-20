# NVIM Dotfiles

## Contents 📦

- Neovim Configuration

## Navigation ✈️

[Back To Windows-Dotfiles <-](https://github.com/AndreM222/Windows-Dotfiles) (For Detailed Setup)

- [Navigate To Powershell Dotfiles <-](https://github.com/AndreM222/PowerShell) (For Detailed Setup)

- [Navigate To Dotfile Automizer <-](https://github.com/AndreM222/Dotfile-Automizer) (For Detailed Setup)

## Dependencies 📃

- Neovim >= 0.10.0 (needs to be built with LuaJIT)

- Nerd Fonts >= 3.0

## Setup ⚒️

##### Package Managers 📦

- [Python](https://www.python.org/) - `winget install python3` - <span style="opacity:30%">pip</span>

- [Scoop](https://scoop.sh/) - `irm get.scoop.sh | iex` - <span style="opacity:30%">scoop</span>

- [NVM | NodeJS](https://github.com/coreybutler/nvm-windows) - <span style="opacity:30%">npm</span>

```
winget install CoreyButler.NVMforWindows
nvm install lts
nvm use lts
```

##### Scoop - Needs Installation

- [Fira-Font](https://github.com/ryanoasis/nerd-fonts) - `scoop install FiraCode-NF-Mono`

## Neovim Plugins 📲

- [Lualine](https://github.com/nvim-lualine/lualine.nvim) - Neovim Bar
- [copilot](https://github.com/zbirenbaum/copilot.lua) - Copilot
  <details> <summary>Dependencies</summary>

  - [Copilot-Lualine](https://github.com/AndreM222/copilot-lualine) - Copilot Status Setup

  - [Copilot-CMP](https://github.com/hrsh7th/cmp-copilot) - Copilot Setup
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
- [Nvim-CMP](https://github.com/hrsh7th/nvim-cmp) - Auto Complete Setup
  <details> <summary>Dependencies</summary>

  - [CMP_LuaSnip]('https://github.com/saadparwaiz1/cmp_luasnip') - Snippet Setup

  - [Friendly-Snippets](https://github.com/rafamadriz/friendly-snippets) - More Snippets

  - [CMP-Nvim-LSP](https://github.com/hrsh7th/cmp-nvim-lsp) - LSP Setup

  - [CMP-Buffer](https://github.com/hrsh7th/cmp-buffer) - Buffer Setup
  </details>

- [Lspkind-Nvim](https://github.com/onsails/lspkind.nvim) - Icons for Nvim LSP
- [Mason-nvim](https://github.com/williamboman/mason.nvim) - Package manager for neovim
  <details> <summary>Dependencies</summary>

  - [Mason-Null-LS](https://github.com/jay-babu/mason-null-ls.nvim) - Null-LS Setup

  - [Mason-LSPConfig](https://github.com/williamboman/mason-lspconfig.nvim) - LSPConfig Setup

  - [Mason-Nvim-DAP](https://github.com/jay-babu/mason-nvim-dap.nvim) - DAP Setup
  </details>

- [Buffer-Line](https://github.com/akinsho/bufferline.nvim) - File Tabs
- [Git-Signs](https://github.com/lewis6991/gitsigns.nvim) - Git Changes Sign Bar
- [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - Highlight Functions
- [Comment](https://github.com/numToStr/Comment.nvim) - Commenter For Languages
- [Auto-Pair](https://github.com/jiangmiao/auto-pairs) - Auto Pair Characters
- [Close-Tag](https://github.com/windwp/nvim-ts-autotag) - Close Tags
- [LuaSnip](https://github.com/L3MON4D3/LuaSnip) - Snippets
- [NVim-Colorizer](https://github.com/NvChad/nvim-colorizer.lua) - Color Preview
- [None-LS](https://github.com/nvimtools/none-ls.nvim) - Formatting Languages And Linter
- [Indent-Blankline](https://github.com/lukas-reineke/indent-blankline.nvim) - Indent Lines
- [Lspsaga](https://github.com/glepnir/lspsaga.nvim) - LSP UI
- [DAP](https://github.com/mfussenegger/nvim-dap) - Debugger
  <details> <summary>Dependencies</summary>

  - [Nvim-DAP-UI](https://github.com/rcarriga/nvim-dap-ui) - UI Setup

  - [Nvim-DAP-Virtual-Text](https://github.com/theHamsta/nvim-dap-virtual-text) - Virtual Text Setup

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
|   |__📂 pluginDev
|   |   |__📑 All Personal Plugin Installation and Setup Files
|   |__📂 plugins
|   |   |__📑 All Plugin Installation and Setup Files
|   |__📄bindings.lua
|   |__📄config.lua
|   |__📄debug.lua
|   |__📄devconfig.lua
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

## Info ℹ️

Read: `To visualize on vim the keybindings press F3. I also documented all my custom bindings.`

<details>
<summary>Custom Mappings ⌨️</summary>

`\ + f` - Telescope Find Files

`\ + r` - Telescope Live Grep

`\ + \ + \` - Telescope Buffers

`\ + t` - Telescope

`\ + r` - Telescope Resume Search

`\ + w` - Telescope Diagnostics

`\ + g` - Telescope Git-Status

`F2` - Telescope Help Tags

`F3` - Telescope Keymaps

`F5` - Lsp Status

`F6` - Null-LS Status

`Alt - Up` - Move Line | Block up

`Alt - Down` - Move Line | Block Down

`Alt - Left` - Move Line | Block Left

`Alt - Right` - Move Line | Block Right

`Shift - f` - Format

`K` - Lspsaga Hover Doc

`Alt - k` - Lspsaga Peek Definition

`Ctrl - k` - Lspsaga Go To Definition

`g + d` - lspsaga Finder

`g + p` - Lspsaga Code Actions

`Ctrl - j` - Lspsaga Jump Diagnostic Forward

`Ctrl - Shift- j` - Lspsaga Jump Diagnostic Reverse

`g - l` - Lspsaga Line Diagnostic

`g + r` - Lspsaga Rename

`s + s` - Horizontal Split

`s + v` - Vertical Split

`Ctrl - Alt - k` - Increase Pane Vertical

`Ctrl - Alt - i` - Decrease Pane Vertical

`Ctrl - Alt - l` - Increase Pane Horizontal

`Ctrl - Alt - j` - Decrease Pane Horizontal

`s + k` - Pane Move Up

`s + j` - Pane Move Down

`s + h` - Pane Move Left

`s + l` - Pane Move Right

`F9` - Debugger Continue

`F10` - Debugger Step Over

`F11` - Debugger Step Into

`F12` - Debugger Step Out

`\ + b + b` - Debugger Breakpoint

`\ + b + c` - Debugger Breakpoint With Conditions

`\ + b + l` - Debugger Breakpoint With Log Message

`\ + b + u` - Debugger Toggle

`Alt - =` - Open Fold All

`Alt - -` - Close Fold All

`+` - Open Folds Selected

`_` - Close Folds Selected

`CTRL - /` - Comment Line In Line

`CTRL - Alt - /` - Comment BLock

`Esc` - Clear hlsearch

`\p` - Paste Without Deleting

`\d` - Delete Without Deleting
</details>

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
```
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

Problem: `Scoop buckets wont update`

Fix:
```
scoop config SCOOP_BRANCH master
scoop update
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
