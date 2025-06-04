return {
    -- Coding Tools
    { 'numToStr/Comment.nvim' }, -- Comment

    {
        "ThePrimeagen/refactoring.nvim", -- Refactoring
        config = function()
            require("refactoring.refactor").refactor_names = {
                [Msgstr("Inline Variable")] = "inline_var",
                [Msgstr("Extract Variable")] = "extract_var",
                [Msgstr("Extract Function")] = "extract",
                [Msgstr("Extract Function To File")] = "extract_to_file",
                [Msgstr("Extract Block")] = "extract_block",
                [Msgstr("Extract Block To File")] = "extract_block_to_file",
                [Msgstr("Inline Function")] = "inline_func"
            }

            vim.api.nvim_create_user_command(
                "RefactorList",
                function(opts)
                    require("plenary.async").void(function()
                        local selected_refactor = require("refactoring.ui").select(
                            require("refactoring").get_refactors(),
                            Msgstr("Refactoring: select a refactor to apply:")
                        )

                        if not selected_refactor then
                            return
                        end

                        local keys = require("refactoring").refactor(selected_refactor, opts)

                        if keys == "g@" then
                            keys = "gvg@"
                        end

                        vim.cmd.normal(keys)
                    end)()
                end,
                {}
            )
        end,
    },

    {
        "monaqa/dial.nvim", -- Incerement and Decrement Improvement
        keys = {
            { "<C-a>", function() return require("dial.map").inc_normal() end, expr = true, desc = Msgstr("Increment Value Under Cursor") },
            { "<C-x>", function() return require("dial.map").dec_normal() end, expr = true, desc = Msgstr("Decrement Value Under Cursor") },
        },
        config = function()
            local augend = require("dial.augend")
            require("dial.config").augends:register_group({
                default = {
                    augend.integer.alias.decimal,
                    augend.integer.alias.hex,
                    augend.date.alias["%Y/%m/%d"],
                    augend.constant.alias.bool,
                    augend.semver.alias.semver,
                    augend.constant.new({ elements = { "let", "const" } }),
                },
            })
        end,
    },

    {
        "danymat/neogen",
        keys = {
            {
                "<leader>cc",
                function()
                    require("neogen").generate({})
                end,
                desc = "Neogen Comment",
            },
        },
        opts = { snippet_engine = "luasnip" },
    }
}
