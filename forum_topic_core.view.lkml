include: "//@{CONFIG_PROJECT_NAME}/forum_topic_config.view.lkml"

view: forum_topic {
  extends: [forum_topic_config]
}


view: forum_topic_core {
  sql_table_name: @{SCHEMA_NAME}.forum_topic ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name, ticket.count]
  }
}
