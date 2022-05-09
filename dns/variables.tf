variable "resource_group_name" {
  default = "TAGS-RG"
}

variable "location" {
  default = "australiacentral"
}

variable "global_tags" {
  type = map
  default = {
    Author = "Aaron"
    Environment = "Testing"
    Comment = "Testing tags"
  }
}