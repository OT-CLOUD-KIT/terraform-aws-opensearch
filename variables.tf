# ACM data block
variable "acm_certificate_domain" {
  type        = string
  description = "(Required) Domain of ACM"
  default     = "www.mydevopsprojects.co.in"
}

variable "statuses" {
  type        = list(string)
  description = "(Required) Status of ACM"
  default     = ["ISSUED"]
}



variable "iam_aws_service_name" {
  type        = string
  description = "(Required) IAM aws service name"
  default     = "es.amazonaws.com"
}

# OpenSearch Variables
variable "name" {
  description = "(Required) Name of resources to be created"
  type        = string
  default     = "aws-opensearch"
}

variable "tags" {
  description = "Additional tags for the resource"
  type        = map(string)
  default = {
    "env"   = "testing"
    "owner" = "devops"
  }
}

variable "domain" {
  type        = string
  description = "The name of the OpenSearch Domain."
  default     = "www"
}

variable "elasticsearch_version" {
  type        = string
  description = "(Required) Version of OpenSearch"
  default     = "OpenSearch_2.5"
}

# cluster_config
variable "instance_count" {
  type        = number
  description = "(Optional) Number of instances in the cluster."
  default     = 2
}

variable "instance_type" {
  type        = string
  description = "(Optional) Instance type of data nodes in the cluster."
  default     = "c6g.large.elasticsearch"
}

variable "zone_awareness_enabled" {
  type        = bool
  description = "(Optional) Whether zone awareness is enabled, set to true for multi-az deployment."
  default     = true
}

variable "master_instance_count" {
  type        = number
  description = "Optional) Number of dedicated main nodes in the cluster."
  default     = 3
}

variable "master_instance_type" {
  type        = string
  description = "(Optional) Instance type of the dedicated main nodes in the cluster."
  default     = "c6g.large.elasticsearch"
}

variable "warm_instance_count" {
  type        = number
  description = "(Optional) Number of warm nodes in the cluster. Valid values are between 2 and 150."
  default     = 2
}

variable "warm_instance_type" {
  type        = string
  description = "(Optional) Instance type for the Elasticsearch cluster's warm nodes."
  default     = "c6g.large.elasticsearch"
}

variable "availability_zones" {
  description = "The number of availability zones for the OpenSearch cluster. Valid values: 1, 2 or 3."
  type        = number
  default     = 2
}

# ebs_options
variable "ebs_enabled" {
  type        = bool
  description = "(Required) Whether EBS volumes are attached to data nodes in the domain."
  default     = true
}

variable "volume_size" {
  type        = number
  description = "(Required if ebs_enabled is set to true.) Size of EBS volumes attached to data nodes (in GiB)."
  default     = 10
}

variable "volume_type" {
  type        = string
  description = "(Optional) Type of EBS volumes attached to data nodes."
  default     = "gp3"
}

variable "iops" {
  type        = number
  description = "(Optional) Baseline input/output (I/O) performance of EBS volumes attached to data nodes. Applicable only for the Provisioned IOPS EBS volume type."
  default     = 3000
}


# vpc_options
variable "vpc_options" {
  description = "(Optional) values would be subnet_ids and security_group_ids"
  type = list(object({
    subnet_ids         = list(string)
    security_group_ids = list(string)
  }))
  default = []
}

variable "automated_snapshot_start_hour" {
  type        = number
  description = "Hour at which automated snapshots are taken, in UTC"
  default     = 0
}

# Cognito Option
variable "cognito_options" {
  description = "(Optional) Whether to enable Amazon Cognito authentication with Kibana"
  type = list(object({
    enabled          = bool
    user_pool_id     = string
    identity_pool_id = string
    role_arn         = string
  }))
  default = []
}

# advanced_security_options
variable "advanced_security_options_enable" {
  type        = bool
  description = "(Required, Forces new resource) Whether advanced security is enabled."
  default     = false
}

variable "internal_user_database_enabled" {
  type        = bool
  description = "(Optional, Default: false) Whether the internal user database is enabled. If not set, defaults to false by the AWS API."
  default     = false
}

variable "master_user_options" {
  description = "(Optional) values would be username and password"
  type = list(object({
    master_user_name     = string
    master_user_password = string
  }))
  default = []
}

# domain_endpoint_options
variable "enforce_https" {
  type        = bool
  description = "(Optional) Whether or not to require HTTPS. Defaults to true."
  default     = true
}

variable "tls_security_policy" {
  type        = string
  description = "(Optional) Name of the TLS security policy that needs to be applied to the HTTPS endpoint. Valid values: Policy-Min-TLS-1-0-2019-07 and Policy-Min-TLS-1-2-2019-07. "
  default     = "Policy-Min-TLS-1-2-2019-07"
}


# node_to_node_encryption
variable "node_to_node_encryption" {
  type        = bool
  description = "(Required) Whether to enable node-to-node encryption. If the node_to_node_encryption block is not provided then this defaults to false."
  default     = true
}

# encrypt_at_rest
variable "encrypt_at_rest" {
  type        = bool
  description = "(Required) Whether to enable encryption at rest. If the encrypt_at_rest block is not provided then this defaults to false."
  default     = true
}
variable "custom_endpoint_enabled" {
  type  = bool
  description = "Do you want to enable custom endpoint"
  default     =  false
}
variable "route53_zone" {
  type        = string
  description = " Domain name of route53 zone"
  default = null
}

variable "custom_endpoint_certificate_arn" {
  type        = string
  description = "custom domain certificate arn  "
  default = null

}
