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

data "aws_iam_role" "scheduler_role" {
  name = local.scheduler_role_name
}

resource "aws_iam_role_policy_attachment" "batch-job-creation" {
  role       = data.aws_iam_role.scheduler_role.name
  policy_arn = aws_iam_policy.batch-job-creation.arn
}

resource "aws_iam_policy" "batch-job-creation" {
  name   = local.resource_name
  policy = data.aws_iam_policy_document.batch-job-creation.json
}

data "aws_iam_policy_document" "batch-job-creation" {
  statement {
    effect = "Allow"
    actions = [
      "batch:SubmitJob",
      "batch:DescribeJobs",
      "batch:TerminateJob",
      "batch:ListJobs",
      "batch:ListJobDefinitions",
      "batch:DescribeJobDefinitions",
      "batch:DescribeJobQueues",
      "batch:ListJobQueues",
    ]
    resources = ["*"]
  }
}
