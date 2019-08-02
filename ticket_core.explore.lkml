explore: ticket_core {
  persist_for: "3 hours"
  sql_always_where: ${is_deleted} IS FALSE;;
  extension: required

  join: ticket_comment {
    type: left_outer
    sql_on: ${ticket.id} = ${ticket_comment.ticket_id} ;;
    relationship: one_to_many
  }

  join: ticket_field_history {
    type: left_outer
    sql_on: ${ticket.id} = ${ticket_field_history.ticket_id} ;;
    relationship: one_to_many
  }

  join: ticket_tag {
    type: left_outer
    sql_on: ${ticket.id} = ${ticket_tag.ticket_id} ;;
    relationship: many_to_many
  }

  join: ticket_tag_history {
    type: left_outer
    sql_on: ${ticket.id} = ${ticket_tag.ticket_id} ;;
    relationship: many_to_many
  }

  join: ticket_close_dates {
    type: left_outer
    sql_on: ${ticket.id} = ${ticket_close_dates.ticket_id} ;;
    relationship: one_to_one
  }

  join: assignee {
    from: user
    relationship: many_to_one
    sql_on: ${ticket.assignee_id} = ${assignee.id} ;;
  }

  join: ticket_assignee_fact {
    type: left_outer
    sql_on: ${ticket.assignee_id} = ${ticket_assignee_fact.assignee_id} ;;
    relationship: many_to_one
  }

  join: requester {
    from: user
    relationship: many_to_one
    sql_on: ${ticket.requester_id} = ${requester.id} ;;
  }

  join: requester_facts {
    sql_on:  ${requester.id} = ${requester_facts.id} ;;
    relationship: one_to_one
  }

  join: requester_previous_tickets {
    from: ticket
    type: left_outer
    sql_on: ${ticket.requester_id} = ${requester_previous_tickets.requester_id} AND
          ${ticket.id} != ${requester_previous_tickets.id} AND
          ${ticket.created_date} < ${requester_previous_tickets.created_date};;
    relationship: one_to_many
  }

  join: ticket_commenter {
    from: user
    relationship: many_to_one
    sql_on: ${ticket_commenter.id} = ${ticket_comment.user_id} ;;
  }

  join: ticket_comment_response_times {
    relationship: one_to_many
    sql_on: ${ticket_commenter.id} = ${ticket_comment_response_times.responding_agent_id} ;;
  }

  join: ticket_history_fact {
    relationship: one_to_one
    sql_on: ${ticket_history_fact.ticket_id} = ${ticket.id} ;;
  }

  join: organization {
    type: left_outer
    sql_on: ${ticket.organization_id} = ${organization.id} ;;
    relationship: many_to_one
  }

  join: organization_member {
    type: left_outer
    sql_on: ${organization.id} = ${organization_member.organization_id} ;;
    relationship: one_to_many
  }

  join: organization_tag {
    type: left_outer
    sql_on: ${organization.id} = ${organization_tag.organization_id} ;;
    relationship: one_to_many
  }

  join: forum_topic {
    type: left_outer
    sql_on: ${ticket.forum_topic_id} = ${forum_topic.id} ;;
    relationship: many_to_one
  }

  join: brand {
    type: left_outer
    sql_on: ${ticket.brand_id} = ${brand.id} ;;
    relationship: many_to_one
  }

  join: group {
    type: left_outer
    sql_on: ${ticket.group_id} = ${group.id} ;;
    relationship: many_to_one
  }
}
