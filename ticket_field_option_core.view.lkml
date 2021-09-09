include: "//@{CONFIG_PROJECT_NAME}/ticket_field_option.view.lkml"

view: ticket_field_option {
  extends: [ticket_field_option_config]
}

view: ticket_field_option_core {
  sql_table_name: @{SCHEMA_NAME}.ticket_field_option ;;

  dimension: default {
    type: yesno
    sql: ${TABLE}.``default`` ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: value {
    type: string
    sql: ${TABLE}.value ;;
  }

  measure: count {
    type: count
    drill_fields: [name]
  }
}