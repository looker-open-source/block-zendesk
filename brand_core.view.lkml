view: brand_core {
  sql_table_name: @{SCHEMA_NAME}.brand ;;

  ### Field Definition Source: https://developer.zendesk.com/rest_api/docs/support/brands

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
    description: "Automatically assigned when the brand is created"
  }

  dimension: is_active {
    type: yesno
    sql: ${TABLE}.active ;;
    description: "If the brand is set as active"
  }

  dimension: brand_url {
    type: string
    sql: ${TABLE}.brand_url ;;
    description: "The url of the brand"
  }

  dimension: is_default {
    type: yesno
    sql: ${TABLE}.``default`` ;;
    description: "Is the brand the default brand for this account"
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
    description: "The name of the brand"
  }

  dimension: subdomain {
    type: string
    sql: ${TABLE}.subdomain ;;
    description: "The subdomain of the brand"
  }

  dimension: url {
    type: string
    sql: ${TABLE}.url ;;
    description: "The API url of this brand"
  }

  measure: count {
    type: count
    drill_fields: [id, name, ticket.count]
  }
}
