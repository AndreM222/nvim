return {
    {
        "lervag/vimtex",
        lazy = false,     -- we don't want to lazy load VimTeX
        config = function()
            vim.g.vimtex_compiler_latexmk = { -- added for svg
                options = {
                    "-shell-escape"
                },
            }
        end,
    },
    -- Markdown Previewer
    {
        "OXY2DEV/markview.nvim",
        lazy = true,      -- Recommended
        ft = "markdown", -- If you decide to lazy-load anyway
        config = function ()

            require("markview").setup({
                experimental = { check_rtp_message = false },
                preview = {
                    modes = { "n", "i", "no", "c" },

                    hybrid_modes = { "i", "n" },

                    -- This is nice to have
                    callbacks = {
                        on_enable = function (_, win)
                            vim.wo[win].conceallevel = 2;
                            vim.wo[win].concealcursor = "nc";
                        end
                    }
                },
                checkboxes = {
                    enable = true,

                    checked = {
                        text = "󰡖", hl = "MarkviewCheckboxChecked"
                    },

                    unchecked = {
                        text = "", hl = "MarkviewCheckboxUnchecked"
                    }
                },

                links = {
                    enable = true
                },
            })
        end
    },
    -- Preview
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function() vim.fn["mkdp#util#install"]() end,
    }
}
