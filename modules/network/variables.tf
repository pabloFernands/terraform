variable "cidr_block" {
  type        = string
  description = "Network block CIDR for use on the VPC"

}

variable "project_name" {
  type        = string
  description = "Project name to tag resources"
}

variable "tags" {
  type        = map(any)
  description = "Tag to put on the aws resources"
}