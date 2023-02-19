-- TODO comments/highlight
return {
  'folke/todo-comments.nvim',
  opts = {
    keywords = {
      TODOPRIO1 = { icon = "☐ ", color = "error" },
      TODOPRIO2 = { icon = "☐ ", color = "warning" },
      TODO = { icon = "☐ ", color = "info" },
      ACTV = { icon = "☐ ", color = "#f08080" },
      WAITING = { icon = "∞ ", color = "gray" },
      WAIT = { icon = "∞ ", color = "gray" },
      MOVED = { icon = "→ ", color = "#999999" },
      MVED = { icon = "→ ", color = "#999999" },
      DONE = {  icon = "✓ ", color = "green" },
    },
    colors = {
      gray = { "#cccccc" },
      green = { "#37c88b" },
    },
    highlight = {
      keyword = "bg",
      pattern = { [[.*<(KEYWORDS)\s*:]], [[\*\s<(KEYWORDS)\s]] }, -- pattern or table of patterns, used for highlightng (vim regex)  
      comments_only = false,
    }
  }
}

