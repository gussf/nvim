require('go').setup()

require("go.format").goimport() -- goimport + gofmt

-- Run gofmt + goimport on save
local format_sync_grp = vim.api.nvim_create_augroup("GoImport", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    require('go.format').goimport()
  end,
  group = format_sync_grp,
})

vim.keymap.set("n", "<leader>gie", ":GoIfErr <CR>",
  { desc = '[I]f [E]rr' })
