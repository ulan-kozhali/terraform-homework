resource "aws_iam_user" "bp" {
  name = "Jenny"
}
resource "aws_iam_user" "bp2" {
  name = "Rose"
}
resource "aws_iam_user" "bp3" {
  name = "Lisa"
}
resource "aws_iam_user" "bp4" {
  name = "Jisoo"
}
resource "aws_iam_user" "bp5" {
  name = "Miyeon"
}
resource "aws_iam_group" "bp-gr" {
  name = "Blackpink"
}
resource "aws_iam_group_membership" "team" {
  name = "blackpink"

  users = [
    aws_iam_user.bp.name,
    aws_iam_user.bp2.name,
    aws_iam_user.bp3.name,
    aws_iam_user.bp4.name,
    aws_iam_user.bp5.name
  ]

  group = aws_iam_group.bp-gr.name
}
