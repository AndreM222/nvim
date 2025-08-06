return {
    {
        'neovim/nvim-lspconfig', -- Setup Completion
        config = function()
            local nvim_lsp = require("lspconfig")

            require('lspconfig.ui.windows').default_options.border = 'single'

            local on_attach = function(client, bufnr)
                local function buf_set_keymap(...)
                    vim.api.nvim_buf_set_keymap(bufnr, ...)
                end

                if client.server_capabilities.inlayHintProvider then
                    local inHints = vim.lsp.buf.inlay_hint or vim.lsp.inlay_hint
                    if type(inHints) == "function" then
                        inHints(bufnr, value)
                    elseif type(inHints) == "table" and inHints.enable then
                        inHints.enable(value, { bufnr = bufnr })
                    end
                end

                -- Mappings
                local opts = { noremap = true, silent = true }

                buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)

                buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
            end

            local capabilities = require('blink.cmp').get_lsp_capabilities(vim.lsp.protocol.make_client_capabilities())
            capabilities.offsetEncoding = { "utf-16" }
            capabilities.textDocument.foldingRange = {
                dynamicRegistration = false,
                lineFoldingOnly = true
            }


            -- TypeScript
            nvim_lsp.ts_ls.setup({
                on_attach = on_attach,
                capabilities = capabilities,
                init_options = {
                    preferences = {
                        includeInlayParameterNameHints = "all",
                        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                        includeInlayFunctionParameterTypeHints = true,
                        includeInlayVariableTypeHints = true,
                        includeInlayPropertyDeclarationTypeHints = true,
                        includeInlayFunctionLikeReturnTypeHints = true,
                        includeInlayEnumMemberValueHints = true,
                    },
                },
            })

            -- C, C++
            nvim_lsp.clangd.setup({
                on_attach = on_attach,
                capabilities = capabilities,
                init_options = {
                    fallbackFlags = { '-std=c++20' }
                }
            })

            -- Docker
            nvim_lsp.dockerls.setup({
                on_attach = on_attach,
                capabilities = capabilities
            })

            -- CMake
            nvim_lsp.cmake.setup({
                on_attach = on_attach,
                capabilities = capabilities
            })

            -- Markdown
            nvim_lsp.marksman.setup({
                on_attach = on_attach,
                capabilities = capabilities
            })

            -- LaTeX
            nvim_lsp.texlab.setup({
                on_attach = on_attach,
                capabilities = capabilities
            })

            -- C#
            nvim_lsp.csharp_ls.setup({
                cmd = { "csharp-ls" },
                on_attach = on_attach,
                capabilities = capabilities
            })

            -- Lua
            nvim_lsp.lua_ls.setup({
                on_attach = on_attach,
                capabilities = capabilities,
                -- Uncomment for editing config files
                settings = {
                    Lua = {
                        diagnostics = { globals = { 'vim' } },
                        workspace = {
                            -- Make the server aware of Neovim runtime files for dev
                            library = vim.api.nvim_get_runtime_file("", true),
                            checkThirdParty = false
                        }
                    }
                }
            })

            -- Setup lsp for shell
            if (os.getenv("WINDIR") and not os.getenv("WSL_INTEROP")) then
                -- PowerShell
                nvim_lsp.powershell_es.setup({
                    on_attach = on_attach,
                    capabilities = capabilities,
                    bundle_path = vim.fn.stdpath("data") .. "/mason/packages/powershell-editor-services"
                })
            else
                -- Bash
                nvim_lsp.bashls.setup({
                    filetypes = { "sh", "zsh" },
                    on_attach = on_attach,
                    capabilities = capabilities
                })

                -- Fish
                nvim_lsp.fish_lsp.setup({
                    on_attach = on_attach,
                    capabilities = capabilities
                })
            end

            -- HTML
            nvim_lsp.html.setup({
                on_attach = on_attach,
                capabilities = capabilities
            })

            -- Python
            nvim_lsp.pyright.setup({
                on_attach = on_attach,
                capabilities = capabilities
            })

            -- vim
            nvim_lsp.vimls.setup({
                on_attach = on_attach,
                capabilities = capabilities
            })

            -- CSS
            nvim_lsp.cssls.setup({
                on_attach = on_attach,
                capabilities = capabilities
            })

            -- TailwindCSS
            nvim_lsp.tailwindcss.setup({
                on_attach = on_attach,
                capabilities = capabilities
            })

            -- Diagnostic symbols in the sign column (gutter)
            local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
            for type, icon in pairs(signs) do
                local hl = "DiagnosticSign" .. type
                vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
            end

            -- Setup diagnostic symbol
            vim.diagnostic.config({
                virtual_text = { prefix = '', spacing = 4 },
                signs = {
                    text = {
                        [vim.diagnostic.severity.ERROR] = signs.Error,
                        [vim.diagnostic.severity.WARN] = signs.Warn,
                        [vim.diagnostic.severity.HINT] = signs.Hint,
                        [vim.diagnostic.severity.INFO] = signs.Info
                    }
                },

                update_in_insert = true
            })
        end
    },
    {
        'nvim-treesitter/nvim-treesitter', -- Highlight Colors
        event = { "BufReadPost", "BufWritePost", "BufNewFile" },
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = {
                    "markdown",
                    "markdown_inline",
                    "tsx",
                    "toml",
                    "php",
                    "json",
                    "yaml",
                    "css",
                    "html",
                    "dockerfile",
                    "lua",
                    "cpp",
                    "c",
                    "cmake",
                    "c_sharp",
                    "latex",
                    "python",
                    "javascript",
                    "vim",
                    "vimdoc",
                    "regex",
                    (function()
                        if (os.getenv("WINDIR") and not os.getenv("WSL_INTEROP")) then
                            return "powershell"
                        end
                        return "fish"
                    end)()
                },
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = { "latex", "markdown" },
                },
                indent = {
                    enable = true,
                    disable = {},
                },
                autotag = { enable = true }
            })

            local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
            parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
        end
    },
    {
        'williamboman/mason.nvim',               -- Installer
        dependencies = {
            'jay-babu/mason-null-ls.nvim',       -- For none-ls
            'williamboman/mason-lspconfig.nvim', -- For completion
            'nvim-neotest/nvim-nio'              -- Asynchronous IO
        },
        config = function()
            -- Setup Mason
            require("mason").setup({
                ui = {
                    border = "single",
                    icons = {
                        package_installed = "",
                        package_pending = "",
                        package_uninstalled = "⭕"
                    }
                }
            })

            -- Setuo Null-ls on mason
            require("mason-null-ls").setup({
                automatic_installation = true,
                ensure_installed = { "prettier", "clang-format", "eslint_d", "autopep8", "latexindent" },
                automatic_setup = true
            })

            require 'lspconfig'.texlab.setup {}
            -- Setup lspconfig on mason
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "clangd",
                    "html",
                    "cmake",
                    "lua_ls",
                    "pyright",
                    "ts_ls",
                    "texlab",
                    "vimls",
                    "csharp_ls",
                    "dockerls",
                    "tailwindcss",
                    "marksman",
                    "cssls",
                    (function()
                        if (os.getenv("WINDIR") and not os.getenv("WSL_INTEROP")) then
                            return "powershell_es"
                        end
                        return "bashls"
                    end)()
                },
                automatic_installation = true
            })
        end
    },
    {
        'nvimtools/none-ls.nvim', -- Linter and Formatting
        event = { "BufReadPost", "BufWritePost", "BufNewFile" },
        dependencies = 'nvimtools/none-ls-extras.nvim',
        config = function()
            local null_ls = require("null-ls")

            null_ls.setup({
                border = 'single',
                sources = {
                    -- Formatting
                    null_ls.builtins.formatting.prettier.with({
                        extra_args = function(params)
                            return params.options
                                and params.options.tabSize
                                and {
                                    "--tab-width",
                                    params.options.tabSize
                                    "--trailing-comma",
                                    "none",
                                    "--no-semi",
                                    "--arrow-parens",
                                    "avoid"
                                }
                        end,
                    }),

                    null_ls.builtins.formatting.clang_format.with({
                        extra_args = { "--style", "Microsoft" }
                    }),

                    require("none-ls.formatting.autopep8"),
                    require("none-ls.formatting.latexindent").with({
                        indent = 4
                    }),

                    -- -- Diagnostics
                    require("none-ls.code_actions.eslint_d").with({
                        diagnostics_format = '[eslint] #{m}\n(#{c})'
                    })
                }
            })
        end,
    },
}
