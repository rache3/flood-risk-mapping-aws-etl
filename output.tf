output "s3_data_bucket" {
  value = aws_s3_bucket.flood_data.bucket
}

output "athena_results_bucket" {
  value = aws_s3_bucket.athena_results.bucket
}

output "glue_database" {
  value = aws_glue_catalog_database.flood_db.name
}

output "athena_workgroup" {
  value = aws_athena_workgroup.flood_wg.name
}
