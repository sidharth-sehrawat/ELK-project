Jenkins Configuration

This directory contains Jenkins-related configuration and documentation used by the ELK-Project DevSecOps platform.

Purpose

The goal is to make Jenkins reproducible and easier to rebuild in case the cluster or Jenkins instance is lost.

Contents
plugins.txt

List of Jenkins plugins required by the platform.

pod-template.yaml

Kubernetes agent pod template used by Jenkins.

cloud-config.md

Kubernetes cloud configuration details.

credentials.md

Documentation of Jenkins credentials and their purpose.

No secrets are stored in this repository.

sonar-config.md

SonarQube integration settings.

pipeline-design.md

High-level CI/CD pipeline architecture.

Rebuild Strategy

A new Jenkins instance should be able to recreate the required configuration using the documentation contained in this directory.

Future enhancement:

Jenkins Configuration as Code (JCasC)
Helm-based Jenkins deployment
ArgoCD-managed Jenkins installation
