# AWS Infrastructure: High-Availability & Scalable Architecture

This project demonstrates a production-ready AWS environment featuring a redundant network across multiple Availability Zones, automated scaling, and a security-first design using IAM roles and tightly controlled Security Groups.

## 🎯 Project Objective
The objective of this project is to design and deploy a highly available and fault-tolerant web application infrastructure using AWS best practices. By leveraging an Application Load Balancer (ALB) and Auto Scaling Groups (ASG), the architecture ensures efficient traffic distribution, dynamic scaling based on demand, and zero downtime. Application servers are hosted in private subnets to enhance security and eliminate direct public exposure.

## 🛠️ Tech Stack & Skills
- **Cloud Provider:** AWS (Amazon Web Services)
- **High Availability:** Multi-AZ Deployment, Application Load Balancer (ALB)
- **Scalability:** Auto Scaling Groups (ASG), Launch Templates
- **Networking:** VPC, Public & Private Subnets, Route Tables, Internet Gateway, NAT Gateways
- **Security & Management:** IAM Roles, AWS Systems Manager (SSM), Security Groups
- **Traffic Management:** Application Load Balancer (ALB), Target Groups

---

## ☁️ Phase 1: Networking & VPC Foundation

### 1. VPC Configuration
![VPC Configuration](./screenshots/01-vpc-setup.png)
Establishing the core network foundation with a `10.0.0.0/16` CIDR block. DNS hostnames and resolution are enabled to support internal AWS resource communication and service discovery.

---

### 2. Internet Gateway (IGW)
![Internet Gateway](./screenshots/03-internet-gateway.png)
Deploying and attaching an Internet Gateway to the VPC to provide a dedicated path for internet traffic to reach public-facing resources.

---

### 3. Multi-AZ Subnet Design
![Multi-AZ Subnet](./screenshots/04-public-subnets.png)
Implementing a highly available architecture across two Availability Zones (AZs):
- **Public Subnets:** Designed for Load Balancers and NAT Gateways to manage entry/exit traffic.
- **Private Subnets:** An isolated tier for application servers and databases, enhancing security by preventing direct external access.

---

### 4. Routing & Subnet Association
![Routing & Subnet Association](./screenshots/05-public-route-table.png)
- **Public Route Table:** Configured to route external traffic (`0.0.0.0/0`) through the IGW, with "Auto-assign IP" enabled for associated subnets.
- **Private Route Tables:** Configured to route outbound traffic through NAT Gateways for secure system updates and patching.

---

### 5. NAT Gateways (Redundancy)
![NAT Gateways](./screenshots/09-nat-gateway-a.png)
Deployed dual NAT Gateways (one per AZ). This ensures fault tolerance; if one AZ experiences an outage, private resources in the remaining AZ retain secure outbound internet access.

---

## 💻 Phase 2: Compute & Load Balancing

### 6. IAM Role for SSM (Secure Management)
![IAM Role](./screenshots/12-iam-ssm-role.png)
Implementing an IAM role with the `AmazonEC2RoleforSSM` policy. This allows secure, browser-based terminal access via AWS Systems Manager, eliminating the need for SSH keys or Bastion hosts.

---

### 7. Compute Layer (EC2 Instances)
![EC2 Setup](./screenshots/14-web-server-1-details.png)
Deployment of web server instances within private subnets. This architectural layer ensures that the application servers are never directly exposed to the public internet.

---

### 8. Target Group & Health Checks
![Target Group](./screenshots/16-target-group-status.png)
Configuring Target Groups with automated health checks. The Application Load Balancer is configured to route traffic only to "Healthy" instances, ensuring application reliability.

---

### 9. Application Load Balancer (ALB)
![Application Load Balancer](./screenshots/17-application-load-balancer.png)
Serving as the single point of entry for all web traffic. The ALB distributes incoming requests across multiple AZs to achieve zero downtime and high availability.

---

### 10. Launch Template 
![Launch Template](./screenshots/18-launch-template-config.png)
To create a standardized "blueprint" for every EC2 instance. This ensures consistency and eliminates manual errors during scaling.

---

### 11. Auto Scaling Group
![Auto Scaling Group](./screenshots/19-auto-scaling-group.png)
Provides elasticity by automatically adjusting instance counts based on traffic demand and ensuring self-healing for failed instances.

---

## 🔒 Phase 3: Security & Firewall Rules

### 12. ALB Security Group (Front-end Security)
![ALB Security Group](./screenshots/23-alb-sg-outbound-rules.png)
Inbound rules allow public HTTP traffic, while outbound rules are strictly limited to the Web Servers' Security Group on port 80, minimizing the attack surface.

---

### 13. Web Server Security (Backend Security)
![Web Security Group](./screenshots/24-web-sg-inbound-rules.png)
Adhering to the "Principle of Least Privilege." The Web Server Security Group only accepts inbound traffic originating from the ALB’s Security Group, blocking all other direct access attempts.

---

## ✅ Validation
- **Accessibility:** Verified application access via the ALB DNS endpoint.
- **Health Checks:** Confirmed all EC2 instances are registered and healthy within the Target Group.
- **Security:** Verified that web servers are unreachable via direct public IP, accepting traffic only through the Load Balancer.

## 🧠 Key Learnings & Skills Demonstrated
- **High Availability (HA):** Designing systems that survive data center (AZ) outages.
- **Scalability:** Implementing Auto Scaling to handle traffic spikes and reduce costs during low activity.
- **Security-in-Depth:** Implementing multi-layered security using Security Groups (Firewalls) and private networking.
- **Infrastructure Management:** Using Launch Templates for consistency and IAM roles for secure, keyless access.
