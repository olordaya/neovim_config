-- Navigate vim panes better
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)


vim.keymap.set("v", "J",":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K",":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-d>" , "<C-d>zz")
vim.keymap.set("n", "<C-u>" , "<C-u>zz")

vim.keymap.set("n", "n" , "nzzzv")
vim.keymap.set("n", "N" , "Nzzzv")

vim.keymap.set("x", "<leader>p" , "\"_dp")

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

vim.keymap.set("n" , "<leader>sv",":w!<CR>")
--vim.keymap.set("n" , "<C-s>",":update<CR>")
vim.keymap.set("n" , "<leader>q",":q!<CR>")

vim.keymap.set("n" , "<leader>vs",":vsplit<CR>")
vim.keymap.set("n" , "<leader>hs",":split<CR>")

--terminal mode
vim.keymap.set("n" , "<leader>tv",":below vertical terminal<CR>")


vim.keymap.set("n" , "<C-n> ",":tabnext<CR>")
vim.keymap.set("n" , "<C-p> ",":tabprevious<CR>")


vim.keymap.set("n" , "<leader>sm",":vertical resize -25<CR>")
vim.keymap.set("n" , "<leader>ms",":vertical resize +25<CR>")

vim.keymap.set("n" , "<C-t>",":tabnew<CR>")

--compliers
--vim.keymap.set("n" , "<leader>W",":w <bar> :exec '!python3' shellescape(@%, 1)<CR>")
-- Python filetype
vim.api.nvim_exec("autocmd FileType python nnoremap <leader>W :w <bar> exec '!python3 '.shellescape('%')<CR>", true)

-- C filetype
vim.api.nvim_exec("autocmd FileType c nnoremap <leader>W :w <bar> exec '!gcc '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>", true)



vim.api.nvim_exec([[
nnoremap :b <C-R><C-B><CR>
]], true)

-- Enable folding
vim.api.nvim_exec([[
set foldmethod=indent
]], true)

-- Quicksave command
vim.api.nvim_exec([[
noremap <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>
]], true)

-- Split
vim.api.nvim_exec([[
nnoremap <leader>vs :vsplit<CR>
nnoremap <leader>ls :<C-w>s<CR>
]], true)

vim.api.nvim_exec([[
map <C-n> <esc>:tabprevious<CR>
map <C-m> <esc>:tabnext<CR>
]], true)


vim.api.nvim_exec([[
autocmd BufWritePre *.py :%s/\s\+$//e
autocmd BufWritePre *.c :%s/\s\+$//e
]], true)

vim.api.nvim_exec([[
xnoremap > >gv
xnoremap < <gv
]], true)

vim.api.nvim_set_keymap('i', '?/', '<C-x><C-f>', { noremap = true })


vim.api.nvim_exec([[
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
]], true)

vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-l>h', { noremap = true, silent = true })
