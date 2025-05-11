return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		local cmp = require("cmp")
		cmp.setup({
			mapping = {
				["<C-e>"] = cmp.mapping.confirm({ select = true }),
				["<C-p>"] = cmp.mapping.select_prev_item({
					behavior = cmp.SelectBehavior.Select,
				}),
				["<C-n>"] = cmp.mapping.select_next_item({
					behavior = cmp.SelectBehavior.Select,
				}),
				["<C-Up>"] = cmp.mapping.select_prev_item({
					behavior = cmp.SelectBehavior.Select,
					count = 10,
				}),
				["<C-Down>"] = cmp.mapping.select_next_item({
					behavior = cmp.SelectBehavior.Select,
					count = 10,
				}),
				["<C-u>"] = cmp.mapping(
					cmp.mapping.scroll_docs(-5),
					{ "i", "c" }
				),
				["<C-d>"] = cmp.mapping(
					cmp.mapping.scroll_docs(5),
					{ "i", "c" }
				),
				["<C-Space>"] = cmp.mapping(
					cmp.mapping.complete(),
					{ "i", "c" }
				),
				["<C-z>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
				["<C-y>"] = cmp.mapping({
					i = cmp.mapping.abort(),
					c = cmp.mapping.close(),
				}),
			},
			sources = {
				{ name = "nvim_lsp" },
			},
		})
	end,
}
