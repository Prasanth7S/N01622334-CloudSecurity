resource "aws_iam_role" "prasanth_role" {
  name = "prasanth-role"
  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [{
      "Effect" : "Allow",
      "Principal" : {
        "Service" : "ec2.amazonaws.com"
      },
      "Action" : "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_policy" "prasanth_policy" {
  name        = "prasanth-policy"
  description = "Inline policy for the IAM role"

  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [{
      "Effect" : "Allow",
      "Action" : ["s3:ListBucket"],
      "Resource" : ["arn:aws:s3:::prasanth-bucket"]
    }]
  })
}

resource "aws_iam_role_policy_attachment" "policy-role_attachment" {
  role       = aws_iam_role.prasanth_role.name
  policy_arn = aws_iam_policy.prasanth_policy.arn
}

# Use the IAM role to create an S3 bucket
resource "aws_s3_bucket" "prasanth_bucket" {
  bucket = "prasanthnew-bucket"

  tags = {
    Name = "Cloud security sample Bucket"
  }

}

resource "aws_iam_role_policy_attachment" "remove_policy-role_attachment" {
  role       = aws_iam_role.prasanth_role.name
  policy_arn = aws_iam_policy.prasanth_policy.arn
  count      = 0
}

resource "null_resource" "detach_policies" {
  triggers = {
    role_name = aws_iam_role.prasanth_role.name
  }

  provisioner "local-exec" {
    command     = "aws iam list-attached-role-policies --role-name ${aws_iam_role.prasanth_role.name} --query 'AttachedPolicies[].PolicyArn' --output text | xargs -I {} aws iam detach-role-policy --role-name ${aws_iam_role.prasanth_role.name} --policy-arn {}"
    interpreter = ["bash", "-c"]
  }
}

resource "null_resource" "remove_prasanth_role" {
  depends_on = [null_resource.detach_policies]

  triggers = {
    role_name = aws_iam_role.prasanth_role.name
  }

  provisioner "local-exec" {
    command     = "aws iam delete-role --role-name ${aws_iam_role.prasanth_role.name}"
    interpreter = ["bash", "-c"]
  }
}