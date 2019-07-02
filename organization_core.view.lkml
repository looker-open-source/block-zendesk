view: organization_core {
  sql_table_name: @{SCHEMA_NAME}.organization ;;

  ### Field descriptions source: https://developer.zendesk.com/rest_api/docs/support/organizations

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
    description: "Organization ID. Automatically assigned when the organization is created"
  }


  dimension_group: created {
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
    sql: ${TABLE}.created_at ;;
    description: "The time the organization was created"
  }

  dimension: custom_account_type {
    type: string
    sql: ${TABLE}.custom_account_type ;;
  }

  dimension: custom_company {
    type: string
    sql: ${TABLE}.custom_company ;;
  }

  dimension: details {
    type: string
    sql: ${TABLE}.details ;;
    description: "Any details obout the organization, such as the address"
  }

  dimension: external_id {
    type: string
    sql: ${TABLE}.external_id ;;
    description: "A unique external ID to associate organizations to an external record"
  }

  dimension: group_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.group_id ;;
    description: "New tickets from users in an organization are automatically put in a group"
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
    description: "A unique name for the organization"
  }

  dimension: notes {
    type: string
    sql: ${TABLE}.notes ;;
    description: "Any notes you have about the organization"
  }

  dimension: shared_comments {
    type: yesno
    sql: ${TABLE}.shared_comments ;;
    description: "End users in this organization are able to see each other's comments on tickets"
  }

  dimension: shared_tickets {
    type: yesno
    sql: ${TABLE}.shared_tickets ;;
    description: "End users in this organization are able to see each other's tickets"
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
    description: "The time of the last update of the organization"
  }

  dimension: url {
    type: string
    sql: ${TABLE}.url ;;
    description: "The API URL of this organization"
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      name,
      group.name,
      group.id,
      organization_member.count,
      organization_tag.count,
      ticket.ticket_link,
      ticket.priority,
      ticket.status,
      user.count
    ]
  }
}
