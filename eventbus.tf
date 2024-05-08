data "ns_connection" "eventbus" {
  name     = "eventbus"
  contract = "datastore/aws/eventbus:eventbridge"
}

locals {
  eventbus_arn         = data.ns_connection.eventbus.outputs.eventbus_arn
  eventbus_name        = data.ns_connection.eventbus.outputs.eventbus_name
  scheduler_group_name = data.ns_connection.eventbus.outputs.scheduler_group_name
  scheduler_role_arn   = data.ns_connection.eventbus.outputs.scheduler_role_arn
  scheduler_role_name  = data.ns_connection.eventbus.outputs.scheduler_role_name
}
