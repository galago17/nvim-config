return {
  {
    "kovisoft/slimv",
    ft = { "lisp", "scheme", "clojure" }, -- Load only for Lisp-like files
    config = function()
      -- Basic SLIMV settings
      vim.g.slimv_swank_cmd = '! xterm -e ros run --load ~/.vim/slimv/start-swank.lisp &'
      -- You might need to adjust the above based on your Lisp implementation

      -- Optional: Set your preferred Lisp implementation
      -- vim.g.slimv_lisp = 'sbcl'  -- or 'clisp', 'clozure', etc.

      -- Optional: REPL split settings
      -- vim.g.slimv_repl_split = 4  -- vertical split
    end,
  }
}
