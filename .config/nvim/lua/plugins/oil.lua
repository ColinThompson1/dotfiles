return {
  {
    "stevearc/oil.nvim",
    opts = {
      prompt_save_on_select_new_entry = true,
    },
    -- dependencies = { { "echasnovski/mini.icons", opts = {} } },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      {
        "-",
        "<CMD>Oil<CR>",
        desc = "Open parent directory",
      },
    },
    lazy = false,
  },
}
