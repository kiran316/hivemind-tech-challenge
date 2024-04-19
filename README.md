# Hivemind DevOps Challenge

Welcome to the Hivemind DevOps Challenge repository! This repository contains everything you need to set up infrastructure with Terraform, deploy applications on Kubernetes, and implement CI/CD workflows using GitHub Actions.

## Table of Contents
- [Infrastructure](#infrastructure)
- [Orchestration](#orchestration)
- [CI/CD](#cicd)
- [Accessing the Deployed Application](#accessing-the-deployed-application)

## Infrastructure
### terraform-eks
The infrastructure in AWS is created using Terraform, comprising:
- Virtual Private Cloud (VPC) across 3 availability zones.
- Elastic Container Service (EKS) with a cluster size ranging from 2 to 6 nodes.
- Amazon Elastic Container Registry (ECR) to store Docker images.

## Orchestration
### kubernetes
This section includes Kubernetes manifests for application deployment and service.
- Deployment: Implements a rolling update strategy for application deployment.
- Service: Sets up a LoadBalancer service to generate an ALB URL for external access.

## CI/CD
### Workflows
Two GitHub Actions workflows are in place:
- `terraform.yml`: Creates infrastructure using Terraform.
- `deploy.yml`: Deploys the application on EKS.

Please run `terraform.yml` first to create the infrastructure, followed by `deploy.yml` to deploy the app on EKS.

## Accessing the Deployed Application
Once the app is deployed, you can access it via the ALB URL:
http://af47430888c6f4108973661f5f15402f-1713964486.eu-central-1.elb.amazonaws.com/

### Example Requests and Responses:
- Accessing with a name parameter:
  - Request: http://af47430888c6f4108973661f5f15402f-1713964486.eu-central-1.elb.amazonaws.com/?name=alice
  - Response: Hello, Alice! I'm go-app-67556dc898-kzcpn
- Accessing without a name parameter:
  - Request: http://af47430888c6f4108973661f5f15402f-1713964486.eu-central-1.elb.amazonaws.com/?name
  - Response: Hello, Guest! I'm go-app-67556dc898-kzcpn

