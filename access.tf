resource "aws_iam_role_policy_attachment" "batch-job-creation" {
  role       = local.role_name
  policy_arn = "arn:aws:iam::aws:policy/AWSBatchFullAccess"
}

resource "aws_iam_role_policy_attachment" "scheduler-admin" {
  role       = local.role_name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEventBridgeSchedulerFullAccess"
}
