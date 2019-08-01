project_name: "block-zendesk"

constant: CONFIG_PROJECT_NAME {
  value: "block-zendesk-config"
}

constant: CONNECTION_NAME {
  value: "fivetran_looker_blocks_demo"
}

constant: SCHEMA_NAME {
  value: "zendesk"
}

# TODO: Insert the name of your zendesk instance below (i.e. if your zendesk instance url is mycompany.zendesk.com, insert "'mycompany'")
constant: ZENDESK_INSTANCE_DOMAIN {
  value: "insert here"
}

constant: LOOKER_INSTANCE_DOMAIN {
  value: "insert here"
}

local_dependency: {
  project: "@{CONFIG_PROJECT_NAME}"
}
