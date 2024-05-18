vim.keymap.set('n', '<leader>mo', ':MagmaInit python3<CR>')
--vim.keymap.set('n', '<leader>mr', ':MagmaEvaluateOperator<CR>')
vim.keymap.set('n', '<leader>me', ':MagmaEvaluateLine<CR>')
vim.keymap.set('x', '<leader>mv', ':<C-u>MagmaEvaluateVisual<CR>')
vim.keymap.set('n', '<leader>mre', ':MagmaReevaluateCell<CR>')
vim.keymap.set('n', '<leader>md', ':MagmaDelete<CR>')
vim.keymap.set('n', '<leader>mso', ':MagmaShowOutput<CR>')
vim.keymap.set('x', '<LocalLeader>mr', ':lua vim.api.nvim_exec("MagmaEvaluateOperator", true)<CR>', { silent = true, expr = true })
-- Configuration options
vim.g.magma_automatically_open_output = false
vim.g.magma_wrap_output = true  -- Set to false to disable text wrapping in the output window
vim.g.magma_output_window_borders = true
--- vim.g.magma_image_provider = "kitty"
