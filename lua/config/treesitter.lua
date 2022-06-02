local treesitter_parsers = require("nvim-treesitter.parsers").get_parser_configs()

treesitter_parsers.norg = {
    install_info = {
        url = "https://github.com/nvim-neorg/tree-sitter-norg",
        files = { "src/parser.c", "src/scanner.cc" },
        branch = "main",
    },
}

local treesitter_config = require("nvim-treesitter.configs")
treesitter_config.setup({ ensure_installed = {
        "lua",
        "toml",
        "norg",
        "comment",
    },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
})
