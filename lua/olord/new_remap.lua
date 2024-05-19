-- Set leader key
vim.g.mapleader = " "

-- Key mappings using vim.api.nvim_set_keymap
local function map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend('force', options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Normal mode mappings
map("n", "<leader>pv", ":Ex<CR>")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("n", "<leader>y", "\"+y")
map("n", "<leader>Y", "\"+Y")
map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
map("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
map("n", "<leader>sv", ":w!<CR>")
map("n", "<leader>q", ":q!<CR>")
map("n", "<leader>vs", ":vsplit<CR>")
map("n", "<leader>hs", ":split<CR>")
map("n", "<C-n>", ":tabnext<CR>")
map("n", "<C-p>", ":tabprevious<CR>")
map("n", "<leader>sm", ":vertical resize -25<CR>")
map("n", "<leader>ms", ":vertical resize +25<CR>")
map("n", "<C-t>", ":tabnew<CR>")

-- Visual mode mappings
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")
map("v", "<leader>y", "\"+y")

-- Visual mode mapping for pasting
map("x", "<leader>p", "\"_dp")

-- Insert mode mappings
map("i", "?/", "<C-x><C-f>", { noremap = true })

-- Terminal mode mappings
map("n", "<leader>tv", ":below vertical terminal<CR>")

-- Map <C-S> for quick save
map("n", "<C-S>", ":update<CR>")
map("v", "<C-S>", "<C-C>:update<CR>")

-- Split window mappings
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-h>", "<C-w>h")
map("n", "<C-l>", "<C-w>l")

-- Autocommands for file-specific settings
vim.api.nvim_exec([[
  autocmd FileType python nnoremap <leader>W :w <bar> exec '!python3 '.shellescape('%')<CR>
  autocmd FileType c nnoremap <leader>W :w <bar> exec '!gcc '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
  autocmd BufWritePre *.py :%s/\s\+$//e
  autocmd BufWritePre *.c :%s/\s\+$//e
]], true)

-- Folding and other settings
vim.api.nvim_exec([[
  set foldmethod=indent
  xnoremap > >gv
  xnoremap < <gv
  nnoremap :b <C-R><C-B><CR>
]], true)

