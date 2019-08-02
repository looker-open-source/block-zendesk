include: "//@{CONFIG_PROJECT_NAME}/organization_tag_config.view.lkml"

view: organization_tag {
  extends: [organization_tag_config]
}

view: organization_tag_core {
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
