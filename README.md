# AWS Infrastructure Showcase: Manual vs Automated ☁️

This repository contains two projects demonstrating my ability to design and deploy scalable and highly available cloud environments on AWS, focusing on networking and compute layers.

---

## 📂 Repository Structure

| Project Folder | Deployment Method | Key Focus |
| :--- | :--- | :--- |
| `AWS-HA-Scalable-Infrastructure` | **AWS Management Console** | Manual Setup, HA Design, Scaling |
| `aws-terraform-3tier-architecture` | **Terraform (IaC)** | Automation, VPC Modularization, Security |

---

## 🛠 Project 1: High Availability & Scalable Infrastructure
**Method:** Manual Configuration via AWS Console

In this lab, I built a resilient environment from scratch using the AWS Console. The goal was to understand how each component interacts to provide a seamless user experience under load.

### Key Features:
* **High Availability:** Instances deployed across multiple Availability Zones.
* **Elastic Load Balancing:** Application Load Balancer (ALB) to route traffic and perform health checks.
* **Auto Scaling:** Configured policies to automatically add/remove EC2 instances based on CPU utilization.
* **VPC Networking:** Custom VPC with Public and Private subnets and NAT Gateway for secure internet access.

---

## 🚀 Project 2: Scalable Architecture via Terraform
**Method:** Infrastructure as Code (IaC)

This project automates the deployment of a multi-tier web/app architecture. By using Terraform, the entire infrastructure is version-controlled and can be recreated in minutes.

### Infrastructure Components:
1.  **Public Tier:** Hosts the Load Balancer and Bastion host (if applicable).
2.  **Application Tier:** Private subnets hosting the web servers/application logic, isolated from direct internet access.
3.  **Security:** Detailed Security Groups for strict traffic control between tiers.

### Tools Used:
* **Terraform:** For infrastructure provisioning.
* **HCL:** To define reusable modules and resources.
* **AWS Provider:** To communicate with AWS APIs.

### Quick Start (Terraform):
```bash
cd aws-terraform-3tier-architecture
terraform init
terraform plan
terraform apply
