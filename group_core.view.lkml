view: group_core {
  sql_table_name: @{SCHEMA_NAME}.`group` ;;

  ### Field descriptions source: https://developer.zendesk.com/rest_api/docs/support/groups

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
    description: "Automatically assigned when creating groups"
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
    description: "The time the group was created"
  }

  dimension: is_deleted {
    type: yesno
    sql: ${TABLE}.deleted ;;
    description: "Deleted groups get marked as such"
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
    description: "The name of the group"
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
    description: "The time of the last update of the group"
  }

  dimension: url {
    type: string
    sql: ${TABLE}.url ;;
    description: "The API url of this group"
  }

  measure: count {
    type: count
    drill_fields: [id, name, group_member.count, organization.count, ticket.count]
  }
}
