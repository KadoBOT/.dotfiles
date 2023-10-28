local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.sql = {
	install_info = {
		url = "https://github.com/DerekStride/tree-sitter-sql",
		files = { "src/parser.c" },
		branch = "main",
		generated_requires_npm = true,
		requires_generate_from_grammar = false,
	},
}
