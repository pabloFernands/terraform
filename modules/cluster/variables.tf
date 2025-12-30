variable "project_name" {
  type        = string
  description = "Project name to tag resources"
}

variable "tags" {
  type        = map(any)
  description = "Tag to put on the aws resources"
}

variable "subnet_pub_1a" {
  type        = string
  description = "Public Subnet in availability zone 1a"
}

variable "subnet_pub_1b" {
  type        = string
  description = "Public Subnet in availability zone 1b"
}