return {
	"codota/tabnine-nvim",
	commit = "6d209e52239e09e19c4913595cb253d2c364afa8",
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
