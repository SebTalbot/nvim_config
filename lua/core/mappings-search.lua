local M = {}

M.Files = function()
	local builtin = require("telescope.builtin")
	builtin.find_files({
		prompt_title = "Files",
		hidden = true,
		no_ignore = true,
		file_ignore_patterns = {
			-- Directories
			".git/",
			"node_modules/", -- node

			-- Tests
			"%/test%/",
			"%/tests%/",
			"%.test%.", -- node
			"%.tests%.", -- node
			"_test.go$", -- go

			-- Non-text Files
			".jpg$",
			".jpeg$",
			".gif$",
			".bmp$",
			".png$",
			".woff$",
		},
	})
end

M.GrepString = function()
	local builtin = require("telescope.builtin")
	builtin.grep_string({
		prompt_title = "Fuzzy",
		additional_args = {
			"--hidden",
			"--no-ignore",
		},
		glob_pattern = {
			-- Files
			"!package-lock.json", -- node
			"!go.sum", -- go

			-- Directories
			"!.git/**",
			"!node_modules/**", -- node

			-- Tests
			"!**/test/**",
			"!**/tests/**",
			"!*.test.*", -- node
			"!*.tests.*", -- node
			"!*_test.go", -- go
		},
	})
end

M.LiveGrep = function()
	local builtin = require("telescope.builtin")
	builtin.live_grep({
		prompt_title = "Ripgrep",
		additional_args = {
			"--hidden",
			"--no-ignore",
		},
		glob_pattern = {
			-- Files
			"!package-lock.json", -- node
			"!go.sum", -- go

			-- Directories
			"!.git/**",
			"!node_modules/**", -- node

			-- Tests
			"!**/test/**",
			"!**/tests/**",
			"!*.test.*", -- node
			"!*.tests.*", -- node
			"!*_test.go", -- go
		},
	})
end

M.TestsFiles = function()
	local builtin = require("telescope.builtin")
	builtin.find_files({
		prompt_title = "Files (Tests)",
		find_command = {
			"rg",
			"--files",
			"--hidden",
			"--no-ignore",
			"-g", "!.git/**",
			"-g", "!node_modules/**", -- node
			"-g", "**/test/**",
			"-g", "**/tests/**",
			"-g", "*.test.*", -- node
			"-g", "*.tests.*", -- node
			"-g", "*_test.go", -- go
		},
	})
end

M.TestsGrepString = function()
	local builtin = require("telescope.builtin")
	builtin.grep_string({
		prompt_title = "Fuzzy (Tests)",
		additional_args = {
			"--hidden",
			"--no-ignore",
		},
		glob_pattern = {
			-- Directories
			"!.git/**",
			"!node_modules/**", -- node

			-- Tests
			"**/test/**",
			"**/tests/**",
			"*.test.*", -- node
			"*.tests.*", -- node
			"*_test.go", -- go
		},
	})
end

M.TestsLiveGrep = function()
	local builtin = require("telescope.builtin")
	builtin.live_grep({
		prompt_title = "Ripgrep (Tests)",
		additional_args = {
			"--hidden",
			"--no-ignore",
		},
		glob_pattern = {
			-- Directories
			"!.git/**",
			"!node_modules/**", -- node

			-- Tests
			"**/test/**",
			"**/tests/**",
			"*.test.*", -- node
			"*.tests.*", -- node
			"*_test.go", -- go
		},
	})
end

return M
