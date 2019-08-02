connection: "@{CONNECTION_NAME}"

# include all the views
include: "*.view"
include: "*.dashboard"
include: "*.explore"

include: "//@{CONFIG_PROJECT_NAME}/*.view"
include: "//@{CONFIG_PROJECT_NAME}/*.model"

explore: agent {
  extends: [agent_config]
}

explore: ticket {
  extends: [ticket_config]
}
