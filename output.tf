output "cluster_name" {
  description = "The name of the OpenSearch cluster."
  value       = aws_elasticsearch_domain.es.domain_name
}

output "cluster_version" {
  description = "The version of the OpenSearch cluster."
  value       = replace(aws_elasticsearch_domain.es.elasticsearch_version, "OpenSearch_", "")
}

output "kibana_endpoint" {
  description = "Domain-specific endpoint for kibana without https scheme."
  value       = aws_elasticsearch_domain.es.kibana_endpoint
}

output "cluster_endpoint" {
  description = "Domain-specific endpoint used to submit index, search, and data upload requests."
  value       = aws_elasticsearch_domain.es.endpoint
}