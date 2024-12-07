return {
    {
      "neoclide/coc.nvim", branch = "release",
      config = function()
        vim.g.coc_global_extensions = {
          "coc-rust-analyzer"
        }
      end
    }
    -- coc-tsserver, coc-prettier, coc-eslint
  }
