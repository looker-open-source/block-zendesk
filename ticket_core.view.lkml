include: "//@{CONFIG_PROJECT_NAME}/ticket.view.lkml"

view: ticket {
  extends: [ticket_config]
}

view: ticket_core {
  sql_table_name: @{SCHEMA_NAME}.ticket ;;

  ### Field descriptions source: https://developer.zendesk.com/rest_api/docs/support/tickets

  parameter: name_select {
    type: string
  }

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
    link: {
      label: "Zendesk Ticket Lookup"
      url: "/dashboards/block_zendesk::ticket_lookup?Ticket={{ value }}"
      icon_url: "http://www.looker.com/favicon.ico"
    }
  }

  dimension: id_direct_link {
    type: number
    sql: ${id} ;;
    hidden: no
    html: <a href="https://@{ZENDESK_INSTANCE_DOMAIN}.zendesk.com/agent/tickets/{{ value }}" target="_blank"><img src="http://www.google.com/s2/favicons?domain=www.zendesk.com" height=16 width=16> {{ value }}</a> ;;
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
    description: "Is false if channelback is disabled, true otherwise. Only applicable for channels framework ticket"
  }

  dimension: assignee_id {
    type: number
    sql: ${TABLE}.assignee_id ;;
    description: "The agent currently assigned to the ticket"
  }

  dimension: brand_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.brand_id ;;
    description: "Enterprise only. The ID of the brand a ticket is associated with"
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
      year,
      hour_of_day,
      day_of_week,
      month_name
    ]
    sql: ${TABLE}.created_at ;;
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
    description: "The first comment on a ticket"
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
    description: "An ID you can use to link Zendesk Support tickets to local records"
  }

  dimension: forum_topic_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.forum_topic_id ;;
    description: "The topic a ticket originated from, if any"
  }

  dimension: group_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.group_id ;;
    description: "The group a ticket is assigned to"
  }

  dimension: has_incidents {
    type: yesno
    sql: ${TABLE}.has_incidents ;;
    description: "Is true if a ticket has been marked as a problem, false otherwise"
  }

  dimension: is_public {
    type: yesno
    sql: ${TABLE}.is_public ;;
    description: "Is true if any comments are public, false otherwise"
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
    description: "The organization ID of the requester."
  }

  # dimension: priority is exposed in the config file and is formatted; priority_raw used in the priority_rank dimension
  dimension: priority_raw {
    type: string
    sql: ${TABLE}.priority ;;
    description: "The urgency with which the ticket should be addressed. Possible values: 'urgent', 'high', 'normal', 'low'"
  }

  dimension: priority_rank {
    type: string
    sql: case when ${priority_raw} = 'low' THEN 1
              when ${priority_raw} = 'normal' THEN 2
              when ${priority_raw} = 'high' THEN 3
              when ${priority_raw} = 'urgent' THEN 4
              else null end;;
    description: "Priority scale from 1 (Low) to 4 (Urgent)"
  }

  dimension: problem_id {
    type: number
    sql: ${TABLE}.problem_id ;;
    description: "For tickets of type 'incident', the ID of the problem the incident is linked to"
  }

  dimension: recipient {
    type: string
    sql: ${TABLE}.recipient ;;
    description: "The original recipient e-mail address of the ticket"
  }

  dimension: requester_id {
    type: number
    sql: ${TABLE}.requester_id ;;
    description: "The ID of the user who requested the ticket"
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
    description: "The state of the ticket. Possible values: 'new', 'open', pending, 'hold', 'solved', 'closed'"
  }

  dimension: subject {
    type: string
    sql: ${TABLE}.subject ;;
    description: "The value of the subject field for this ticket"
  }

  dimension: submitter_id {
    type: number
    sql: ${TABLE}.submitter_id ;;
    description: "The ID of the user who submitted the ticket. The submitter always becomes the author of the first comment on the ticket"
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
    description: "Enterprise only. The ID of the ticket form to render for the ticket"
  }

  dimension: ticket_link {
    hidden: no
    type: string
    sql: ${TABLE}.id ;;
    html: <img src="http://www.google.com/s2/favicons?domain=www.zendesk.com" height=16 width=16> {{ value }} ;;
    link: {
      label: "Zendesk Ticket"
      url: "https://@{ZENDESK_INSTANCE_DOMAIN}.zendesk.com/agent/tickets/{{ value }}"
      icon_url: "https://d1eipm3vz40hy0.cloudfront.net/images/logos/zendesk-favicon.ico"
    }
  }
  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
    description: "The type of ticket. Possible values: 'problem', 'incident', 'question' or 'task'"
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
    description: "The API URL of this ticket"
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
    sql: 1.00 * TIMESTAMP_DIFF(${ticket_history_fact.first_response_raw}, ${created_raw}, MINUTE) ;;
  }

  dimension: hours_to_first_response {
    type: number
    sql: 1.00 * TIMESTAMP_DIFF(${ticket_history_fact.first_response_raw}, ${created_raw}, HOUR) ;;
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
      field: ticket.is_solved
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

  set: ticket_detail {
    fields: [id, organization.name, created_date, status, days_since_updated, subject, via_channel, assignee.name, requester.name]
  }

  set: response_detail {
    fields: [id, organization.name, created_date, status, hours_to_first_response, days_since_updated, subject, via_channel, assignee.name, requester.name]
  }
}
