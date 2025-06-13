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
            cmd = "Copilot",
            build = ":Copilot auth",
            opts = {
                suggestion = { enabled = true },
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
