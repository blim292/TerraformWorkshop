variable "ami_id" {
  type        = string
  default     = ""
  description = "This is the ID of the AMI for the region we specified."
}

variable "instance_type" {
  type        = string
  default     = ""
  description = "Type of instance to start. In this case, we are using the free for now. Determines the size and class of our instance."
}

variable "public_key_ssh" {
  type        = string
  default     = ""
  description = "the public key created from the pem file to ssh into server"
}

variable "security_preset" {
  type        = string
  default     = ""
  description = "preset security group with port 80, and ssh open"
}

