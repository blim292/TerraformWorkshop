output "ec2_dns" {
  description = "List of Public DNS names assigned to the instances."
  value       = [aws_instance.treehouse_ec2.*.public_dns]
}

output "bucket_dns" {
  description = "The bucket domain name. Will be of format bucketname.s3.amazonaws.com."
  value       = aws_s3_bucket.treehouse_s3_asset.*.bucket_domain_name
}

output "dynamodb_id" {
  description = "The name of the table."
  value       = aws_dynamodb_table.treehouse_dynamodb.*.id
}
