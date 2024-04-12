resource "aws_iam_role_policy_attachment" "batch-job-creation" {
  role       = local.role_name
  policy_arn = aws_iam_policy.batch-job-creation.arn
}

resource "aws_iam_policy" "batch-job-creation" {
  name        = local.resource_name
  policy      = data.aws_iam_policy_document.batch-job-creation.json
  description = "Policy to enable the management and creation of batch jobs"
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
