include: "//@{CONFIG_PROJECT_NAME}/user_config.view.lkml"

view: user {
  extends: [user_config]
}

view: user_core {
  sql_table_name: @{SCHEMA_NAME}.user ;;

  ### Field descriptions source: https://developer.zendesk.com/rest_api/docs/support/users

  # Comparitor Logic
  filter: name_select {
    type: string
  }

  dimension: name_vs_everyone {
    type: string
    sql:  CASE WHEN ${name} = {% parameter name_select %} THEN ${name}
               ELSE 'Everyone Else'
               END;;
  }

  dimension: output_name_select {
    type: string
    sql: {% parameter name_select %} ;;
  }

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
    description: "User ID. Automatically assigned upon creation"
  }

  dimension: active {
    type: yesno
    sql: ${TABLE}.active ;;
    description: "False if user has been deleted"
  }

  dimension: alias {
    type: string
    sql: ${TABLE}.alias ;;
    description: "An alias displayed to end users"
  }

  dimension: authenticity_token {
    type: string
    sql: ${TABLE}.authenticity_token ;;
  }

  dimension: chat_only {
    type: yesno
    sql: ${TABLE}.chat_only ;;
    description: "Whether or not the user is a chat-only agent"
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
    description: "The time the user was created"
  }

  dimension: custom_lead_or_contact_first_name {
    type: string
    sql: ${TABLE}.custom_lead_or_contact_first_name ;;
  }

  dimension: custom_role_id {
    type: number
    sql: ${TABLE}.custom_role_id ;;
  }

  dimension: details {
    type: string
    sql: ${TABLE}.details ;;
    description: "Any details stored about a user"
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
    description: "The user's primary email address. *Writeable on create only. On update, a secondary email is added."
  }

  dimension: external_id {
    type: string
    sql: ${TABLE}.external_id ;;
    description: "A unique identifier from another system. The API treats the id as case insensitive. Example: ian1 and Ian1 are the same user"
  }

  dimension_group: last_login {
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
    sql: ${TABLE}.last_login_at ;;
    description: "The last time the user signed in to Zendesk Support"
  }

  dimension: locale {
    type: string
    sql: ${TABLE}.locale ;;
    description: "The user's locale. A BCP-47 compliant tag for the locale. "
  }

  dimension: locale_id {
    type: number
    sql: ${TABLE}.locale_id ;;
    description: "The user's language identifier"
  }

  dimension: moderator {
    type: yesno
    sql: ${TABLE}.moderator ;;
    description: "Designates whether the user has forum moderation capabilities"
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
    description: "The user's name"
  }

  dimension: notes {
    type: string
    sql: ${TABLE}.notes ;;
    description: "Any notes stored about the user"
  }

  dimension: only_private_comments {
    type: yesno
    sql: ${TABLE}.only_private_comments ;;
    description: "True if the user can only create private comments"
  }

  dimension: organization_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.organization_id ;;
    description: "The ID of the user's organization. If the user has more than one organization memberships, the ID of the user's default organization"
  }

  dimension: phone {
    type: string
    sql: ${TABLE}.phone ;;
    description: "The user's primary phone number."
  }

  dimension: remote_photo_url {
    type: string
    sql: ${TABLE}.remote_photo_url ;;
  }

  dimension: restricted_agent {
    type: yesno
    sql: ${TABLE}.restricted_agent ;;
    description: "If the agent has any restrictions; false for admins and unrestricted agents, true for other agents"
  }

  dimension: role {
    type: string
    sql: ${TABLE}.role ;;
    description: "The user's role. Possible values are 'end-user', 'agent', or 'admin'"
  }

  dimension: shared {
    type: yesno
    sql: ${TABLE}.shared ;;
    description: "If the user is shared from a different Zendesk Support instance."
  }

  dimension: shared_agent {
    type: yesno
    sql: ${TABLE}.shared_agent ;;
    description: "If the user is a shared agent from a different Zendesk Support instance."
  }

  dimension: signature {
    type: string
    sql: ${TABLE}.signature ;;
    description: "The user's signature. Only agents and admins can have signatures"
  }

  dimension: suspended {
    type: yesno
    sql: ${TABLE}.suspended ;;
    description: "If the agent is suspended."
  }

  dimension: ticket_restriction {
    type: string
    sql: ${TABLE}.ticket_restriction ;;
    description: "Specifies which tickets the user has access to. Possible values are: 'organization', 'groups', 'assigned', 'requested', null"
  }

  dimension: time_zone {
    type: string
    sql: ${TABLE}.time_zone ;;
    description: "The user's time zone."
  }

  dimension: two_factor_auth_enabled {
    type: yesno
    sql: ${TABLE}.two_factor_auth_enabled ;;
    description: "If two factor authentication is enabled."
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
    description: "The time the user was last updated"
  }

  dimension: url {
    type: string
    sql: ${TABLE}.url ;;
    description: "The user's API url"
  }

  dimension: verified {
    type: yesno
    sql: ${TABLE}.verified ;;
    description: "False if the user's primary identity is not verified."
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      custom_lead_or_contact_first_name,
      name,
      organization.name,
      organization.id,
      group_member.count,
      organization_member.count,
      ticket_comment.count,
      ticket_field_history.count,
      ticket_tag_history.count
    ]
  }
}
