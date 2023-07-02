locals {
  subnet_ids     = var.subnet_ids
  vpc_id         = var.vpc_id
  vpc_cidr_range = var.vpc_cidr_range
}

module "opensearch_security_group" {
  source                              = "OT-CLOUD-KIT/security-groups/aws"
  version                             = "1.0.0"
  name_sg                             = "opensearch-sg"
  tags                                = var.tags
  enable_whitelist_ip                 = true
  enable_source_security_group_entry  = false
  create_outbound_rule_with_src_sg_id = false

  vpc_id = local.vpc_id
  ingress_rule = {
    rules = {
      rule_list = [
        {
          description  = "opening port 80 for vpc  cidr"
          from_port    = 80
          to_port      = 80
          protocol     = "tcp"
          cidr         = [local.vpc_cidr_range]
          source_SG_ID = []
        },
        {
          description  = "opening port 443 for vpc cidr"
          from_port    = 443
          to_port      = 443
          protocol     = "tcp"
          cidr         = [local.vpc_cidr_range]
          source_SG_ID = []
        }

      ]
    }
  }
}
module "aws_opensearch" {
  source = "../"
  vpc_options = [{
    subnet_ids         = local.subnet_ids
    security_group_ids = [module.opensearch_security_group.sg_id]
  }]
  name                   = var.name
  tags                   = var.tags
  domain                 = var.domain
  elasticsearch_version  = var.elasticsearch_version
  availability_zones     = var.availability_zones
  instance_count         = var.instance_count
  instance_type          = var.instance_type
  zone_awareness_enabled = true
  master_instance_count  = var.master_instance_count
  master_instance_type   = var.master_instance_type
  warm_instance_count    = var.warm_instance_count
  warm_instance_type     = var.warm_instance_type
  ebs_enabled            = true
  volume_size            = var.volume_size
  volume_type = var.volume_type
  iops        = 3000

  automated_snapshot_start_hour    = 0
  enforce_https                    = true
  tls_security_policy              = "Policy-Min-TLS-1-2-2019-07"
  node_to_node_encryption          = true
  encrypt_at_rest                  = true
  advanced_security_options_enable = true
  internal_user_database_enabled   = true
  master_user_options = [{
    master_user_name     = "admin"
    master_user_password = "pUTQkenu@Y5Pn"
  }]
}
