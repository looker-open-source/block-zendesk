project_name: "block-zendesk"

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

# TODO: Insert the name of your zendesk instance below (i.e. if your zendesk instance url is mycompany.zendesk.com, insert "'mycompany'")
constant: ZENDESK_INSTANCE_DOMAIN {
  value: "insert here"
  export: override_required
}

constant: LOOKER_INSTANCE_DOMAIN {
  value: "insert here"
  export: override_required
}

local_dependency: {
  project: "@{CONFIG_PROJECT_NAME}"
}
