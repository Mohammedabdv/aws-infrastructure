# AWS High Availability Infrastructure  
### Manual (Console) vs Infrastructure as Code (Terraform)

This repository demonstrates a **highly available and scalable AWS infrastructure** designed using AWS best practices.  
The same architecture is implemented in **two different approaches**:

- **Manual deployment using AWS Management Console**
- **Automated deployment using Terraform (Infrastructure as Code)**

The goal of this project is to showcase a clear understanding of **AWS core services**, **high availability concepts**, and the ability to transition from manual setups to fully automated infrastructure.

---

## 🏗 Architecture Overview

The infrastructure is designed to ensure:

- High Availability across multiple Availability Zones
- Load balancing of incoming traffic
- Automatic scaling based on demand
- Secure and isolated networking

### Core Components

- **VPC** with public subnets across multiple Availability Zones
- **Application Load Balancer (ALB)** to distribute traffic
- **Auto Scaling Group (ASG)** for EC2 instances
- **Security Groups** following least-privilege principles
- **IAM Roles** for secure EC2 permissions

> This project focuses on the **networking and compute layers** and does not include a database layer.

---

## ⚙️ Deployment Approaches

### 1️⃣ AWS Console (Manual)

- Resources are created manually through the AWS Management Console
- Helps understand how services interact behind the scenes
- Useful for learning and validation of AWS fundamentals

### 2️⃣ Terraform (Infrastructure as Code)

- Fully automated deployment using Terraform
- Modular structure for reusability and clarity
- Easy to scale, modify, and destroy infrastructure
- Demonstrates real-world DevOps and Cloud practices

---

## 🚀 Key Learning Outcomes

- Designing highly available architectures on AWS
- Understanding ALB and Auto Scaling integration
- Difference between manual and automated infrastructure
- Writing clean and reusable Terraform modules
- Applying AWS security best practices

---

## 🛠 Technologies Used

- **AWS EC2**
- **Application Load Balancer (ALB)**
- **Auto Scaling Group (ASG)**
- **VPC & Subnets**
- **IAM & Security Groups**
- **Terraform**







