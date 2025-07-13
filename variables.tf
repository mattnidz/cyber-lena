variable "resource_group_name" {
  type    = string
  default = "my-app-rg"
}

variable "location" {
  type    = string
  default = "East US"
}

variable "app_service_plan_name" {
  type    = string
  default = "my-app-plan"
}

variable "web_app_name" {
  type    = string
  default = "my-nodejs-webapp-123"
}