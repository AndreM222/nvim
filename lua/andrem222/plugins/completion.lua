return {
    {
        'hrsh7th/nvim-cmp', -- Autocompletion
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            {
                'L3MON4D3/LuaSnip',
                build = (vim.uv.os_uname().sysname:find("Windows") ~= nil)
                    and "echo '"..Msgstr("NOTE: jsregexp is optional, so not a big deal if it fails to build").."'; make install_jsregexp"
                    or nil,
                dependencies = {
                    {
                        "rafamadriz/friendly-snippets", -- More Snippets
                        config = function()
                            require("luasnip.loaders.from_vscode").lazy_load()
                        end,
                    },
                }
            },
            'saadparwaiz1/cmp_luasnip'
        },
        config = function()
            local cmp = require("cmp")

            cmp.setup({
                window = {
                    documentation = {
                        winhighlight = "Normal:Pmenu,FloatBorder:Pmenu"
                    }
                },
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ['<c-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<c->'] = cmp.mapping.scroll_docs(4),
                    ['<c-space>'] = cmp.mapping.complete(),
                    ['<tab>'] = cmp.mapping.confirm({ select = true }),
                    ['<c-e>'] = cmp.mapping.abort(),
                    ['<cr>'] = cmp.mapping.confirm({ select = true }),
                }),
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'buffer' },
                    { name = 'luasnip' },
                    CopilotCMP()
                }),
                formatting = {
                    fields = { 'kind', 'abbr', 'menu' },
                    format = function(entry, vim_item)
                        local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry,
                            vim_item)
                        local strings = vim.split(kind.kind, "%s", { trimempty = true })
                        kind.kind = (strings[1] or "")
                        kind.menu = "    " .. (strings[2] or "") .. ""
                        kind.ellipsis_char = '...'

                        return kind
                    end,
                }
            })

            -- set configuration for specific filetype.
            cmp.setup.filetype('gitcommit', {
                sources = cmp.config.sources({
                    { name = 'cmp_git' },
                }, {
                    { name = 'buffer' },
                })
            })

            vim.cmd [[
    set completeopt=menuone,noinsert,noselect,fuzzy
    highlight! default link cmpitemkind cmpitemmenudefault
]]
        end
    },
    {
        'onsails/lspkind-nvim', -- Icons
        config = function()
            require("lspkind").init({
                mode = 'symbol_text',
                preset = 'codicons',
                symbol_map = {
                    Text = "",
                    Method = "",
                    Function = "",
                    Constructor = "",
                    Field = "",
                    Variable = "",
                    Class = "",
                    Interface = "",
                    Module = "",
                    Property = "",
                    Unit = "",
                    Value = "",
                    Enum = "",
                    Keyword = "",
                    Snippet = "",
                    Color = "",
                    File = "",
                    Reference = "",
                    Folder = "",
                    EnumMember = "",
                    Constant = "",
                    Struct = "",
                    Event = "",
                    Operator = "",
                    TypeParameter = "",
                    Copilot = ""
                }
            })
        end
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

    },
    { 'windwp/nvim-ts-autotag' } -- Autotag
}
