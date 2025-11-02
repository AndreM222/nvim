if CopilotEnable then
    return {
        -- Plugin
        {
            "AndreM222/copilot-lualine",
            dev = CopilotDev
        },

        -- Requirements

        {
            "zbirenbaum/copilot.lua",
            opts = {
                suggestion = {
                    auto_trigger = false,
                    enabled = false
                },
                panel = { enabled = false },
                filetypes = {
                    markdown = true,
                    help = true,
                },
            }
        },

        {
            "giuxtaposition/blink-cmp-copilot",
        }
    }
end

return {}
