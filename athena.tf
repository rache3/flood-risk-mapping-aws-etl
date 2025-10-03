resource "aws_athena_workgroup" "flood_wg" {
  name = "flood-risk-workgroup"

  configuration {
    result_configuration {
      output_location = "s3://${aws_s3_bucket.athena_results.bucket}/"
    }
  }
}
