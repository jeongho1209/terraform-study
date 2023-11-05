variable "instance_type" {
  type    = string
  default = "t3.small"
}

variable "key_name" {
  type    = string
  default = "Mechu"
}

variable "ami" {
  type    = string
  default = "ami-0c9c942bd7bf113a2"
}

variable "subnet_id" {
  type = string
}