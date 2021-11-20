require'nvim-treesitter.configs'.setup {
  -- windwp/nvim-ts-autotag
  autotag = {
    enable = true
  },
  -- END windwp/nvim-ts-autotag

  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = true,
    disable = {}
  },
  ensure_installed = {
     "tsx",
      "javascript",
      "typescript",
      "json",
      "html",
      "css",
      "scss",
      "vim",
      "lua",
  }
}
