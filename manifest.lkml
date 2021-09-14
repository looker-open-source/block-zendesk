project_name: "block-zendesk"

################ Constants ################

constant: CONNECTION_NAME {
  value: "fivetran_looker_blocks_demo"
  export: override_optional
}

constant: SCHEMA_NAME {
  value: "zendesk"
  export: override_optional
}

constant: ZENDESK_INSTANCE_DOMAIN {
  value: "insert here"
  export: override_optional
}
