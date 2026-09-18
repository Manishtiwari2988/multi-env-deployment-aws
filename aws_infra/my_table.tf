
# My Dynamo DB Template

resource "aws_dynamodb_table" "name" {
  name         = "${var.my_env}-application-table"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "id"
  attribute {
    name = "id"
    type = "S"
  }
}