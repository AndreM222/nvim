-- Setup for startup
vim.opt.termguicolors = true
vim.opt.winblend = 0
vim.opt.wildoptions = 'pum'
vim.opt.pumblend = 10
vim.opt.fillchars = { eob = ' ' }

vim.opt.encoding = 'utf-8'
vim.scriptencoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.updatetime = 100

vim.opt.wrap = false -- No Wrap lines
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.cursorline = true
vim.opt.title = true
vim.opt.cursorlineopt = 'number'
vim.opt.clipboard = 'unnamedplus'
vim.opt.backup = false
vim.opt.signcolumn = "yes:1"
vim.opt.breakindent = true
vim.opt.ai = true
vim.opt.si = true
vim.opt.backspace = { 'start', 'eol', 'indent' }
vim.opt.path:append({ "**" }) -- Finding files - Search down into subfolders
vim.opt.wildignore:append({ "*/node_modules/*" })
vim.opt.backupskip = { "/tmp/*", "/private/tmp/*" }
vim.opt.scrolloff = 10
vim.opt.ignorecase = true -- Case insensitive searching UNLESS /C or capital in search
vim.opt.showcmd = true
vim.opt.laststatus = 3
vim.opt.incsearch = true
vim.opt.mouse = ""

vim.opt.autoindent = true
vim.opt.smarttab = true
vim.opt.smartindent = true

vim.opt.splitbelow = true -- Put new windows below current
vim.opt.splitright = true -- Put new windows right of current
vim.opt.splitkeep = "cursor"

-- Remove indent line in dashboard
vim.g.indent_blankline_filetype_exclude = { 'dashboard' }

-- Add asterisks in block comments
vim.opt.formatoptions:append({ "r" })

if (os.getenv("WINDIR") and not os.getenv("WSL_INTEROP")) then
    vim.opt.shell = "pwsh -NoLogo"
    vim.opt.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
    vim.opt.shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait"
    vim.opt.shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
    vim.opt.shellquote = ""
    vim.opt.shellxquote = ""
else
    vim.opt.shell = os.getenv('SHELL')
end

-- Folding Setup
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true
vim.opt.foldcolumn = "1"

vim.opt.statuscolumn =
'%s%=%{&nu? (&rnu? (v:relnum?v:relnum:v:lnum) : v:lnum) : ""} %{&foldenable? (foldlevel(v:lnum) > foldlevel(v:lnum - 1) ? (foldclosed(v:lnum) == -1 ? " " : " ") : "  ") : ""}'
