include: "//@{CONFIG_PROJECT_NAME}/organization_member_config.view.lkml"

view: organization_member {
  extends: [organization_member_config]
}

view: organization_member_core {
  sql_table_name: @{SCHEMA_NAME}.organization_member ;;

  ### Field descriptions source: https://developer.zendesk.com/rest_api/docs/support/organization_memberships

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
    description: "Organization Member ID. Automatically assigned when the membership is created"
  }

  dimension: organization_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.organization_id ;;
    description: "The ID of the organization associated with this user, in this membership"
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
    description: "The ID of the user for whom this memberships belongs"
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      user.id,
      user.custom_lead_or_contact_first_name,
      user.name,
      organization.name,
      organization.id
    ]
  }
}
