# Include all Views
include: "/views/*.view"

explore: agent {
  view_name: user
  sql_always_where: ${is_agent} IS TRUE ;;

  join: ticket_comment_response_times {
    type: left_outer
    relationship: one_to_many
    sql_on: ${user.id} = ${ticket_comment_response_times.responding_agent_id} ;;
  }
}
