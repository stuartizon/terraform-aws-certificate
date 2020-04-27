variable "domain_name" {
  type        = string
  description = "The main domain name for the certificate e.g. www.example.com"
}

variable "subject_alternative_names" {
  type        = list(string)
  description = "A list of alternate domains to include in the certificate"
  default     = []
}

variable "ttl" {
  type        = number
  description = "The TTL for the Route 53 validation records e.g. 60 seconds"
  default     = 60
}

variable "zone_id" {
  type        = string
  description = "The ID of the Route 53 hosted zone corresponding to the top level domain name"
}
