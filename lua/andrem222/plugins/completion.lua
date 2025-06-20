return {
    {
        'saghen/blink.cmp',
        dependencies = { 'rafamadriz/friendly-snippets' },

        version = '1.*',

        opts = {
            keymap = {
                preset = 'super-tab',
                ['<CR>'] = { 'accept', 'fallback' },
            },

            completion = {
                list = { selection = { auto_insert = false } },

                menu = {
                    winblend = vim.o.pumblend,
                    draw = {
                        columns = { { 'kind_icon' }, { 'label', 'label_description', gap = 1 }, { "kind" } },
                    }
                },

                documentation = {
                    auto_show = true,
                    window = {
                        winblend = vim.o.pumblend,
                        winhighlight =
                        'Normal:BlinkCmpMenu,FloatBorder:BlinkCmpMenuBorder,CursorLine:BlinkCmpMenuSelection,Search:None'
                    }
                },

                ghost_text = { enabled = true }
            },

            cmdline = {
                keymap = { preset = 'super-tab' },
                completion = {
                    menu = { auto_show = true },
                    ghost_text = { enabled = true }
                }
            },

            signature = {
                window = {
                    winblend = vim.o.pumblend,
                },
            },

            sources = CopilotCMP(),

            appearance = { nerd_font_variant = 'mono' },
        },
        opts_extend = { "sources.default" }
    },
    {
        'windwp/nvim-autopairs', -- Autopairs
        config = function()
            local autopairs = require("nvim-autopairs")

            autopairs.setup()

            local Rule = require('nvim-autopairs.rule')
            local cond = require('nvim-autopairs.conds')

            local brackets = { { '(', ')' }, { '[', ']' }, { '{', '}' } }
            autopairs.add_rules {
                Rule(' ', ' ')
                    :with_pair(function(opts)
                        local pair = opts.line:sub(opts.col - 1, opts.col)
                        return vim.tbl_contains({
                            brackets[1][1] .. brackets[1][2],
                            brackets[2][1] .. brackets[2][2],
                            brackets[3][1] .. brackets[3][2]
                        }, pair)
                    end)
                    :with_move(cond.none())
                    :with_cr(cond.none())
                    :with_del(function(opts)
                        local col = vim.api.nvim_win_get_cursor(0)[2]
                        local context = opts.line:sub(col - 1, col + 2)
                        return vim.tbl_contains({
                            brackets[1][1] .. '  ' .. brackets[1][2],
                            brackets[2][1] .. '  ' .. brackets[2][2],
                            brackets[3][1] .. '  ' .. brackets[3][2]
                        }, context)
                    end)
            }
            for _, bracket in pairs(brackets) do
                Rule('', ' ' .. bracket[2])
                    :with_pair(cond.none())
                    :with_move(function(opts) return opts.char == bracket[2] end)
                    :with_cr(cond.none())
                    :with_del(cond.none())
                    :use_key(bracket[2])
            end
        end,

    }
}
