local servers = { "lua_ls", "tsserver", "pyright" }

require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = servers 
})

local on_attach = function(_, _) 
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})

	vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
	vim.keymap.set("n", "gi", vim.lsp.buf.definition, {})
	vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, {})
end

for _, lsp in ipairs(servers) do
	require("lspconfig")[lsp].setup {
		on_attach = on_attach
	}
end
