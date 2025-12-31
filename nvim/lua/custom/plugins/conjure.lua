return {
  {
    "Olical/conjure",
    init = function()
      vim.g.maplocalleader = " "
      vim.g["conjure#completion#use_ts"] = false
      vim.g["conjure#log#hud#enabled"] = false
      vim.g['conjure#client#scheme#stdio#command'] = 'gsi'
      vim.g['conjure#client#scheme#stdio#prompt_pattern'] = '> '
    end,
  }
}
