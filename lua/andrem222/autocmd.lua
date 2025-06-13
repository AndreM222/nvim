local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Highlight yang selection
local yank_group = augroup('HighlightYank', {})
autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

-- Cleanup unintended spaces at the end
local cleanup_group = augroup('CleanupSpaces', {})
autocmd({ "BufWritePre" }, {
    group = cleanup_group,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

-- Turn off paste mode when leaving insert
local nopaste_group = augroup('DisablePasteMode', {})
autocmd({ "InsertLeave" }, {
    group = nopaste_group,
    pattern = "*",
    command = "set nopaste"
})

-- Check if we need to reload the file when it changed
local checktime_group = augroup('CheckTime', {})
autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
    group = checktime_group,
    callback = function()
        if vim.o.buftype ~= "nofile" then
            vim.cmd("checktime")
        end
    end,
})

-- resize splits if window got resized
local resize_splits_group = augroup('Resize_Splits', {})
autocmd({ "VimResized" }, {
    group = resize_splits_group,
    callback = function()
        local current_tab = vim.fn.tabpagenr()
        vim.cmd("tabdo wincmd =")
        vim.cmd("tabnext " .. current_tab)
    end,
})

-- close some filetypes with <q>
local close_with_q_group = augroup("Close_With_Q", {})
autocmd({ "FileType" }, {
    group = close_with_q_group,
    pattern = {
        "PlenaryTestPopup",
        "help",
        "lspinfo",
        "notify",
        "query",
        "startuptime",
        "checkhealth"
    },
    callback = function(event)
        vim.bo[event.buf].buflisted = false
        vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
    end,
})

-- make it easier to close man-files when opened inline
local man_unlisted_group = augroup('Man_Unlisted', {})
autocmd({ "FileType" }, {
    group = man_unlisted_group,
    pattern = { "man" },
    callback = function(event)
        vim.bo[event.buf].buflisted = false
    end,
})

-- Auto create dir when saving a file, in case some intermediate directory does not exist
local auto_create_dir_group = augroup('Auto_Create_Dir', {})
autocmd({ "BufWritePre" }, {
    group = auto_create_dir_group,
    callback = function(event)
        if event.match:match("^%w%w+:[\\/][\\/]") then
            return
        end
        local file = vim.uv.fs_realpath(event.match) or event.match
        vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
    end,
})

-- Setup link with gx with netrw disabled
local gxlink_group = augroup('GXLink', {})
autocmd("FileType", {
    group = gxlink_group,
    pattern = "markdown",
    callback = function(event)
        vim.schedule(function()
            require("noice.text.markdown").keys(event.buf)
        end)
    end,
})

-- Setup term settings on startup
local term_group = augroup('term-setup', {})
autocmd("TermOpen", {
    group = term_group,
    callback = function()
        vim.opt.number = false
        vim.opt.relativenumber = false
        vim.opt.foldenable = false
        vim.opt.signcolumn = "no"
    end,
})

local markview_group = augroup('markview-setup', {})
autocmd("ColorScheme", {
    group = markview_group,
    pattern = "*",
    callback = function()
        require("markview").setup({
            highlight_groups = {
                ["ZZ"] = function()
                    local hl = require("markview.highlights");

                    local _o = {};

                    for h = 1, 6, 1 do
                        local bg = hl.get_property("bg", { "MarkviewHeading" .. h }, nil, nil);

                        if vim.islist(bg) then
                            table.insert(_o, {
                                group_name = "MarkviewHeading" .. h .. "Corner",
                                value = { fg = hl.rgb_to_hex(bg) }
                            });
                        end
                    end

                    return _o;
                end
            },

        })
    end
})
