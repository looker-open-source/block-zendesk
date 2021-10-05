# Calculates the "Closed Date" for each ticket (i.e. date diff between when status was last changed to "closed" and ticket created date)
view: ticket_close_dates {
  derived_table: {
    explore_source: ticket {
      filters: {field: ticket_field_history.field_name value: "status"}
      filters: {field: ticket_field_history.value value: "closed"}
      column: ticket_id {field: ticket.id}
      column: created {field: ticket.created_raw}
      column: close {field: ticket_field_history.max_updated_time}
    }
  }

  dimension: ticket_id {
    type: number
    sql: ${TABLE}.ticket_id ;;
    primary_key: yes
  }

  dimension_group: created {
    type: time
  }

  dimension_group: close {
    type: time
  }

  dimension_group: timeline_close {
    type: time
    sql: coalesce(${TABLE}.close,CURRENT_TIMESTAMP()) ;;
  }

  dimension_group: to_resolution {
    type: duration
    sql_start: ${created_raw} ;;
    sql_end: ${close_raw};;
  }

  # In Hours
#   dimension: time_to_resolution {
#     hidden: yes
#     type: number
#   }

  dimension: time_to_resolution_formatted {
    label: "Time To Resolution"
    type: string
    sql:  CONCAT(
          CONCAT(CAST(FLOOR(${hours_to_resolution}/7/24) AS STRING), " Weeks "),
          CONCAT(CAST(FLOOR(MOD(${hours_to_resolution},7*24)/24) AS STRING), " Days "),
          CONCAT(CAST(MOD(MOD(${hours_to_resolution},7*24),24) AS STRING), " Hours"));;
  }

  measure: median_time_to_resolution {
    type: median
    description: "In Hours"
    sql: ${hours_to_resolution} ;;
    value_format_name: decimal_0
  }
}
