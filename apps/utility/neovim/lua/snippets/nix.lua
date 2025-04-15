return {
    require("luasnip").snippet(
        { trig = "start", snippetType = "snippet", desc = "creates a basic outline for nix files", wordTrig = true },
        { t({ "{config, pkgs, lib, ...}:",
            "{",
            "    imports = [];",
            "",
            "    options = {};",
            "",
            "    config = {};",
            "}",
        }), }
    ),
}
