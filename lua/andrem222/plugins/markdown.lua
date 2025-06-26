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

                markdown = {
                    headings = {
                        enable = true,
                        shift_width = 0,

                        heading_1 = {
                            style = "label",

                            padding_left = " ",
                            padding_right = " ",

                            corner_left = "",
                            corner_left_hl = "MarkviewHeading1Corner",
                            corner_right = "",
                            corner_right_hl = "MarkviewHeading1Corner",

                            hl = "MarkviewHeading1"
                        },
                        heading_2 = {
                            style = "label",

                            padding_left = " ",
                            padding_right = " ",

                            corner_left = "",
                            corner_left_hl = "MarkviewHeading2Corner",
                            corner_right = "",
                            corner_right_hl = "MarkviewHeading2Corner",

                            hl = "MarkviewHeading2"
                        },
                        heading_3 = {
                            style = "label",

                            padding_left = " ",
                            padding_right = " ",

                            corner_left = "",
                            corner_left_hl = "MarkviewHeading3Corner",
                            corner_right = "",
                            corner_right_hl = "MarkviewHeading3Corner",

                            hl = "MarkviewHeading3"
                        },
                        heading_4 = {
                            style = "label",

                            padding_left = " ",
                            padding_right = " ",

                            corner_left = "",
                            corner_left_hl = "MarkviewHeading4Corner",
                            corner_right = "",
                            corner_right_hl = "MarkviewHeading4Corner",

                            hl = "MarkviewHeading4"
                        },
                        heading_5 = {
                            style = "label",

                            padding_left = " ",
                            padding_right = " ",

                            corner_left = "",
                            corner_left_hl = "MarkviewHeading5Corner",
                            corner_right = "",
                            corner_right_hl = "MarkviewHeading5Corner",

                            hl = "MarkviewHeading5"
                        },
                        heading_6 = {
                            style = "label",

                            padding_left = " ",
                            padding_right = " ",

                            corner_left = "",
                            corner_left_hl = "MarkviewHeading6Corner",
                            corner_right = "",
                            corner_right_hl = "MarkviewHeading6Corner",

                            hl = "MarkviewHeading6"
                        },
                    }
                }
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
