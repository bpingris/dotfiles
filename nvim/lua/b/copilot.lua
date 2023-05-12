return {
  "zbirenbaum/copilot.lua",
  event = "InsertEnter",
  config = function()
    require('copilot').setup(
      {
        suggestion = {
          enabled = true,
          auto_trigger = false,
          debounce = 75,
          keymap = {
            accept = "<C-l>",
            accept_word = false,
            accept_line = false,
            next = "<M-]>",
            prev = "<M-[>",
            dismiss = "<C-]>",
          },
        },
      }
    )
  end
}
