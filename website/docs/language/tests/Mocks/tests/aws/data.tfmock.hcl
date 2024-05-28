mock_resource "aws_s3_bucket" {
  defaults = {
    arn = "arn:aws:s3:::name"
  }
}
mock_data "aws_s3_bucket" {
  defaults = {
    arn = "arn:aws:s3:::name"
  }
}