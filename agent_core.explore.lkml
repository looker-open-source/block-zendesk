explore: agent_core {
  view_name: user
  sql_always_where: ${is_agent} IS TRUE ;;
  extension: required

  join: ticket_comment_response_times {
    type: left_outer
    relationship: one_to_many
    sql_on: ${user.id} = ${ticket_comment_response_times.responding_agent_id} ;;
  }
}