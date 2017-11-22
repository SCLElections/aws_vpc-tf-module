variable "allocated-cidr" {
  description = "Allocated cidr block for the specific vpc"
}

variable "production" {
  description = "If using a development enviroment and a production one this is used to split the cidr block into two"
  default     = false
}

variable "split" {
  description = "This will split your vpc cidr into two."
  default     = false
}

variable "newbits" {
  description = ""
  default     = 8
}

variable "tags" {
  description = "AWS resource tags following company recomended"
  type        = "map"
}

variable "availability-zones" {
  description = "Availability zone for the subnets"
  type        = "list"
  default     = ["a", "b", "c"]
}

variable "region" {
  description = "AWS Region for the vpc"
  default     = "us-east-1"
}
