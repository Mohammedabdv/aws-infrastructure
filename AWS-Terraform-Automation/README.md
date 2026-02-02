# 🏗️ Modular AWS Infrastructure Automation (Terraform)

This repository contains a professional, modularized Terraform configuration to deploy a highly available and scalable web infrastructure on AWS. By using a **Modular Design**, this project ensures that each component (VPC, Compute, Networking) is reusable, maintainable, and easy to scale.

---

## 📁 Project Structure

The project is organized into two main directories to separate logic from implementation:

* **`modules/`**: Contains the blueprint for individual components. Each module is independent and defines specific resources (e.g., VPC setup, Auto Scaling, Load Balancing).
* **`Root/`**: The main execution layer. This is where the modules are called, variables are passed, and the final infrastructure is orchestrated.
* **`.terraform/`**: (Local only) Contains the initialized providers and modules after running `terraform init`.

---

## 🛠️ Architecture & Key Features

This project automates a **2-Tier Scalable Architecture** focused on high availability:

* **Networking (VPC Module):** * Custom VPC with public and private subnets.
    * Multi-AZ deployment for fault tolerance.
    * NAT Gateway for secure outbound internet access for private instances.
* **Compute & Scaling:** * **Auto Scaling Group (ASG):** Automatically adjusts the number of EC2 instances based on traffic.
    * **Launch Templates:** Standardized configuration for all instances.
* **Traffic Management:** * **Application Load Balancer (ALB):** Acts as a single entry point, distributing traffic across healthy instances in private subnets.
* **Security:** * Security Groups acting as virtual firewalls with strict inbound/outbound rules (Principle of Least Privilege).

---

## 🚀 Getting Started

### Prerequisites
1.  **Terraform:** [Install Terraform](https://www.terraform.io/downloads.html).
2.  **AWS CLI:** Properly configured with your credentials (`aws configure`).

### Deployment Instructions
All commands must be executed within the **`Root`** directory:

1.  **Initialize the project:**
    ```bash
    cd Root
    terraform init
    ```
2.  **Plan the deployment:**
    ```bash
    terraform plan
    ```
3.  **Apply changes:**
    ```bash
    terraform apply --auto-approve
    ```

---

## 🛡️ Best Practices Applied
* **Modularity:** Clean separation of concerns between different infrastructure layers.
* **DRY (Don't Repeat Yourself):** Using modules to avoid redundant code.
* **Infrastructure as Code (IaC):** Version-controlled infrastructure for consistency and speed.
* **Security:** Keeping application servers in private subnets, isolated from direct internet access.

---

## 🧹 Cleanup
To avoid ongoing AWS costs, you can destroy all provisioned resources with:
```bash
terraform destroy --auto-approve
