return {
  "f-person/git-blame.nvim",
  event = "VeryLazy",
  opts = {
    enabled = true,
    message_template = " <summary> • <date> • <author> <<sha>>",
    date_format = "%d-%m-%Y %H:%M:%S",
    virtual_text_column = 1,
  },
}

