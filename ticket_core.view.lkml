view: ticket_core {
  sql_table_name: @{SCHEMA_NAME}.ticket ;;

  parameter: name_select {
    type: string
  }

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: id_direct_link {
    type: number
    sql: ${id} ;;
    html: <a href="https://{{ ticket._ZENDESK_INSTANCE_DOMAIN._value }}.zendesk.com/agent/tickets/{{ value }}" target="_blank"><img src="http://www.google.com/s2/favicons?domain=www.zendesk.com" height=16 width=16> {{ value }}</a> ;;
    hidden: yes
  }

  dimension: dash_title {
    hidden: yes
    type: string
    sql: 'foo' ;;
    html: <font color="#000000" size="8"><center>Leaderboards</center></font> ;;
  }

  dimension: allow_channelback {
    type: yesno
    sql: ${TABLE}.allow_channelback ;;
  }

  dimension: assignee_id {
    type: number
    sql: ${TABLE}.assignee_id ;;
  }

  dimension: brand_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.brand_id ;;
  }

  dimension_group: created {
    type: time
    datatype: datetime
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year,
      hour_of_day,
      day_of_week,
      month_name
    ]
    sql: TIMESTAMP(DATETIME_ADD(DATETIME(${TABLE}.created_at), INTERVAL 810 DAY)) ;;
  }

  dimension: custom_github_issue {
    type: string
    sql: ${TABLE}.custom_github_issue ;;
  }

  dimension: custom_relevant_integration {
    type: string
    sql: ${TABLE}.custom_relevant_integration ;;
  }

  dimension: custom_ticket_type {
    type: string
    sql: ${TABLE}.custom_ticket_type ;;
  }

  dimension: days_since_updated {
    type: number
    sql: 1.00 * DATE_DIFF(CURRENT_DATE(), ${last_updated_date}, DAY)  ;;
    html: {% if value > 60 %}
            <div style="color: white; background-color: darkred; font-size:100%; text-align:center">{{ rendered_value }}</div>
          {% else %}
            <div style="color: black; background-color: yellow; font-size:100%; text-align:center">{{ rendered_value }}</div>
          {% endif %}
      ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension_group: due {
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
    sql: ${TABLE}.due_at ;;
  }

  dimension: external_id {
    type: string
    sql: ${TABLE}.external_id ;;
  }

  dimension: forum_topic_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.forum_topic_id ;;
  }

  dimension: group_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.group_id ;;
  }

  dimension: has_incidents {
    type: yesno
    sql: ${TABLE}.has_incidents ;;
  }

  dimension: is_public {
    type: yesno
    sql: ${TABLE}.is_public ;;
  }

  dimension: is_responded_to {
    type: yesno
    sql: ${minutes_to_first_response} is not null ;;
  }

  dimension_group: last_updated {
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
    sql: ${TABLE}.updated_at ;;
  }

  dimension_group: open {
    description: "Ticket Age"
    type: duration
    sql_end: CURRENT_TIMESTAMP ;;
    sql_start: ${created_raw} ;;
  }

  dimension: organization_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.organization_id ;;
  }

  # dimension: priority is exposed in the config file and is formatted; priority_raw used in the priority_rank dimension
  dimension: priority_raw {
    type: string
    sql: ${TABLE}.priority ;;
  }

  dimension: priority_rank {
    type: string
    sql: case when ${priority_raw} = 'low' THEN 1
              when ${priority_raw} = 'normal' THEN 2
              when ${priority_raw} = 'high' THEN 3
              when ${priority_raw} = 'urgent' THEN 4
              else null end;;
  }

  dimension: problem_id {
    type: number
    sql: ${TABLE}.problem_id ;;
  }

  dimension: recipient {
    type: string
    sql: ${TABLE}.recipient ;;
  }

  dimension: requester_id {
    type: number
    sql: ${TABLE}.requester_id ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: subject {
    type: string
    sql: ${TABLE}.subject ;;
  }

  dimension: submitter_id {
    type: number
    sql: ${TABLE}.submitter_id ;;
  }

  dimension: ticket_age_days_tier {
    description: "Tiered ticket age in days"
    type: tier
    tiers: [0, 30, 60, 90]
    style: integer
    sql: ${days_open} ;;
  }

  dimension: ticket_form_id {
    type: number
    sql: ${TABLE}.ticket_form_id ;;
  }

  dimension: ticket_link {
    type: number
    sql: ${TABLE}.id ;;
    html: <img src="http://www.google.com/s2/favicons?domain=www.zendesk.com" height=16 width=16> {{ value }} ;;
    link: {
      label: "Zendesk Ticket"
      url: "https://{{ ticket.@{ZENDESK_INSTANCE_DOMAIN}._value }}.zendesk.com/agent/tickets/{{ value }}"
      icon_url: "https://d1eipm3vz40hy0.cloudfront.net/images/logos/zendesk-favicon.ico"
    }
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension_group: updated {
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
    sql: ${TABLE}.updated_at ;;
  }

  dimension: url {
    type: string
    sql: ${TABLE}.url ;;
  }

  dimension: via_channel {
    type: string
    sql: ${TABLE}.via_channel ;;
  }

  dimension: via_source_from_id {
    type: number
    sql: ${TABLE}.via_source_from_id ;;
  }

  dimension: via_source_from_title {
    type: string
    sql: ${TABLE}.via_source_from_title ;;
  }

  dimension: via_source_rel {
    type: string
    sql: ${TABLE}.via_source_rel ;;
  }

  #### TIME TO X fields ####

  dimension: days_to_solve {
    type: number
    sql: 1.00 * DATE_DIFF(${ticket_history_fact.solved_date}, ${created_date}, DAY) ;;
  }

  dimension: days_to_first_response {
    type: number
    sql: 1.00 * DATE_DIFF(${ticket_history_fact.first_response_date}, ${created_date}, DAY) ;;
  }

  dimension: minutes_to_first_response {
    type: number
    sql: 1.00 * DATETIME_DIFF(EXTRACT(DATETIME FROM ${ticket_history_fact.first_response_raw}), EXTRACT(DATETIME FROM ${created_raw}), MINUTE) ;;
  }

  dimension: hours_to_first_response {
    type: number
    sql: 1.00 * DATETIME_DIFF(EXTRACT(DATETIME FROM ${ticket_history_fact.first_response_raw}), EXTRACT(DATETIME FROM ${created_raw}), HOUR) ;;
  }

  dimension: hours_to_solve {
    type: number
    sql: 1.00 * DATETIME_DIFF(${ticket_history_fact.solved_raw}, ${created_raw}, HOUR) ;;
  }

  ##############################

  #### Status Flags ####

  dimension: is_hold {
    type: yesno
    sql: ${status} = 'hold'   ;;
  }

  dimension: is_pending {
    type: yesno
    sql: ${status} = 'pending' ;;
  }

  dimension: is_new {
    type: yesno
    sql: ${status} = 'new' ;;
  }

  dimension: is_open {
    type: yesno
    sql: ${status} = 'open' ;;
  }

  dimension: is_deleted {
    type: yesno
    sql: ${status} = 'deleted' ;;
  }

    #####################

  measure: count {
    label: "Count Tickets"
    type: count
  }

  measure: count_pending_tickets {
    type: count
    label: "Pending"
    filters: {
      field: is_pending
      value: "Yes"
    }
  }

  measure: count_new_tickets {
    type: count

    filters: {
      field: is_new
      value: "Yes"
    }
  }

  measure: count_tickets_on_hold {
    type: count
    label: "Hold"
    filters: {
      field: is_new
      value: "Yes"
    }
  }

  measure: count_open_tickets {
    type: count
    label: "Open"
    filters: {
      field: is_open
      value: "Yes"
    }
  }

  measure: count_solved_tickets {
    type: count
    label: "Solved"
    filters: {
      field: is_solved
      value: "Yes"
    }
  }

  measure: prio_rank {
    type: max
    sql: ${priority_rank} ;;
  }

  measure: avg_days_to_solve {
    type: average
    sql: ${days_to_solve} ;;
    value_format_name: decimal_2
  }

  measure: my_avg_days_to_solve {
    type: average
    sql: CASE WHEN ${assignee.name} = {% parameter name_select %} THEN ${days_to_solve}
      ELSE NULL END ;;
    value_format_name: decimal_2
  }

  measure: avg_hours_to_first_response {
    type: average
    sql: ${hours_to_first_response} ;;
    value_format_name: decimal_2
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      forum_topic.name,
      forum_topic.id,
      brand.name,
      brand.id,
      group.name,
      group.id,
      organization.name,
      organization.id,
      ticket_comment.count,
      ticket_field_history.count,
      ticket_tag.count,
      ticket_tag_history.count
    ]
  }
}
