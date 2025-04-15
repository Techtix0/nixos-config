return {
    -- To get the filtype use `:lua print(vim.inspect(require("luasnip").get_snippet_filetypes()))`
    require("luasnip").snippet(
        { trig = "helloworld", snippetType = "snippet", desc = "A hello world snippet", wordTrig = true },
        { t("Just a hint of what's to come!"), }
    ),
}

