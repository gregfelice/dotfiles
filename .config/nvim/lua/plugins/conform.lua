return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        -- ❌ Remove the black formatter here if it's explicitly listed.

        python = {
          "ruff_format", -- ✅ Use Ruff's dedicated formatter command
          "ruff_fix", -- Optional: runs autofixes for linting
          "ruff_organize_imports", -- Optional: runs import sorting
        },

      },
      -- Pass the line length argument to the ruff_format command
      formatters = {
        ruff_format = {
          prepend_args = { "--line-length", "80" },
        },
        prettier = {
          prepend_args = { "--print-width", "80" },
        },
      },
    },
  },
}
