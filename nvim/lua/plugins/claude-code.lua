local toggle_key = "<C-c>"

local function claude_sessions()
  vim.cmd("ClaudeCodeFocus")

  vim.defer_fn(function()
    vim.api.nvim_chan_send(vim.b.terminal_job_id, "/resume\r")
  end, 500)
end

return {
  "coder/claudecode.nvim",
  dependencies = { "folke/snacks.nvim" },
  config = true,
  -- `cmd` lets lazy.nvim create command stubs that load the plugin on first use,
  -- so `:ClaudeCode` and friends work on a fresh start. Without it, a keys-only
  -- spec defers loading until a <leader>a* mapping is pressed and the commands
  -- would not exist yet.
  cmd = {
    "ClaudeCode",
    "ClaudeCodeFocus",
    "ClaudeCodeSelectModel",
    "ClaudeCodeAdd",
    "ClaudeCodeSend",
    "ClaudeCodeTreeAdd",
    "ClaudeCodeStatus",
    "ClaudeCodeStart",
    "ClaudeCodeStop",
    "ClaudeCodeOpen",
    "ClaudeCodeClose",
    "ClaudeCodeDiffAccept",
    "ClaudeCodeDiffDeny",
    "ClaudeCodeCloseAllDiffs",
  },
  keys = {
    { toggle_key, "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
    { toggle_key, "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send to Claude" },
    { "<C-s>", claude_sessions, mode = "n", desc = "Claude Code sessions" },
    -- Diff management
    { "<C-a>", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
    { "<C-d>", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny diff" },
  },
  opts = {
    terminal = {
      ---@module "snacks"
      ---@type snacks.win.Config|{}
      snacks_win_opts = {
        position = "float",
        width = 0.9,
        height = 0.9,
        title = "Claude Code",
        border = "rounded",
        keys = {
          claude_hide = {
            toggle_key,
            function(self)
              self:hide()
            end,
            mode = "t",
            desc = "Hide",
          },
        },
        wo = {
          winhighlight = "FloatBorder:ClaudeBorder",
          winbar = "",
          number = false,
          relativenumber = false,
          signcolumn = "no",
        },
      },
    },
  },
}
