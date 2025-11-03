return {
  { "rktjmp/lush.nvim", lazy = true },

  -- color scehemes
  { "ellisonleao/gruvbox.nvim" },
  { "mcchrish/zenbones.nvim", dependencies = { "rktjmp/lush.nvim" } },
  { "kdheepak/monochrome.nvim" },
  { "p00f/alabaster.nvim" },
  { "vague2k/vague.nvim" }, -- nice
  { "rebelot/kanagawa.nvim" },
  { "sainnhe/everforest" },
  { "bluz71/vim-moonfly-colors" },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "vague",
    },
  },

  -- add more treesitter parsers
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "yaml",
      },
    },
  },

  -- since `vim.tbl_deep_extend`, can only merge tables and not lists, the code above
  -- would overwrite `ensure_installed` with the new value.
  -- If you'd rather extend the default config, use the code below instead:
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- add tsx and treesitter
      vim.list_extend(opts.ensure_installed, {
        "tsx",
        "typescript",
      })
    end,
  },
}
