return {
	"codota/tabnine-nvim",
	build = {
		"./dl_binaries.sh",
		"cd chat/; cargo build --release",
	},
	config = function()
		local tabnine = require("tabnine")
		tabnine.setup({
			disable_auto_comment = true,
			accept_keymap = "<C-t>",
			dismiss_keymap = "<C-s>",
			debounce_ms = 800,
			suggestion_color = { gui = "#dbbc7f" },
			exclude_filetypes = { "TelescopePrompt" },
			log_file_path = nil,
			ignore_certificate_errors = false,
		})

		vim.cmd("TabnineDisable")
	end,
}
