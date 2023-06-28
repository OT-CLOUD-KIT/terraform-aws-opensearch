output "cluster_name" {
  description = "The name of the OpenSearch cluster."
  value       = module.aws_opensearch.cluster_name
}


output "kibana_endpoint" {
  description = "Domain-specific endpoint for kibana without https scheme."
  value       = module.aws_opensearch.kibana_endpoint
}

output "cluster_endpoint" {
  description = "Domain-specific endpoint used to submit index, search, and data upload requests."
  value       = module.aws_opensearch.cluster_endpoint
}