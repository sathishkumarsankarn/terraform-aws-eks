variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "vpc_dns_support" {
  type    = bool
  default = true
}

variable "vpc_dns_host" {
  type    = bool
  default = true
}