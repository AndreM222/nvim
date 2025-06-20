local keymap = vim.keymap

-- Telescope Bindings
keymap.set('n', '\\t', '<Cmd>Telescope file_browser<CR>', { silent = true, desc = Msgstr("Browse Through Files") })
keymap.set('n', '\\r', '<Cmd>Telescope resume<CR>', { silent = true, desc = Msgstr("Lists the results including multi-selections of the previous picker") })
keymap.set('n', '\\f', '<Cmd>Telescope find_files<CR>', { silent = true, desc = Msgstr("Lists files in your current working directory") })
keymap.set('n', '\\l', '<cmd>Telescope live_grep<cr>', { silent = true, desc = Msgstr("Search for a string in your current working directory and get results live as you type") })
keymap.set('n', '\\w', '<Cmd>Telescope diagnostics<CR>', { silent = true, desc = Msgstr("Lists Diagnostics for all open buffers or a specific buffer") })
keymap.set('n', '\\g', '<Cmd>Telescope git_status<CR>', { silent = true, desc = Msgstr("Lists current changes per file with diff preview and add action") })
keymap.set('n', '\\\\', '<Cmd>Telescope buffers<CR>', { silent = true, desc = Msgstr("Lists open buffers in current instance") })
keymap.set('n', '<F3>', '<Cmd>Telescope help_tags<CR>', { silent = true, desc = Msgstr("Lists available help tags and opens a new window with the relevant help info") })
keymap.set('n', '<F4>', '<Cmd>Telescope keymaps<CR>', { silent = true, desc = Msgstr("Lists normal mode key mappings") })

-- Moving Selections
keymap.set({ 'n', 'i' }, '<A-Down>', '<Esc>:m .+1<CR>==', { silent = true, desc = Msgstr("Move Selection Down") })
keymap.set({ 'n', 'i' }, '<A-Up>', '<Esc>:m .-2<CR>==', { silent = true, desc = Msgstr("Move Selection Up") })
keymap.set('v', '<A-Down>', [[:m '>+1<CR>gv=gv]], { silent = true, desc = Msgstr("Move Selection Down") })
keymap.set('v', '<A-Up>', [[:m '<-2<CR>gv=gv]], { silent = true, desc = Msgstr("Move Selection Up") })

keymap.set({ 'n', 'i' }, '<A-Left>', '<Esc><<', { desc = Msgstr("Move Selection Left") })
keymap.set({ 'n', 'i' }, '<A-Right>', '<Esc>>>', { desc = Msgstr("Move Selection Right") })
keymap.set('v', '<A-Left>', '<gv', { desc = Msgstr("Move Selection Left") })
keymap.set('v', '<A-Right>', '>gv', { desc = Msgstr("Move Selection Right") })

-- Bufferline Bindings
keymap.set('n', '<S-q>', '<Cmd>bdelete<CR>', { desc = Msgstr("Close Current Buffer") })
keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR> {}', { desc = Msgstr("Switch To Next Buffer") })
keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR> {}', { desc = Msgstr("Switch To Previous Buffer") })

-- Comment Binding
keymap.set({ 'i', 'n' }, 'gcc', '<ESC><Plug>(comment_toggle_linewise_current)', { desc = Msgstr("Toggle Line Comment") })
keymap.set('x', 'gc', '<Plug>(comment_toggle_linewise_visual)', { desc = Msgstr("Toggle Line Comment") })
keymap.set('x', 'gb', '<Plug>(comment_toggle_blockwise_visual)', { desc = Msgstr("Toggle Block Comment") })

-- Format Bindings
keymap.set({ 'v', 'n', 'i' }, '<S-A-f>', '<Cmd>lua vim.lsp.buf.format({ timeout_ms = 2000 })<CR>', { desc = Msgstr("Format Lines Of Code") })

-- Lspsaga Setup
keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', { desc = Msgstr("Show Hover Documentation") })
keymap.set('n', '<A-k>', '<Cmd>Lspsaga peek_definition<CR>', { desc = Msgstr("Peek Definition") })
keymap.set('n', '<C-]>', '<Cmd>Lspsaga goto_definition<CR>', { desc = Msgstr("Go to Definition") })
keymap.set('n', 'gd', '<Cmd>Lspsaga finder<CR>', { desc = Msgstr("Find References and Implementations") })
keymap.set('n', 'gp', '<Cmd>Lspsaga code_action<CR>', { desc = Msgstr("Code Action") })
keymap.set('n', '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<CR>', { desc = Msgstr("Jump to Next Diagnostic") })
keymap.set('n', '<C-S-j>', '<Cmd>Lspsaga diagnostic_jump_prev<CR>', { desc = Msgstr("Jump to Previous Diagnostic") })
keymap.set('n', 'gl', '<Cmd>Lspsaga show_line_diagnostics<CR>', { desc = Msgstr("Show Line Diagnostics") })

-- Inc Rename
keymap.set('n', 'gr',function()
    local inc_rename = require("inc_rename")
    return ":" .. inc_rename.config.cmd_name .. " " .. vim.fn.expand("<cword>")
end, { expr = true, desc = Msgstr("Renaming with immediate visual feedback") })

-- Split window
keymap.set("n", "ss", ":split<Return>", { noremap = true, silent = true, desc = Msgstr("Horizontal Split Window") })
keymap.set("n", "sv", ":vsplit<Return>", { noremap = true, silent = true, desc = Msgstr("Vertical Split Window") })

-- Move window
keymap.set("n", "sh", "<C-w>h", { desc = Msgstr("Move to Left Window") })
keymap.set("n", "sk", "<C-w>k", { desc = Msgstr("Move to Upper Window") })
keymap.set("n", "sj", "<C-w>j", { desc = Msgstr("Move to Lower Window") })
keymap.set("n", "sl", "<C-w>l", { desc = Msgstr("Move to Right Window") })

-- Resize panes
keymap.set('n', '<C-A-h>', '<Cmd>vertical resize -4<CR>', { desc = Msgstr("Resize Pane Left") })
keymap.set('n', '<C-A-k>', '<Cmd>resize +4<CR>', { desc = Msgstr("Resize Pane Up") })
keymap.set('n', '<C-A-j>', '<Cmd>resize -4<CR>', { desc = Msgstr("Resize Pane Down") })
keymap.set('n', '<C-A-l>', '<Cmd>vertical resize +4<CR>', { desc = Msgstr("Resize Pane Right") })

-- Copy and Delete Bindings
keymap.set("x", "\\p", [["_dP]], { desc = Msgstr("Paste Without Copying") })

keymap.set({"n", "v"}, "\\d", [["_d]], { desc = Msgstr("Delete Without Copying") })

-- Folds
keymap.set('n', '+', '<Cmd>foldopen<CR>', { desc = Msgstr("Open Current Fold") })
keymap.set('n', '_', '<Cmd>foldclose<CR>', { desc = Msgstr("Close Current Fold") })
keymap.set('n', '<A-=>', '<Cmd>OpenAllFolds<CR>', { desc = Msgstr("Open All Folds") })
keymap.set('n', '<A-->', '<Cmd>CloseAllFolds<CR>', { desc = Msgstr("Close All Folds") })

-- Deselect
keymap.set({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = Msgstr("Escape and clear hlsearch") })

-- Terminal
keymap.set('t', "<esc>", "<C-\\><C-n>", { desc = Msgstr("Exit Terminal Mode") })

-- Refactoring
keymap.set('v', "\\r", "<Cmd>RefactorList<CR>", { desc = Msgstr("Refactor Menu") })
