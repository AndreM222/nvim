local dracula = require("dracula")

dracula.setup({
    -- Remove Background Color
    colors = { bg = "NONE" },

    overrides = {
        -- Hide buffers
        BufferLineFill = { bg = "NONE" },

        -- Diagnostics
        DiagnosticWarn = { fg = dracula.colors().orange },
        WarningMsg = { fg = dracula.colors().orange },
        DiagnosticUnderlineWarn = { undercurl = true, sp = dracula.colors().orange },
        DiagnosticSignWarn = { fg = dracula.colors().orange },
        DiagnosticFloatingWarn = { fg = dracula.colors().orange },
        DiagnosticVirtualTextWarn = { fg = dracula.colors().orange },
        LspDiagnosticsDefaultWarning = { fg = dracula.colors().orange },
        LspDiagnosticsUnderlineWarning = { fg = dracula.colors().orange, undercurl = true },

        -- Borders
        FloatBorder = { fg = dracula.colors().comment },
        VertSplit = { fg = dracula.colors().comment },
        WinSeparator = { fg = dracula.colors().comment },
        WinBar = { fg = "NONE", bg = "NONE" },
        WinBarNC = { fg = "NONE", bg = "NONE" },

        -- Missing fg color and extra setup
        IblScope = { fg = dracula.colors().comment, nocombine = true },

        -- Search
        IncSearch = { bg = "#957251" },
        CurSearch = { bg = "#957251" },
        Search = { bg = dracula.colors().selection }, -- Also changes the noice progress

        -- Noice Progress -- Using this since separating search and noice progress from each other
        NoiceFormatProgressDone = { bg = dracula.colors().orange },

        -- Extra
        CursorLineNr = { fg = "Orange" },

        -- Saga Separator
        SagaWinbarSep = { fg = dracula.colors().comment },

        -- Info Boxes
        NullLsInfoBorder = { fg = dracula.colors().comment },
        LspInfoBorder = { fg = dracula.colors().comment },
        MasonHighlight = { fg = dracula.colors().green, default = true },

        -- Gitsigns
        GitSignsCurrentLineBlame = { fg = dracula.colors().selection },

        -- Dashboard
        DashboardHeader = { fg = "#ffffff" },
        DashboardFooter = { fg = "#ffffff" },

        -- Bufferline
        BufferLineSeparator = { fg = dracula.colors().bg }
    },

    show_end_of_buffer = true, -- Needed for markview
    transparent_bg = true,
})

vim.cmd('colorscheme dracula')
