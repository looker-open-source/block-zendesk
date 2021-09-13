view: organization_tag {
  sql_table_name: @{SCHEMA_NAME}.organization_tag ;;

  dimension: organization_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.organization_id ;;
  }

  dimension: tag {
    type: string
    sql: ${TABLE}.tag ;;
  }

  measure: count {
    type: count
    drill_fields: [organization.name, organization.id]
  }
}
