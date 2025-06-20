-- Current Language
local lang = string.sub(vim.v.lang, 1, 2)
local po_path = vim.fn.stdpath('config') .. "/lua/andrem222/po/" .. lang .. ".po"

-- Translation table
local translations = {}

-- Basic PO file parser
local function parse_po(path)
    local file = io.open(path, "r")
    if not file then return {} end

    local msgid, msgstr
    for line in file:lines() do
        if line:match("^msgid") then
            msgid = line:match('^msgid%s+"(.*)"')
        elseif line:match("^msgstr") then
            msgstr = line:match('^msgstr%s+"(.*)"')
            if msgid and msgstr then
                translations[msgid] = msgstr
                msgid, msgstr = nil, nil
            end
        end
    end

    file:close()
    return translations
end

-- Load translations
translations = parse_po(po_path)

--- This function returns the translation if available and not empty
--- @param description string Description to translate
--- @return string
function Msgstr(description)
    local translated = translations[description]
    if not translated or translated == "" then
        return description
    end
    return translated
end
