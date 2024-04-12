resource "aws_iam_role_policy_attachment" "batch-job-creation" {
  role       = local.role_name
  policy_arn = aws_iam_policy.batch-job-creation.arn
}

resource "aws_iam_policy" "batch-job-creation" {
  name        = "${local.resource_name}-batch-job-creation"
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

resource "aws_iam_role_policy_attachment" "assume-scheduler" {
  role       = var.app_metadata["role_name"]
  policy_arn = aws_iam_policy.assume-scheduler.arn
}

resource "aws_iam_policy" "assume-scheduler" {
  name        = "${local.resource_name}-assume-scheduler"
  policy      = data.aws_iam_policy_document.assume-scheduler.json
  description = "Policy to allow assuming the scheduler and events roles"
}

data "aws_iam_policy_document" "assume-scheduler" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["scheduler.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }

  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["events.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}
