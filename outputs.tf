output "development_dns" {
  description = "List of Public DNS names assigned to the instances."
  value = [aws_instance.development_treehouse_ec2.*.public_dns]
}
output "staging_dns" {
  description = "List of Public DNS names assigned to the instances."
  value = [aws_instance.staging_treehouse_ec2.*.public_dns]
}
output "production_dns" {
  description = "List of Public DNS names assigned to the instances."
  value = [aws_instance.production_treehouse_ec2.*.public_dns]
}
output "development_bucket_dns" {
  description = "The bucket domain name. Will be of format bucketname.s3.amazonaws.com."
  value       = aws_s3_bucket.development_treehouse_s3_asset.*.bucket_domain_name
}
output "staging_bucket_dns" {
  description = "The bucket domain name. Will be of format bucketname.s3.amazonaws.com."
  value       = aws_s3_bucket.staging_treehouse_s3_asset.*.bucket_domain_name
}
output "production_bucket_dns" {
  description = "The bucket domain name. Will be of format bucketname.s3.amazonaws.com."
  value       = aws_s3_bucket.production_treehouse_s3_asset.*.bucket_domain_name
}
output "development_dynamodb_id" {
  description = "The name of the table."
  value       = aws_dynamodb_table.development_treehouse_dynamodb.*.id
}
output "staging_dynamodb_id" {
  description = "The name of the table."
  value       = aws_dynamodb_table.staging_treehouse_dynamodb.*.id
}
output "production_dynamodb_id" {
  description = "The name of the table."
  value       = aws_dynamodb_table.production_treehouse_dynamodb.*.id
}