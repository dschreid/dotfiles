vim.keymap.set("n", "<M-j>", "<Cmd>try | cnext | catch | cfirst | catch | endtry<CR>", { silent = true })
vim.keymap.set("n", "<M-k>", "<Cmd>try | cprevious | catch | clast | catch | endtry<CR>", { silent = true })
return {};
