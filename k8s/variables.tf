variable "ami" {
  type        = string
  description = "The ami"
}

variable "instance_type" {
  type        = string
  description = "The instance type"
}

variable "key_name" {
  type        = string
  description = "value"
}

variable "tag_name" {
  type        = string
  description = "value"
}

variable "public_key" {
  type        = string
  description = "value"
}

variable "core_count" {
  type = number
}
