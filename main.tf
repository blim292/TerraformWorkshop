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
  # ...
  name              = "budget_treehouse"
  budget_type       = "COST"
  limit_amount      = "1000"
  limit_unit        = "USD"
  time_period_start = "2021-04-04_12:00"
  time_unit         = "MONTHLY"
}

resource "aws_instance" "development_treehouse_ec2" {
  count = 1 # note that count is a terraform definition that creates n #'s of resources of config specified.
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.public_key_ssh
  vpc_security_group_ids = [var.security_preset]

  tags = {
    Name = "Development Server${count.index+1}"
  }
}

resource "aws_instance" "staging_treehouse_ec2" {
  count = 2
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.public_key_ssh
  vpc_security_group_ids = [var.security_preset]

  tags = {
    Name = "Staging Server${count.index+1}"
  }
}

resource "aws_instance" "production_treehouse_ec2" {
  count = 4
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.public_key_ssh
  vpc_security_group_ids = [var.security_preset]

  tags = {
    Name = "Production Server${count.index+1}"
  }
}

# create S3 resources
# development bucket
resource "aws_s3_bucket" "development_treehouse_s3_asset" {
  bucket = "development-treehouse-s3-assets"
  acl    = "private"

  tags = {
    Environment = "development"
  }
}

# staging bucket
resource "aws_s3_bucket" "staging_treehouse_s3_asset" {
  bucket = "staging-treehouse-s3-assets"
  acl    = "private"

  tags = {
    Environment = "staging"
  }
}

# production bucket
resource "aws_s3_bucket" "production_treehouse_s3_asset" {
  bucket = "production-treehouse-s3-assets"
  acl    = "private"

  tags = {
    Environment = "production"
  }
}

# create DynamoDB table
resource "aws_dynamodb_table" "development_treehouse_dynamodb" {
  name           = "treehousedb_development"
  billing_mode   = "PROVISIONED"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "RoomID"
  range_key      = "RoomTopicTitle"

  attribute {
    name = "RoomID"
    type = "N"
  }

  attribute {
    name = "RoomTopicTitle"
    type = "S"
  }
  
  tags = {
    Environment = "production"
  }
}

resource "aws_dynamodb_table" "staging_treehouse_dynamodb" {
  name           = "treehousedb_staging"
  billing_mode   = "PROVISIONED"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "RoomID"
  range_key      = "RoomTopicTitle"

  attribute {
    name = "RoomID"
    type = "N"
  }

  attribute {
    name = "RoomTopicTitle"
    type = "S"
  }
  
  tags = {
    Environment = "production"
  }
}

resource "aws_dynamodb_table" "production_treehouse_dynamodb" {
  name           = "treehousedb_production"
  billing_mode   = "PROVISIONED"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "RoomID"
  range_key      = "RoomTopicTitle"

  attribute {
    name = "RoomID"
    type = "N"
  }

  attribute {
    name = "RoomTopicTitle"
    type = "S"
  }
  
  tags = {
    Environment = "production"
  }
}