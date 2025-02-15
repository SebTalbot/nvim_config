return {
	on_attach = function(client, bufnr)
		client.server_capabilities.document_formatting = false
		client.server_capabilities.document_range_formatting = false
		require("plugins.configs.lsp.handlers").on_attach(client, bufnr)
	end,
}
