resource "aws_iam_user" "tw" {
  name = "Jihya"
}
resource "aws_iam_user" "tw2" {
  name = "Sana"
}
resource "aws_iam_user" "tw3" {
  name = "Momo"
}
resource "aws_iam_user" "tw4" {
  name = "Dahyun"
}
resource "aws_iam_user" "tw5" {
  name = "Mina"
}
resource "aws_iam_group" "tw-gr" {
  name = "twice"
}
resource "aws_iam_group_membership" "team1" {
  name = "twice"

  users = [
    aws_iam_user.tw.name,
    aws_iam_user.tw2.name,
    aws_iam_user.tw3.name,
    aws_iam_user.tw4.name,
    aws_iam_user.tw5.name,
  ]

  group = aws_iam_group.tw-gr.name
}