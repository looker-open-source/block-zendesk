include: "//@{CONFIG_PROJECT_NAME}/ticket_history_fact.view.lkml"

# Quick facts about each ticket
view: ticket_history_fact {
  extends: [ticket_history_fact_config]
  }

view: ticket_history_fact_core {
  view_label: "Ticket"
  derived_table: {
    sql: SELECT
          tfh.ticket_id
          ,IFNULL(tc.created, MAX(case when field_name = 'status' and value = 'solved' then updated else null end)) as first_response
          ,MAX(case when field_name = 'status' then updated else null end) AS last_updated_status
          ,MAX(case when field_name = 'assignee_id' then updated else null end) AS last_updated_by_assignee
          ,MAX(case when field_name = 'requester_id' then updated else null end) AS last_updated_by_requester
          ,MAX(case when field_name = 'status' and value = 'solved' then updated else null end) AS solved
          ,MAX(updated) AS updated
          ,MIN(case when field_name = 'assignee_id' then updated else null end) AS initially_assigned
          ,SUM(case when field_name = 'assignee_id' then 1 else 0 end) as number_of_assignee_changes
          ,count(distinct case when field_name = 'assignee_id' then value else null end) as number_of_distinct_assignees
          ,count(distinct case when field_name = 'group_id' then value else null end) as number_of_distinct_groups

      FROM zendesk.ticket_field_history as tfh
      LEFT JOIN (
          SELECT ticket_id, created, row_number() over (partition by ticket_id order by created asc) as comment_sequence
          FROM zendesk.ticket_comment
      ) tc on tc.ticket_id = tfh.ticket_id and tc.comment_sequence = 2
      GROUP BY tfh.ticket_id, tc.created ;;
  }

  dimension_group: first_response {
    type: time
    datatype: datetime
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: DATETIME(${TABLE}.first_response) ;;
  }

  dimension: ticket_id {
    type: number
    sql: ${TABLE}.ticket_id ;;
    hidden: yes
    primary_key: yes
  }

  dimension_group: last_updated_status {
    type: time
    datatype: datetime
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: DATETIME(${TABLE}.last_updated_status) ;;
  }

  dimension_group: updated {
    type: time
    datatype: datetime
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: DATETIME(${TABLE}.updated);;
    hidden: yes
    # why is this not = to the field on ticket on some occasions? should be redundant.
  }

  dimension_group: last_updated_by_assignee {
    type: time
    datatype: datetime
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: DATETIME(${TABLE}.last_updated_by_assignee);;
  }

  dimension_group: last_updated_by_requester {
    type: time
    datatype: datetime
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: DATETIME(${TABLE}.last_updated_by_assignee) ;;
  }

  dimension_group: solved {
    type: time
    datatype: datetime
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql:DATETIME(${TABLE}.solved) ;;
  }

  dimension_group: initially_assigned {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.initially_assigned ;;
  }

  dimension: number_of_assignee_changes {
    type: number
    sql: ${TABLE}.number_of_assignee_changes ;;
    description: "Number of times the assignee changed for a ticket (including initial assignemnt)"
  }

  dimension: number_of_distinct_assignees {
    type: number
    sql: ${TABLE}.number_of_distinct_assignees ;;
    description: "Number of distinct assignees for a ticket"
  }

  dimension: number_of_distinct_groups {
    type: number
    sql: ${TABLE}.number_of_distinct_groups ;;
    description: "Number of distinct groups for a ticket"
  }

  measure: total_number_of_distinct_assignees {
    group_label: "Distinct Assignees"
    type: sum
    sql: ${number_of_distinct_assignees} ;;
  }

  measure: average_number_of_distinct_assignees {
    group_label: "Distinct Assignees"
    type: average
    sql: ${number_of_distinct_assignees} ;;
    value_format_name: decimal_2
  }

  measure: median_number_of_distinct_assignees {
    group_label: "Distinct Assignees"
    type: median
    sql: ${number_of_distinct_assignees} ;;
  }

  measure: total_number_of_assignee_changes {
    group_label: "Assignee Changes"
    type: sum
    sql: ${number_of_assignee_changes} ;;
  }

  measure: avg_number_of_assignee_changes {
    group_label: "Assignee Changes"
    type: average
    sql: ${number_of_assignee_changes} ;;
    value_format_name: decimal_2
  }

  measure: median_number_of_assignee_changes {
    group_label: "Assignee Changes"
    type: median
    sql: ${number_of_assignee_changes} ;;
  }

  measure: total_number_of_distinct_groups {
    group_label: "Distinct Groups"
    type: sum
    sql: ${number_of_distinct_groups} ;;
  }

  measure: avg_number_of_distinct_groups {
    group_label: "Distinct Groups"
    type: average
    sql: ${number_of_distinct_groups} ;;
    value_format_name: decimal_2
  }

  measure: median_number_of_distinct_groups {
    group_label: "Distinct Groups"
    type: median
    sql: ${number_of_distinct_groups} ;;
  }
}
