# normally, you would generate these items on the fly, e.g.
# reading them from some persistent storage

Alist <- list(
  messageItem("Support Team",
              "This is the content of a message.",
              time = "5 mins"
  ),
  messageItem("Support Team",
              "This is the content of another message.",
              time = "2 hours"
  ),
  messageItem("New User",
              "Can I get some help?",
              time = "Today"
  )
)

Blist <- list(
  notificationItem(icon = icon("users"), status = "info",
                   "5 new members joined today"
  ),
  notificationItem(icon = icon("warning"), status = "danger",
                   "Resource usage near limit."
  ),
  notificationItem(icon = icon("shopping-cart", lib = "glyphicon"),
                   status = "success", "25 sales made"
  ),
  notificationItem(icon = icon("user", lib = "glyphicon"),
                   status = "danger", "You changed your username"
  )
)

Clist <- list(
  taskItem(value = 20, color = "aqua",
           "Refactor code"
  ),
  taskItem(value = 40, color = "green",
           "Design new layout"
  ),
  taskItem(value = 60, color = "yellow",
           "Another task"
  ),
  taskItem(value = 80, color = "red",
           "Write documentation"
  )
)