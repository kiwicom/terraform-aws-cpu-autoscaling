variable "resources_prefix" {
  type = string
}

variable "asg_name" {
  type = string
}

variable "up_threshold" {
  type    = number
  default = 75
}

variable "down_threshold" {
  type    = number
  default = 55
}

variable "up_eval_periods" {
  type    = number
  default = 4
}

variable "up_period" {
  type    = number
  default = 60
}

variable "down_eval_periods" {
  type    = number
  default = 4
}

variable "down_period" {
  type    = number
  default = 60
}

variable "up_adjustment" {
  type    = number
  default = 1
}

variable "down_adjustment" {
  type    = number
  default = -1
}
