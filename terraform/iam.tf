resource "aws_iam_role" "organization_lambda_execution_role" {
  name = "OrganizationLambdaExecutionRole"
  path = "/external/"

  assume_role_policy = file("iam_json/lambda_assume_policy.json")

  tags = var.tags_mgmt
}

resource "aws_iam_policy" "organization_lambda_role_policy" {
  name   = "OrganizationLambdaExcutionPolicy"
  policy = file("iam_json/organization_lambda_execution_role_policy.json")
}

resource "aws_iam_policy_attachment" "attach_assume_policy_to_role_lambda" {
  name       = "attach_assume_policy_to_role_lambda"
  roles      = ["${aws_iam_role.organization_lambda_execution_role.name}"]
  policy_arn = aws_iam_policy.organization_lambda_role_policy.arn
}