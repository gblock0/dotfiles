keymap = require("nutils").map

require("gitsigns").setup(
  {
    watch_index = {
      interval = 100
    }
  }
)

require("git-worktree").setup {}

keymap("n", "<leader>gs", ":vertical Git<CR>", {silent = true})
keymap("n", "<leader>gh", ":diffget //2<CR>", {silent = true})
keymap("n", "<leader>gl", ":diffget //3<CR>", {silent = true})
keymap("n", "<leader>gb", ":Git blame<CR>", {silent = true})
