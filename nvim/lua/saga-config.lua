local saga = require 'lspsaga'

-- use default config
saga.init_lsp_saga()

-- lsp finder to find the cursor word definition and reference
-- or use command LspSagaFinder
vim.keymap.set("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", { silent = true })

-- or use command
vim.keymap.set("n", "gH", "<cmd>Lspsaga hover_doc<CR>", { silent = true })

-- rename
vim.keymap.set("n", "gr", require("lspsaga.rename").lsp_rename, { silent = true })

-- or use command
vim.keymap.set("n", "gD", "<cmd>Lspsaga preview_definition<CR>", { silent = true })

-- action config
local action = require("lspsaga.action")
-- scroll down hover doc or scroll in definition preview
vim.keymap.set("n", "<C-f>", function()
    action.smart_scroll_with_saga(1)
end, { silent = true })
-- scroll up hover doc
vim.keymap.set("n", "<C-b>", function()
    action.smart_scroll_with_saga(-1)
end, { silent = true })
