Project Overview

This project demonstrates the implementation of a complete DevOps lifecycle for a product-based organization using modern DevOps tools and practices.

The application was containerized using Docker, automated using Jenkins CI/CD Pipeline, deployed on a Kubernetes cluster with scaling support, and infrastructure provisioning was automated using Terraform on AWS Cloud.

The goal of this project was to migrate from a monolithic architecture to a scalable and automated deployment architecture without changing the existing application container.

Technologies Used
AWS EC2
Terraform
Ansible
Docker
Docker Hub
Jenkins
Kubernetes (K8s)
Git & GitHub
Linux
Project Architecture
Infrastructure Provisioning

Infrastructure was provisioned on AWS using Terraform.

Created:

Jenkins Server
Kubernetes Master Node
Kubernetes Worker Node(s)
Security Groups
Networking configurations
Configuration Management

Ansible was used to automate software installation and server configuration.

Installed Softwares
Jenkins Server
Jenkins
Java
Docker
Kubernetes Master & Worker
Docker
Kubernetes Components
kubeadm
kubelet
kubectl
CI/CD Workflow
Git Workflow
Source code managed using GitHub
Release workflow maintained through master branch
Code push triggers automated Jenkins Pipeline
Docker Implementation

The application was containerized using a custom Dockerfile.

Docker Workflow
Pull source code from GitHub
Build Docker image
Push image to Docker Hub
Docker Image
whoeepaksoni/website
Jenkins Pipeline

Jenkins Pipeline automates:

GitHub code pull
Docker image build
Docker Hub image push
Kubernetes deployment update

Pipeline file:

Jenkinsfile
Kubernetes Deployment

The application was deployed on Kubernetes using:

Deployment YAML
Service YAML
Deployment Features
2 Replicas
NodePort Service
Port Exposed: 30008
Kubernetes Objects
Deployment
Pods
ReplicaSet
NodePort Service
Project Structure
CAPSTONE-PROJECT-2/
│
├── ansible/
│   ├── docker-install.yml
│   ├── jenkins-install.yml
│   └── inventory.ini
│
├── docker/
│   ├── dockerfile
│   ├── index.html
│   ├── deployment.yml
│   ├── service.yml
│   └── Jenkinsfile
│
├── terraform/
│   ├── provider.tf
│   ├── ec2.tf
│   ├── security-group.tf
│   ├── variable.tf
│   ├── outputs.tf
│   └── terraform.tfvars
│
└── README.md
Jenkins Pipeline Stages
1. Pull Code from GitHub
2. Build Docker Image
3. Push Docker Image to Docker Hub
4. Deploy on Kubernetes Cluster
Terraform Commands
Initialize Terraform
terraform init
Validate Configuration
terraform validate
Plan Infrastructure
terraform plan
Apply Infrastructure
terraform apply
Ansible Commands
Run Docker Installation
ansible-playbook -i inventory.ini docker-install.yml
Run Jenkins Installation
ansible-playbook -i inventory.ini jenkins-install.yml
Kubernetes Commands
Deploy Application
kubectl apply -f deployment.yml
kubectl apply -f service.yml
Check Pods
kubectl get pods
Check Services
kubectl get svc
Output
Automated Infrastructure Creation using Terraform
Automated Configuration using Ansible
CI/CD Pipeline using Jenkins
Dockerized Application
Kubernetes Deployment with 2 Replicas
NodePort Service running on Port 30008
Future Improvements
Implement Helm Charts
Add Monitoring using Prometheus & Grafana
Configure HTTPS using Ingress Controller
Implement Auto Scaling
Use AWS EKS for Managed Kubernetes
Author
Deepak Soni

DevOps | AWS | Kubernetes | Terraform | Docker | Jenkins
