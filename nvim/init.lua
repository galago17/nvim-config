require("custom.lazy")
require("custom.lsp")
require("oil").setup()
require('rainbow-delimiters.setup').setup()
require('lualine').setup()
-- vim.cmd("source ~/.config/nvim/vlime.vim")

vim.opt.splitbelow = true
vim.opt.splitright = true
vim.o.number = true
vim.cmd("syntax on")
vim.o.tabstop = 2
vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.autoindent = true
vim.opt.termguicolors = true
vim.o.cindent = true
vim.o.relativenumber = true

vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]])
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

vim.keymap.set("n", "<leader>ql", function() require("persistence").load({ last = true }) end)


vim.cmd("colorscheme catppuccin-frappe")
vim.cmd("cd ~/Documents/programming")
vim.keymap.set('n', '<leader>o', function() vim.cmd("tabnew ~/.config/nvim/init.lua") end)
vim.keymap.set('n', '<leader>k', vim.diagnostic.goto_prev)
vim.keymap.set('n', '<leader>j', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'Code action' })



vim.lsp.enable('clangd')
vim.lsp.enable('lua_ls')
vim.lsp.enable('rkt_ls')


local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>d', ':bd!<enter>')

vim.api.nvim_create_autocmd("FileType", {
  pattern = {"scheme", "haskell", "lisp"},
  callback = function()
    vim.treesitter.start()
  end
})

if vim.fn.argc() == 0 then
  vim.schedule(function()
    vim.cmd("e ~/Documents/programming/status.md")
    vim.bo.filetype = "markdown"
  end)
end
