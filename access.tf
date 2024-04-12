resource "aws_iam_role_policy_attachment" "scheduler-policy" {
  role       = var.app_metadata["role_name"]
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSBatchServiceEventTargetRole"
}

resource "aws_iam_role_policy_attachment" "assume-scheduler" {
  role       = var.app_metadata["role_name"]
  policy_arn = aws_iam_policy.assume-scheduler.arn
}

resource "aws_iam_policy" "assume-scheduler" {
  name        = local.resource_name
  description = "Policy to enable the creation of schedules for batch jobs"
  policy      = data.aws_iam_policy_document.assume-scheduler.json
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
