local keymap = vim.keymap

-- Telescope Bindings
keymap.set('n', '\\t', '<Cmd>BrowseFiles<CR>', { silent = true }, { desc = "Browse Files" })
keymap.set('n', '\\r', '<Cmd>ResumeSearch<CR>', { silent = true }, { desc = "Resume Search" })
keymap.set('n', '\\f', '<Cmd>FileParse<CR>', { silent = true }, { desc = "File Parse" })
keymap.set('n', '\\l', '<cmd>Telescope live_grep<cr>', { silent = true }, { desc = "Live Grep" })
keymap.set('n', '\\w', '<Cmd>Telescope diagnostics<CR>', { silent = true }, { desc = "Show Diagnostics" })
keymap.set('n', '\\g', '<Cmd>Telescope git_status<CR>', { silent = true }, { desc = "Browse Files" })
keymap.set('n', '\\\\', '<Cmd>Telescope buffers<CR>', { silent = true }, { desc = "Show Buffers" })
keymap.set('n', '<F3>', '<Cmd>Telescope help_tags<CR>', { silent = true }, { desc = "Show Help Tags" })
keymap.set('n', '<F4>', '<Cmd>Telescope keymaps<CR>', { silent = true }, { desc = "Show Keymaps" })
keymap.set('n', '<F5>', '<Cmd>Telescope notify<CR>', { silent = true }, { desc = "Show Notifications" })

-- Installations
keymap.set('n', '<S-Home>', '<Cmd>Mason<CR>', { silent = true }, { desc = "Open Mason" })
keymap.set('n', '<Home>', '<Cmd>Lazy<CR>', { silent = true }, { desc = "Open Lazy" })

-- Status
keymap.set('n', '<F6>', '<Cmd>LspInfo<CR>', { silent = true }, { desc = "LSP Info" })
keymap.set('n', '<F7>', '<Cmd>NullLsInfo<CR>', { silent = true }, { desc = "NullLS Info" })

