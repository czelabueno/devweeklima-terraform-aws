resource "aws_s3_bucket" "bucket" {
    count = "${var.count}"
    bucket = "devlimabucketexample"
    acl    = "private"

    versioning{
        enabled = true
    }

    tags = {
        Env = "Demo"
    }
  
}
