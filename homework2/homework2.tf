resource "aws_key_pair" "bastion" {
  key_name   = "bastion-key"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_s3_bucket" "bucket" {
  bucket = "kaizen-ulan"
  force_destroy = true
}

resource "aws_s3_bucket" "prefix" {
  bucket_prefix = "kaizen-"
  force_destroy = true
}

resource "aws_s3_bucket" "devops" {
  bucket = "kaizen-devops"
  force_destroy = true
}

resource "aws_s3_bucket" "kaizen-peterson" {
    bucket = "kaizen-peterson"
    force_destroy = true
}

resource "aws_iam_user" "singers" {
  for_each = toset(["Jenny", "Rose", "Lisa", "Jisoo"])  
  name = each.value
}
resource "aws_iam_group" "blackpink" {
  name = "blackpink"
}
resource "aws_iam_group_membership" "team" {
  name = "tf-testing-group-membership"

  users = [
    for i in aws_iam_user.singers : i.name
  ]

  group = aws_iam_group.blackpink.name
}
