local present, null_ls = pcall(require, "null-ls")

if not present then
   return
end

local b = null_ls.builtins

local sources = {
	b.formatting.gofmt,
}

null_ls.setup {
	debug = true,
	sources = sources,
	
	-- Format on save
	on_attach = function()
		vim.api.nvim_create_autocmd("BufWritePost", {
			callback = function()
				vim.lsp.buf.format()
			end,
		})
	end,
}