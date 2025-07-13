variable "environment" {
  type = string
  default = "dev"
}

variable "subscription_id" {
  type = map(any)
}

variable "resource_group_name" {
  type    = map(any)
}

variable "location" {
  type    = string
  default = "Canada Central"
}

variable "app_service_plan_name" {
  type    = map(any)
}

variable "web_app_name" {
  type    = map(any)
}