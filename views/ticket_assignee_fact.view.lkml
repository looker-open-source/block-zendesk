# Quick facts about each ticket assignee/support agent
view: ticket_assignee_fact {
  view_label: "Assignee"
  derived_table: {
    sql: SELECT
        assignee_id
        , count(*) as lifetime_tickets
        , min(created_at) as first_ticket
        , max(created_at) as latest_ticket
        , 1.0 * COUNT(*) / NULLIF(DATE_DIFF(CURRENT_DATE, MIN(EXTRACT(date from created_at)), day), 0) AS avg_tickets_per_day
      FROM ${ticket.SQL_TABLE_NAME}
      GROUP BY 1
       ;;
  }

  dimension: assignee_id {
    primary_key: yes
    sql: ${TABLE}.assignee_id ;;
    hidden: yes
  }

  dimension: lifetime_tickets {
    type: number
    value_format_name: id
    sql: ${TABLE}.lifetime_tickets ;;
  }

  dimension_group: first_ticket {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.first_ticket ;;
  }

  dimension_group: latest_ticket {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.latest_ticket ;;
  }

  dimension: avg_tickets_per_day {
    type: number
    sql: ${TABLE}.avg_tickets_per_day ;;
  }

  measure: total_lifetime_tickets {
    type: sum
    sql: ${lifetime_tickets} ;;
    drill_fields: [detail*]
  }

  set: detail {
    fields: [assignee_id, lifetime_tickets, first_ticket_time, latest_ticket_time, avg_tickets_per_day]
  }
}
