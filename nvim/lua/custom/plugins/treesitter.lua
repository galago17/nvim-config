return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate', -- This command runs after installation to update parsers
  lazy = false,
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    require('nvim-treesitter.config').setup({
      ensure_installed = {"haskell", "c++"},
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
    })
  end
}

