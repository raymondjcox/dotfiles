local cmp_status_ok, comment = pcall(require, "Comment")
if not cmp_status_ok then
	return
end

comment.setup({
	toggler = { line = "<leader>ci", block = "<leader>cb" },
	opleader = { line = "<leader>ci", block = "<leader>cb" },
	extra = { above = "gcO", below = "gco", eol = "gcA" },
})

local cmp_status_ok, tsConfigs = pcall(require, "nvim-treesitter.configs")
if not cmp_status_ok then
	return
end

tsConfigs.setup({
	context_commentstring = {
		enable = true,
	},
})
