resource "aws_s3_bucket" "flood_data" {
  bucket = "flood-risk-mapping-data"
  force_destroy = true
}

resource "aws_s3_bucket" "athena_results" {
  bucket = "flood-risk-mapping-athena-results"
  force_destroy = true
}
