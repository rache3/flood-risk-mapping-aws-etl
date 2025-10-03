resource "aws_glue_catalog_database" "flood_db" {
  name = "flood_risk_db"
}

# Upload ETL script to S3 (you'll place it locally and Terraform will push it up)
resource "aws_s3_object" "glue_etl_script" {
  bucket = aws_s3_bucket.flood_data.bucket
  key    = "scripts/flood_etl.py"
  source = "etl/flood_etl.py" # local path in your repo
  etag   = filemd5("etl/flood_etl.py")
}

# Glue Crawler to catalog processed data
resource "aws_glue_crawler" "flood_crawler" {
  name          = "flood-risk-crawler"
  role          = aws_iam_role.glue_role.arn
  database_name = aws_glue_catalog_database.flood_db.name

  s3_target {
    path = "s3://${aws_s3_bucket.flood_data.bucket}/processed/"
  }

  schedule = "cron(0 12 * * ? *)" # runs daily at 12:00 UTC
}

# Glue Job for ETL
resource "aws_glue_job" "flood_etl_job" {
  name     = "flood-risk-etl"
  role_arn = aws_iam_role.glue_role.arn

  command {
    name            = "glueetl"
    script_location = "s3://${aws_s3_bucket.flood_data.bucket}/scripts/flood_etl.py"
    python_version  = "3"
  }

  default_arguments = {
    "--TempDir" = "s3://${aws_s3_bucket.athena_results.bucket}/temp/"
    "--job-language" = "python"
  }

  max_retries    = 1
  glue_version   = "3.0"
  worker_type    = "Standard"
  number_of_workers = 2
}
