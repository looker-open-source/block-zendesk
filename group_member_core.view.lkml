view: group_member_core {
  sql_table_name: @{SCHEMA_NAME}.group_member ;;

  ### Field descriptions source: https://developer.zendesk.com/rest_api/docs/support/group_memberships

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
    description: "Group member ID. Automatically assigned upon creation"
  }

  dimension: group_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.group_id ;;
    description: "The id of a group"
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
    description: "The id of an agent"
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      group.name,
      group.id,
      user.id,
      user.custom_lead_or_contact_first_name,
      user.name
    ]
  }
}
