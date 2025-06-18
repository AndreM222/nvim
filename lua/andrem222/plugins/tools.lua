return {
    -- Tools
    {
        'nvim-telescope/telescope.nvim', -- File Explorer
        dependencies = {
            "nvim-lua/plenary.nvim",
            'nvim-telescope/telescope-ui-select.nvim',
            "nvim-telescope/telescope-file-browser.nvim",
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
        },
        config = function()
            local telescope = require("telescope")
            local actions = require('telescope.actions')
            local function telescope_buffer_dir()
                return vim.fn.expand('%:p:h')
            end

            local fb_actions = require "telescope".extensions.file_browser.actions
            local themes = require("telescope.themes")

            local function copyFullPath(entry)
                local cb_opts = vim.opt.clipboard:get()
                vim.fn.setreg(vim.v.register, entry[1])
                vim.notify(Msgstr("The path has been copied ") .. entry[1])
            end

            local function copyPath(entry)
                local cb_opts = vim.opt.clipboard:get()
                local dir_path = vim.fs.dirname(entry[1]) .. "/"
                vim.fn.setreg(vim.v.register, dir_path)

                vim.notify(Msgstr("The path has been copied ") .. dir_path)
            end

            local function getDeviceOpenCMD()
                local cmd
                if vim.fn.has('mac') == 1 then
                    cmd = '!open'
                elseif vim.fn.has('win32') == 1 then
                    cmd = '!explorer'
                elseif vim.fn.executable('wslview') == 1 then
                    cmd = '!wslview'
                elseif vim.fn.executable('xdg-open') == 1 then
                    cmd = '!xdg-open'
                else
                    vim.notify(Msgstr("Invalid"), "error")
                    return -1;
                end

                return cmd
            end

            telescope.setup {
                defaults = {
                    initial_mode = "normal mode",
                    mappings = {
                        n = {
                            ["q"] = actions.close,

                            ["O"] = function()
                                local fn = vim.fn
                                local cmd = getDeviceOpenCMD()

                                if (cmd == -1) then return -1 end

                                local entry = require("telescope.actions.state").get_selected_entry().path

                                local dir_path = vim.fs.dirname(entry) .. "/"


                                fn.execute(cmd .. ' ' .. dir_path)
                            end,

                            ["o"] = function()
                                local fn = vim.fn
                                local cmd = getDeviceOpenCMD()

                                if (cmd == -1) then return -1 end

                                local entry = require("telescope.actions.state").get_selected_entry().path

                                fn.execute(cmd .. ' ' .. entry)
                            end,

                            ["y"] = function()
                                local entry = require("telescope.actions.state").get_selected_entry()
                                return copyFullPath(entry)
                            end,

                            ["Y"] = function()
                                local entry = require("telescope.actions.state").get_selected_entry()
                                return copyPath(entry)
                            end,

                            ["/"] = function()
                                vim.cmd('startinsert')
                            end
                        }
                    },

                    -- Come back on neovim 0.12 for image API
                    preview = {
                        mime_hook = function(filepath, bufnr, opts)
                            local is_image = function(filepath)
                                local image_extensions = { "png", "jpg", "jpeg", "webp", "gif" }
                                local split_path = vim.split(filepath:lower(), '.', { plain = true })
                                local extension = split_path[#split_path]
                                return vim.tbl_contains(image_extensions, extension)
                            end
                            if is_image(filepath) then
                                local height = vim.api.nvim_win_get_height(opts.winid)
                                local width = vim.api.nvim_win_get_width(opts.winid)
                                local term = vim.api.nvim_open_term(bufnr, {})
                                local function send_output(_, data, _)
                                    for _, d in ipairs(data) do
                                        vim.api.nvim_chan_send(term, d .. '\r\n')
                                    end
                                end

                                vim.fn.jobstart(
                                    {
                                        "chafa",
                                        "--center=on",
                                        "--clear",
                                        "--format=symbols",
                                        "--view-size=" .. width .. "x" .. height,
                                        "--scale=max",
                                        filepath -- Terminal image viewer command
                                    },
                                    { on_stdout = send_output, stdout_buffered = true, pty = true })
                            else
                                require("telescope.previewers.utils").set_preview_message(bufnr, opts.winid,
                                    "Binary cannot be previewed")
                            end
                        end
                    }
                    -- Come back on neovim 0.12 for image API
                },

                pickers = {
                    git_status = {
                        prompt_title = Msgstr("Git Status"),
                        results_title = Msgstr("Results"),
                        preview_title = Msgstr("Grep Preview")
                    },

                    buffers = {
                        prompt_title = Msgstr("Buffers"),
                        results_title = Msgstr("Results"),
                        preview_title = Msgstr("Grep Preview")
                    },

                    diagnostics = {
                        prompt_title = Msgstr("Workspace Diagnostics"),
                        results_title = Msgstr("Results"),
                        preview_title = Msgstr("Grep Preview")
                    },

                    help_tags = {
                        prompt_title = Msgstr("Help"),
                        results_title = Msgstr("Results"),
                        preview_title = Msgstr("Help Preview")
                    },

                    keymaps = {
                        prompt_title = Msgstr("Keymaps"),
                        results_title = Msgstr("Results"),
                    },

                    live_grep = {
                        prompt_title = Msgstr("Live Grep"),
                        results_title = Msgstr("Results"),
                        preview_title = Msgstr("Grep Preview")
                    },

                    find_files = {
                        prompt_title = Msgstr("Find Files"),
                        results_title = Msgstr("Results"),
                        preview_title = Msgstr("Grep Preview"),
                        no_ignore = false,
                        hidden = true
                    }
                },
                extensions = {
                    ["ui-select"] = { themes.get_dropdown({}) },

                    file_browser = {
                        theme = "dropdown",
                        path = "%:p:h",
                        cwd = telescope_buffer_dir(),
                        respect_gitignore = false,
                        hidden = true,
                        grouped = true,
                        previewer = false,
                        layout_config = { height = 40 },
                        hijack_netrw = true,
                        prompt_title = Msgstr("File Browser"),
                        mappings = {
                            -- Insert
                            ["i"] = {
                                ["<C-w>"] = function() vim.cmd('normal vbd') end
                            },
                            ["n"] = {
                                -- Custom normal mode mappings
                                ["N"] = fb_actions.create,
                                ["C"] = fb_actions.copy,
                                ["h"] = fb_actions.goto_parent_dir,
                                ["<C-d>"] = fb_actions.remove,
                                ["R"] = fb_actions.rename,
                                ["v"] = actions.select_vertical,
                                ["x"] = actions.select_horizontal,
                            },
                        }
                    }
                }
            }

            telescope.load_extension("file_browser")
            telescope.load_extension("ui-select")
            telescope.load_extension('fzf')
        end
    },

    {
        'echasnovski/mini.surround',
        version = '*',
        config = function()
            require('mini.surround').setup({
                mappings = {
                    highlight = '', -- Highlight surrounding
                },
            })
        end
    },
    {
        "smjonas/inc-rename.nvim",
        config = true,
    },
    {
        'glepnir/lspsaga.nvim', -- Tools
        config = function()
            require("lspsaga").setup({
                symbol_in_winbar = { separator = "  " },
                ui = {
                    border = 'rounded',
                    code_action = " ",
                    title = false
                }
            })
        end,
    },
    {
        'lewis6991/gitsigns.nvim', -- Git Info
        config = function()
            -- set gitsigns
            require("gitsigns").setup({
                current_line_blame = true,
                current_line_blame_opts = {
                    delay = 100
                },
                current_line_blame_formatter = '   <author>, <author_time:%R> • <summary>'
            })
        end,
    }
}
