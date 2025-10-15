-- ~/.config/nvim/lua/plugins/toc.lua
return {
  "hedyhli/markdown-toc.nvim",
  ft = "markdown", -- Load the plugin only for markdown files
  cmd = { "Mtoc" }, -- Expose the :Mtoc command
  opts = {
    auto_update = { enabled = true }, -- Automatically update the TOC on save
  },
}
