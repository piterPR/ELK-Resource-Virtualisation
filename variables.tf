variable "elk_instance_type" {
  default = "m5.large"
}

variable "aws_public_key_path" {}

variable "aws_key_name" {}

variable "elasticsearch_data_dir" {
  default = "/opt/elasticsearch/data"
}

variable "elasticsearch_cluster" {
  description = "Name of the elasticsearch cluster"
  default     = "elk_cluster"
}

