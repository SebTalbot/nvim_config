local tabnine_status_ok, tabnine = pcall(require, "tabnine")
if not tabnine_status_ok then
	return
end

tabnine.setup({
	disable_auto_comment = true,
	accept_keymap = "<C-t>",
	dismiss_keymap = "<C-s>",
	debounce_ms = 300,
	suggestion_color = { gui = "#dbbc7f" },
	exclude_filetypes = { "TelescopePrompt" },
	log_file_path = nil,
})
