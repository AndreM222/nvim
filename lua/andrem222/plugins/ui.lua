return {
    {
        'nvim-lualine/lualine.nvim', -- Status Line
        config = function()
            local cozynight = require('lualine.themes.palenight')

            cozynight.insert.a.bg = '#f7397c'
            cozynight.insert.b.fg = '#f7397c'
            cozynight.visual.a.bg = '#ffb86c'
            cozynight.visual.b.fg = '#ffb85c'

            require('lualine.utils.mode').map = {
                ['n']     = Msgstr('NORMAL'),
                ['no']    = Msgstr('O-PENDING'),
                ['nov']   = Msgstr('O-PENDING'),
                ['noV']   = Msgstr('O-PENDING'),
                ['no\22'] = Msgstr('O-PENDING'),
                ['niI']   = Msgstr('NORMAL'),
                ['niR']   = Msgstr('NORMAL'),
                ['niV']   = Msgstr('NORMAL'),
                ['nt']    = Msgstr('NORMAL'),
                ['ntT']   = Msgstr('NORMAL'),
                ['v']     = Msgstr('VISUAL'),
                ['vs']    = Msgstr('VISUAL'),
                ['V']     = Msgstr('V-LINE'),
                ['Vs']    = Msgstr('V-LINE'),
                ['\22']   = Msgstr('V-BLOCK'),
                ['\22s']  = Msgstr('V-BLOCK'),
                ['s']     = Msgstr('SELECT'),
                ['S']     = Msgstr('S-LINE'),
                ['\19']   = Msgstr('S-BLOCK'),
                ['i']     = Msgstr('INSERT'),
                ['ic']    = Msgstr('INSERT'),
                ['ix']    = Msgstr('INSERT'),
                ['R']     = Msgstr('REPLACE'),
                ['Rc']    = Msgstr('REPLACE'),
                ['Rx']    = Msgstr('REPLACE'),
                ['Rv']    = Msgstr('V-REPLACE'),
                ['Rvc']   = Msgstr('V-REPLACE'),
                ['Rvx']   = Msgstr('V-REPLACE'),
                ['c']     = Msgstr('COMMAND'),
                ['cv']    = Msgstr('EX'),
                ['ce']    = Msgstr('EX'),
                ['r']     = Msgstr('REPLACE'),
                ['rm']    = Msgstr('MORE'),
                ['r?']    = Msgstr('CONFIRM'),
                ['!']     = Msgstr('SHELL'),
                ['t']     = Msgstr('TERMINAL'),
            }

            local rec_msg = ''
            vim.api.nvim_create_autocmd({ 'RecordingEnter', 'RecordingLeave' }, {
                group = vim.api.nvim_create_augroup('LualineRecordingSection', { clear = true }),
                callback = function(e)
                    if e.event == 'RecordingLeave' then
                        rec_msg = ''
                    else
                        rec_msg = Msgstr('recording') .. ' @' .. vim.fn.reg_recording()
                    end
                    require('lualine').refresh()
                end,
            })

            local function progressLoc()
                local cur = vim.fn.line('.')
                local total = vim.fn.line('$')
                if cur == 1 then
                    return Msgstr('Top')
                elseif cur == total then
                    return Msgstr('Bot')
                else
                    return string.format('%2d%%%%', math.floor(cur / total * 100))
                end
            end

            require("lualine").setup({
                options = {
                    icons_enabled = true,
                    theme = cozynight,
                    component_separators = { left = '', right = '' },
                    section_separators = { left = '', right = '' },
                    disabled_filetypes = {},
                    always_divide_middle = true
                },
                sections = {
                    lualine_a = { 'mode' },
                    lualine_b = {
                        {
                            'branch',
                            fmt = function(str)
                                if vim.api.nvim_strwidth(str) > 40 then
                                    return ("%s…"):format(str:sub(1, 39))
                                end

                                return str
                            end,
                        }, 'diff',
                        {
                            'diagnostics',
                            sources = { "nvim_diagnostic" },
                            symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' }
                        }
                    },
                    lualine_c = {
                        {
                            'filename',
                            symbols = {
                                unnamed = '[' .. Msgstr('No Name') .. ']',
                                newfile = '[' .. Msgstr('New') .. ']'
                            }
                        }
                    },
                    lualine_x = {
                        {
                            function()
                                return rec_msg
                            end,
                            color = { fg = "#ffb85c" },
                        },
                        CopilotIcon(),
                        'encoding',
                        'fileformat',
                        'filetype'
                    },
                    lualine_y = { progressLoc },
                    lualine_z = { 'location' }
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = { 'filename' },
                    lualine_x = { 'location' },
                    lualine_y = {},
                    lualine_z = {}
                },
                tabline = {},
                extensions = {}
            })
        end
    },

    { 'kyazdani42/nvim-web-devicons' },                      -- Icons

    { "lukas-reineke/indent-blankline.nvim", main = "ibl" }, -- Indent Line

    {
        'Mofiqul/dracula.nvim', -- Theme
        lazy = true,
        priority = 1000,
    },

    {
        'glepnir/dashboard-nvim', -- Menu Screen
        config = function()
            require("dashboard").setup({
                config = {
                    project = {
                        label = ' ' .. Msgstr('Recent Projects:')
                    },
                    mru = {
                        label = ' ' .. Msgstr('Most Recent Files:')
                    },
                    header = {
                        ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
                        ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
                        ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
                        ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
                        ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
                        ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
                        '                                                       ',
                    },
                    shortcut = {
                        {
                            desc = ' ' .. Msgstr('Files'),
                            group = '@operator',
                            action = 'Telescope file_browser',
                            key = 'f',
                        },
                        {
                            desc = ' ' .. Msgstr('Keymaps'),
                            group = 'DiagnosticHint',
                            action = 'Telescope keymaps',
                            key = 'k',
                        },
                        {
                            desc = ' ' .. Msgstr('Settings'),
                            group = '@property',
                            action = 'Telescope file_browser path=' .. vim.fn.stdpath("config") .. "/lua/andrem222", -- Change to your dotfiles path
                            key = 'd',
                        },
                        {
                            desc = '󰝒 ' .. Msgstr('New File'),
                            group = 'DiagnosticWarn',
                            action = 'ene ',
                            key = 'e',
                        }
                    },
                    packages = { enable = false },
                    footer = {
                        "",
                        "NVIM v" .. vim.version().major .. "." .. vim.version().minor .. "." .. vim.version().patch
                    }
                }
            })
        end
    },

    { 'rrethy/vim-illuminate' }, -- Highlight

    {
        "kevinhwang91/nvim-ufo", -- Aesthetic Folding
        dependencies = { "kevinhwang91/promise-async" },
        event = "BufRead",
        config = function()
            local ibl = require("ibl")

            local ufo = require("ufo")

            ufo.setup()

            vim.api.nvim_create_user_command(
                "OpenAllFolds",
                function()
                    ufo.openAllFolds()
                end,
                { nargs = 0 }
            )

            vim.api.nvim_create_user_command(
                "CloseAllFolds",
                function()
                    ufo.closeAllFolds()
                end,
                { nargs = 0 }
            )

            ibl.setup({
                scope = {
                    show_start = false,
                    show_end = false
                },
                exclude = {
                    filetypes = {
                        "dashboard"
                    }
                }
            });
        end,
    },
    {
        'NvChad/nvim-colorizer.lua', -- Color Highlight
        config = function()
            require('colorizer').setup({
                user_default_options = { css = true, mode = "virtualtext", virtualtext = "󱓻", }
            })
        end,
    },
    {
        "b0o/incline.nvim", -- Floating Statusline
        event = "BufReadPre",
        priority = 1200,
        config = function()
            require("incline").setup({
                highlight = {
                    groups = {
                        InclineNormal = { guifg = "#ffffff" },
                        InclineNormalNC = { guifg = "#44475A" },
                    },
                },
                window = { margin = { vertical = 0, horizontal = 0 } },
                hide = {
                    cursorline = true,
                },
                render = function(props)
                    local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
                    if vim.bo[props.buf].modified then
                        filename = "[+] " .. filename
                    end

                    local icon, color = require("nvim-web-devicons").get_icon_color(filename)
                    return { { icon, guifg = color }, { " " }, { filename } }
                end,
            })
        end,
    },

    {
        "folke/noice.nvim", -- UI For Messages, CMDLine, and Popmenu
        event = "VeryLazy",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify"
        },
        config = function()
            -- Notify Setup
            require("notify").setup({ background_colour = "#000000" })

            -- Noice Setup
            require("noice").setup({
                cmdline = {
                    format = {
                        IncRename = { title = Msgstr("IncRename") },
                        search_down = { title = Msgstr("Search") },
                        search_up = { title = Msgstr("Search") },
                        filter = { title = Msgstr("Filter") },
                        cmdline = { title = Msgstr("Cmdline") },
                        help = { title = Msgstr("Help") },
                        input = { title = Msgstr("Input") }
                    },
                },

                lsp = {
                    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
                    override = {
                        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                        ["vim.lsp.util.stylize_markdown"] = true,
                        ["cmp.entry.get_documentation"] = true,
                    },
                },
                -- you can enable a preset for easier configuration
                presets = {
                    bottom_search = false,        -- use a classic bottom cmdline for search
                    command_palette = true,       -- position the cmdline and popupmenu together
                    long_message_to_split = true, -- long messages will be sent to a split
                    inc_rename = true,            -- enables an input dialog for inc-rename.nvim
                    lsp_doc_border = true,        -- add a border to hover docs and signature help
                },

                routes = {
                    {
                        filter = {
                            event = "lsp",
                            kind = "progress",
                            cond = function(message)
                                local client = vim.tbl_get(message.opts, "progress", "client")
                                return client == "null-ls"
                            end,
                        },
                        opts = { skip = true },
                    },

                    {
                        view = "notify",
                        filter = {
                            event = "msg_show",
                            kind = { "", "echo", "echomsg" },
                        },
                        opts = { replace = true, merge = true, title = Msgstr("Messages") }
                    },

                    {
                        view = "notify",
                        filter = { error = true },
                        opts = { title = Msgstr("Error") }
                    },

                    {
                        view = "notify",
                        filter = { warning = true },
                        opts = { title = Msgstr("Warning") }
                    },

                    {
                        view = "notify",
                        filter = { event = "notify" },
                        opts = { title = Msgstr("Notify") }
                    },

                    {
                        view = "notify",
                        filter = {
                            event = "noice",
                            kind = { "stats", "debug" },
                        },
                        opts = { lang = "lua", replace = true, title = Msgstr("Noice") },
                    },
                }
            })
        end
    },

    {
        'akinsho/nvim-bufferline.lua', -- Buffer Tabs
        event = "VeryLazy",
        config = function()
            require("bufferline").setup({
                options = {
                    always_show_bufferline = false,
                    show_buffer_close_icons = false,
                    show_close_icon = false,
                    color_icons = true,
                    diagnostics = "nvim_lsp",
                    diagnostics_indicator = function(count, level)
                        local icon = ""

                        if level:match("error") then
                            icon = ""
                        elseif level:match("warning") then
                            icon = ""
                        end

                        return " " .. icon
                    end
                },
                highlights = {
                    modified = { fg = '#ffb86c' },
                    modified_selected = { fg = '#ffb86c' },
                    buffer_selected = { italic = false },
                    diagnostic_selected = { italic = false },
                    hint_selected = { italic = false },
                    hint_diagnostic_selected = { italic = false },
                    info_selected = { italic = false },
                    warning_selected = { italic = false },
                    warning_diagnostic_selected = { italic = false },
                    error_selected = { italic = false },
                    error_diagnostic_selected = { italic = false },
                },
            })
        end,

    },
}
