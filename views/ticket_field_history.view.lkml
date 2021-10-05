view: ticket_field_history {
  sql_table_name: @{SCHEMA_NAME}.ticket_field_history ;;

  dimension: field_name {
    type: string
    sql: ${TABLE}.field_name ;;
  }

  dimension: ticket_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.ticket_id ;;
  }

  dimension_group: updated {
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
    sql: ${TABLE}.updated ;;
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  dimension: value {
    type: string
    sql: ${TABLE}.value ;;
  }

  measure: count {
    type: count
    drill_fields: [field_name, user.id, user.custom_lead_or_contact_first_name, user.name, ticket.id]
  }

  measure: max_updated_time {
    type: date
    sql: MAX(${updated_raw}) ;;
    convert_tz: no
  }
}
