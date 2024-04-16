Welcome to the Hivemind DevOps Challenge repository! Here you will find everything from setting up infrastructure with Terraform, writing manifests for kubernetes to deployment workflow with github actions. 

Kindly follow the below instructions:
### terraform-eks
It includes various files to create 3 main components as below: 
Virtual Private Cloud (VPC) -> across 3 availability zones 
Elastic Container Service (EKS) -> 2 to 6 nodes cluster
Amazon Elastic Container Registry (ECR) -> To store docker images

Modules are used to avoid writing resources.

### kubernetes
It includes k8s manifests for application deployment and service. 
Deployment -> Rolling update(default strategy) for app deployment
service -> Load balancer service, generate alb url to access it from outside world.

### workflows
we have 2 workflows in place:
 terraform.yml
 deploy.yml

Please first run terraform.yml to create infrastructure.
Use deploy.yml workflow to deploy app on EKS.

Once app is deployed one should be able to access via ALB url such as:a1c05c130144b4639a8e8c8cf2244377-1958473415.eu-central-1.elb.amazonaws.com
