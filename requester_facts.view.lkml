view: requester_facts {
  derived_table: {
    explore_source: ticket {
      column: id { field: requester.id }
      column: count_open_tickets {}
      column: count_solved_tickets {}
    }
  }
  dimension: id {
    type: number
    primary_key: yes
  }
  dimension: count_open_tickets {
    type: number
  }
  dimension: count_solved_tickets {
    type: number
  }

  measure: number_of_open_tickets {
    type: sum
    sql: ${TABLE}.count_open_tickets ;;
    value_format_name: decimal_0
  }

  measure: number_of_solved_tickets {
    type: sum
    sql: ${TABLE}.count_solved_tickets ;;
    value_format_name: decimal_0
  }
}
