resource "aws_s3_bucket" "bucket-source" {
  bucket = "ventas-source-${random_string.bucket-limon.id}"
  versioning {
    enabled = true
  }
}

resource "aws_s3_bucket" "bucket-destiny" {
  bucket   = "ventas-destiny-${random_string.bucket-limon.id}"
  provider = aws.central
  versioning {
    enabled = true
  }
}

# The buckets must be deployed beforehand in AWS for the replication rule to work

resource "aws_s3_bucket_replication_configuration" "replication" {
  role   = aws_iam_role.replication.arn
  bucket = aws_s3_bucket.bucket-source.id
  rule {
    id       = "tf-iam-role-policy-replication-12345"
    priority = 1
    status   = "Enabled"
    destination {
      bucket        = "arn:aws:s3:::bucket-destiny-hxvo" # arn del bucket ya desplegado
      storage_class = "STANDARD"
    }
  }
}

