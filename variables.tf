variable "num_instances" {
  type        = number
  default     = 1
  description = "The number of instances to be provisioned."
}

variable "ami_id" {
  type        = string
  default     = "ami-05d72852800cbf29e"
  description = "This is the ID of the AMI for the region we specified."
}

variable "instance_type" {
  type        = string
  default     = "t2.micro"
  description = "Type of instance to start. In this case, we are using the free for now. Determines the size and class of our instance."
}

variable "public_key_ssh" {
  type        = string
  default     = "aws-blim292.script"
  description = "the public key created from the pem file to ssh into server"
}

variable "security_preset" {
  type        = string
  default     = "sg-024999aab64fbb043"
  description = "preset security group with port 80, and ssh open"
}

variable "environment" {
  type        = string
  default     = ""
  description = "Name of the environment"
}

variable "hash_key_name" {
  type        = string
  default     = "RoomID"
}

variable "range_key_name" {
  type        = string
  default     = "RoomTopicTitle"
}


