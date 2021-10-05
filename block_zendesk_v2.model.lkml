connection: "@{CONNECTION_NAME}"

# Include all dashboards
include: "/dashboards/*.dashboard"
# Include all Explores
include: "/explores/*.explore"

datagroup: block_zendesk_v2_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "2 hour"
}