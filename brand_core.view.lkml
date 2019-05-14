view: brand_core {
  sql_table_name: @{SCHEMA_NAME}.brand ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: active {
    type: yesno
    sql: ${TABLE}.active ;;
  }

  dimension: brand_url {
    type: string
    sql: ${TABLE}.brand_url ;;
  }

  dimension: default {
    type: yesno
    sql: ${TABLE}.``default`` ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: subdomain {
    type: string
    sql: ${TABLE}.subdomain ;;
  }

  dimension: url {
    type: string
    sql: ${TABLE}.url ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name, ticket.count]
  }
}