-- Moving Selections
keymap.set({ 'n', 'i' }, '<A-Down>', '<Esc>:m .+1<CR>==', { silent = true }, { desc = "Move Selection Down" })
keymap.set({ 'n', 'i' }, '<A-Up>', '<Esc>:m .-2<CR>==', { silent = true }, { desc = "Move Selection Up" })
keymap.set('v', '<A-Down>', [[:m '>+1<CR>gv=gv]], { silent = true }, { desc = "Move Selection Down" })
keymap.set('v', '<A-Up>', [[:m '<-2<CR>gv=gv]], { silent = true }, { desc = "Move Selection Up" })

keymap.set({ 'n', 'i' }, '<A-Left>', '<Esc><<', { desc = "Move Selection Left" })
keymap.set({ 'n', 'i' }, '<A-Right>', '<Esc>>>', { desc = "Move Selection Right" })
keymap.set('v', '<A-Left>', '<gv', { desc = "Move Selection Left" })
keymap.set('v', '<A-Right>', '>gv', { desc = "Move Selection Right" })

-- Bufferline Bindings
keymap.set('n', '<S-q>', '<Cmd>bdelete<CR>', { desc = "Close Buffer" })
keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR> {}', { desc = "Next Buffer" })
keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR> {}', { desc = "Previous Buffer" })

-- Comment Binding
keymap.set({ 'i', 'n' }, '<C-_>', '<ESC><Plug>(comment_toggle_linewise_current)', { desc = "Toggle Comment" })
keymap.set('x', '<C-_>', '<Plug>(comment_toggle_linewise_visual)', { desc = "Toggle Comment" })
keymap.set('x', '<C-A-_>', '<Plug>(comment_toggle_blockwise_visual)', { desc = "Toggle Comment" })

-- Format Bindings
keymap.set({ 'v', 'n', 'i' }, '<S-A-f>', '<Cmd>lua vim.lsp.buf.format({ timeout_ms = 2000 })<CR>', { desc = "Format" })

-- Lspsaga Setup
keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', { desc = "Show Hover" })
keymap.set('n', '<A-k>', '<Cmd>Lspsaga peek_definition<CR>', { desc = "Peek Definition" })
keymap.set('n', '<C-k>', '<Cmd>Lspsaga goto_definition<CR>', { desc = "Go to Definition" })
keymap.set('n', 'gd', '<Cmd>Lspsaga finder<CR>', { desc = "Find References and Implementations" })
keymap.set('n', 'gp', '<Cmd>Lspsaga code_action<CR>', { desc = "Code Action" })
keymap.set('n', '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<CR>', { desc = "Jump to Next Diagnostic" })
keymap.set('n', '<C-S-j>', '<Cmd>Lspsaga diagnostic_jump_prev<CR>', { desc = "Jump to Previous Diagnostic" })
keymap.set('n', 'gl', '<Cmd>Lspsaga show_line_diagnostics<CR>', { desc = "Show Line Diagnostics" })

-- Inc Rename
keymap.set('n', 'gr',function()
    local inc_rename = require("inc_rename")
    return ":" .. inc_rename.config.cmd_name .. " " .. vim.fn.expand("<cword>")
end, { expr = true }, { desc = "Rename" })

-- Split window
keymap.set("n", "ss", ":split<Return>", { noremap = true, silent = true }, { desc = "Horizontal Split Window" })
keymap.set("n", "sv", ":vsplit<Return>", { noremap = true, silent = true }, { desc = "Vertical Split Window" })

-- Move window
keymap.set("n", "sh", "<C-w>h", { desc = "Move to Left Window" })
keymap.set("n", "sk", "<C-w>k", { desc = "Move to Upper Window" })
keymap.set("n", "sj", "<C-w>j", { desc = "Move to Lower Window" })
keymap.set("n", "sl", "<C-w>l", { desc = "Move to Right Window" })

-- Resize panes
keymap.set('n', '<C-A-h>', '<Cmd>vertical resize -4<CR>', { desc = "Resize Pane Left" })
keymap.set('n', '<C-A-k>', '<Cmd>resize +4<CR>', { desc = "Resize Pane Up" })
keymap.set('n', '<C-A-j>', '<Cmd>resize -4<CR>', { desc = "Resize Pane Down" })
keymap.set('n', '<C-A-l>', '<Cmd>vertical resize +4<CR>', { desc = "Resize Pane Right" })

-- DAP Bindings
keymap.set('n', '<F10>', '<Cmd>DapContinue<CR>', { desc = "Debug Continue" })
keymap.set('n', '<F11>', '<Cmd>DapStepOver<CR>', { desc = "Debug Step Over" })
keymap.set('n', '<F12>', '<Cmd>DapStepInto<CR>', { desc = "Debug Step Into" })
keymap.set('n', '<F13>', '<Cmd>DapStepOut<CR>', { desc = "Debug Step Out" })
keymap.set('n', '\\bb', '<Cmd>DapToggleBreakpoint<CR>', { desc = "Toggle Breakpoint" })
keymap.set('n', '\\bc', [[<Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))()<CR>]],
    { desc = "Toggle Conditional Breakpoint" })
keymap.set('n', '\\bl', [[<Cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>]],
    { desc = "Toggle Log Point Breakpoint" })
keymap.set('n', '\\bu', [[<Cmd>lua require'dapui'.toggle()<CR>]], { desc = "Toggle Debug UI" })

-- Copy and Delete Bindings
keymap.set("x", "\\p", [["_dP]], { desc = "Paste Without Copying" })

keymap.set({"n", "v"}, "\\d", [["_d]], { desc = "Delete Without Copying" })

-- Folds
keymap.set('n', '+', '<Cmd>foldopen<CR>', { desc = "Open Fold" })
keymap.set('n', '_', '<Cmd>foldclose<CR>', { desc = "Close Fold" })
keymap.set('n', '<A-=>', '<Cmd>OpenAllFolds<CR>', { desc = "Open All Folds" })
keymap.set('n', '<A-->', '<Cmd>CloseAllFolds<CR>', { desc = "Close All Folds" })

-- Ctrl Movement
keymap.set({ 'n', 'v' }, '<C-Right>', 'E', { desc = "Move to End of Word" })
keymap.set('i', '<C-Right>', '<C-o>E<Right>', { desc = "Move to End of Word" })

-- Deselect
keymap.set({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- Terminal
keymap.set('t', "<esc>", "<C-\\><C-n>", { desc = "Exit Terminal Mode" })
