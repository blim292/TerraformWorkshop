terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.35.0"
    }
  }
}

provider "aws" {
  # Configuration options (note: not specified b/c using default credential information)
  region = "us-east-2"
}

resource "aws_budgets_budget" "cost_treehouse" {
  name              = "${var.environment}_budget_treehouse"
  budget_type       = "COST"
  limit_amount      = "1000"
  limit_unit        = "USD"
  time_period_start = "2021-04-04_12:00"
  time_unit         = "MONTHLY"
}

resource "aws_instance" "treehouse_ec2" {
  count                  = var.num_instances # note that count is a terraform definition that creates n #'s of resources of config specified.
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.public_key_ssh
  vpc_security_group_ids = [var.security_preset]

  tags = {
    Name = "${var.environment}${count.index + 1}"
  }
}

# create S3 resource
resource "aws_s3_bucket" "treehouse_s3_asset" {
  bucket = "${var.environment}-treehouse-s3-assets"
  acl    = "private"

  tags = {
    Environment = var.environment
  }
}

# create DynamoDB table
resource "aws_dynamodb_table" "treehouse_dynamodb" {
  name           = "${var.environment}_treehousedb"
  billing_mode   = "PROVISIONED"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = var.hash_key_name
  range_key      = var.range_key_name

  attribute {
    name = var.hash_key_name
    type = "N"
  }

  attribute {
    name = var.range_key_name
    type = "S"
  }

  tags = {
    Environment = var.environment
  }
}