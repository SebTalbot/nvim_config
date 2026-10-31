---@type vim.lsp.Config
return {
	cmd = {
		"clangd",
		"--background-index",
		"--clang-tidy",
		"--header-insertion=iwyu",
		"--completion-style=detailed",
		"--function-arg-placeholders=1",
	},
	filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
	root_markers = {
		".clangd",
		".clang-tidy",
		".clang-format",
		"compile_commands.json",
		"compile_flags.txt",
		"configure.ac",
		"Makefile",
		"CMakeLists.txt",
		"meson.build",
		".git",
	},
	capabilities = {
		offsetEncoding = { "utf-8", "utf-16" },
	},
}
