project_name: "block-zendesk"

################ Constants ################

constant: CONFIG_PROJECT_NAME {
  value: "block-zendesk-config"
  export: override_required
}

constant: CONNECTION_NAME {
  value: "fivetran_looker_blocks_demo"
  export: override_required
}

constant: SCHEMA_NAME {
  value: "zendesk"
  export: override_required
}

constant: ZENDESK_INSTANCE_DOMAIN {
  value: "insert here"
  export: override_required
}

################ Dependencies ################

local_dependency: {
  project: "@{CONFIG_PROJECT_NAME}"

    override_constant: SCHEMA_NAME {
      value: "@{SCHEMA_NAME}"
    }

    override_constant: ZENDESK_INSTANCE_DOMAIN {
      value: "@{ZENDESK_INSTANCE_DOMAIN}"
    }
}
