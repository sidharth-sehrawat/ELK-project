# ELK-Project

End-to-end DevSecOps platform on GKE.

## Components

- Terraform
- GKE
- Jenkins
- SonarQube
- Gitleaks
- Trivy
- Kaniko
- Artifact Registry
- Kubernetes
- Prometheus
- Grafana
- Elasticsearch
- Kibana
- Fluent Bit

## Pipeline Flow

GitHub
→ Jenkins
→ Gitleaks
→ SonarQube
→ Trivy
→ Kaniko Build
→ Artifact Registry
→ Kubernetes Deployment

## Monitoring

Prometheus + Grafana

## Logging

Fluent Bit → Elasticsearch → Kibana

## Infrastructure

Terraform (GCP)
