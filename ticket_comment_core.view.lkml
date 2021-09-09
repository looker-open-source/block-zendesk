include: "//@{CONFIG_PROJECT_NAME}/ticket_comment.view.lkml"

view: ticket_comment {
  extends: [ticket_comment_config]
}

view: ticket_comment_core {
  sql_table_name: @{SCHEMA_NAME}.ticket_comment ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: comment_author {
    type: string
    sql: CASE WHEN ${requester.id} = ${user_id} THEN 'Requester'
              WHEN ${assignee.id} = ${user_id} THEN 'Assignee'
              ELSE 'Other'
              END
    ;;
  }

  dimension: body {
    type: string
    sql: ${TABLE}.body ;;
  }

  dimension_group: created {
    type: time
    datatype: timestamp
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created ;;
  }

  dimension: facebook_comment {
    type: yesno
    sql: ${TABLE}.facebook_comment ;;
  }

  dimension: public {
    type: yesno
    sql: ${TABLE}.public ;;
  }

  dimension: ticket_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.ticket_id ;;
  }

  dimension: tweet {
    type: yesno
    sql: ${TABLE}.tweet ;;
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  dimension: voice_comment {
    type: yesno
    sql: ${TABLE}.voice_comment ;;
  }

  measure: count {
    type: count
    drill_fields: [id, user.id, user.custom_lead_or_contact_first_name, user.name, ticket.id]
  }
}
