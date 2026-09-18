vim.pack.add({
  'https://github.com/catppuccin/nvim',
  'https://github.com/nvim-lualine/lualine.nvim',
  'https://github.com/nvim-tree/nvim-web-devicons',
  'https://github.com/stevearc/oil.nvim',
  'https://github.com/lervag/vimtex',
  'https://github.com/neovim/nvim-lspconfig',
  'https://github.com/windwp/nvim-autopairs',
  'https://github.com/folke/persistence.nvim',
  'https://github.com/nvim-treesitter/nvim-treesitter',
  'https://github.com/mrcjkb/haskell-tools.nvim',
  'https://github.com/Josiah-tan/plover-vim-tutor',
  'https://github.com/R-nvim/R.nvim',
  'https://github.com/wsdjeg/picker.nvim',
  'https://github.com/Olical/conjure',
  'https://github.com/kovisoft/paredit',
  'https://github.com/edluffy/hologram.nvim',
  'https://github.com/MunifTanjim/nui.nvim',
  'https://github.com/giusgad/pets.nvim'
})



vim.pack.add({
  {
    src = 'https://github.com/JavaHello/spring-boot.nvim',
    version = '218c0c26c14d99feca778e4d13f5ec3e8b1b60f0',
  },
  'https://github.com/MunifTanjim/nui.nvim',
  'https://github.com/mfussenegger/nvim-dap',
  'https://github.com/nvim-java/nvim-java',
})

vim.g["conjure#filetype#scheme"] = "conjure.client.guile.socket"
vim.g["conjure#client#guile#socket#pipename"] = "/Users/keshavravi/Documents/programming/scheme/.guile-repl.socket"
vim.g.paredit_mode = 1
vim.g.paredit_electric_return = 1
require('java').setup()
vim.lsp.enable('jdtls')

require('picker').setup({
  mappings = {
    close = '<Esc>',
    next_item = '<down>',
    previous_item = '<up>',
    open_item = '<Enter>',
    toggle_preview = '<C-p>',
  },
})
require('lualine').setup()
require('oil').setup()
require("custom.lsp")
require('nvim-treesitter').install { 'go', 'java', 'commonlisp', 'haskell', 'scheme', 'r', 'markdown', 'csv'}
require('persistence').setup()

require('hologram').setup{
  auto_display = false;
}
require('pets').setup()

vim.cmd('filetype plugin indent on')
vim.g.vimtex_compiler_method = 'latexmk'
vim.g.vimtex_compiler_latexmk_engines = { _ = '-xelatex' }
vim.g.vimtex_view_method = 'skim'
vim.o.autoread = true

vim.o.autocomplete = true
vim.opt.swapfile = false
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
vim.keymap.set('n', '<leader>d', ':q!<enter>')
vim.keymap.set('n', '<leader>j', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'Code action' })
vim.keymap.set('n', '<leader> ', ':Picker files<enter>')

vim.api.nvim_create_autocmd("FileType", {
  pattern = {"scheme", "haskell", "lisp", "java", "markdown", "r", "csv"},
  callback = function()
    vim.treesitter.start()
  end
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = {"haskell", "java", "markdown", "r", "csv", "lua"},
  callback = function()
    require('nvim-autopairs').setup()
  end
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = {"markdown"},
  callback = function()
    vim.o.conceallevel = 2
  end
})
