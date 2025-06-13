function CopilotIcon()
    if CopilotEnable then
        return {
            'copilot',
            symbols = {
                status = {
                    icons = {
                        enabled = "",
                        sleep = "",
                        disabled = "",
                        warning = "",
                        unknown = ""
                    }
                }
            },
            -- show_colors = true
        }
    end

    return ""
end

function CopilotCMP()
    if CopilotEnable then
        return {
            default = { "lsp", "path", "snippets", "buffer", "copilot" },
            providers = {
                copilot = {
                    name = "copilot",
                    module = "blink-cmp-copilot",
                    score_offset = 100,
                    async = true,
                }
            }
        }
    end

    return { default = { "lsp", "path", "snippets", "buffer" } }
end
