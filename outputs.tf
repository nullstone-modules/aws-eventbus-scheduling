output "env" {
  value = [
    {
      name  = "EVENTBUS_ARN"
      value = local.eventbus_arn
    },
    {
      name  = "EVENTBUS_NAME"
      value = local.eventbus_name
    },
    {
      name  = "EVENTBUS_SCHEDULER_GROUP_NAME"
      value = local.scheduler_group_name
    },
    {
      name  = "EVENTBUS_SCHEDULER_ROLE_ARN"
      value = local.scheduler_role_arn
    }
  ]
}
