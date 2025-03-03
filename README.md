# AWS Infrastructure Deployment using Terraform

This Terraform project sets up an AWS environment with a **VPC**, **public and private subnets**, and deploys EC2 instances in both subnets.

---

## 📌 Features
- ✅ **VPC** creation (`192.10.0.0/24`)
- ✅ **Internet Gateway** for public subnet
- ✅ **Public Subnet** (`192.10.0.0/25`)
- ✅ **Private Subnet** (`192.10.0.128/25`)
- ✅ **Route Tables** (public with internet access, private without)
- ✅ **Security Groups** allowing inbound/outbound rules
- ✅ **EC2 Instances** in both public and private subnets
- ✅ Uses the latest **Ubuntu 22.04** AMI

---

## 🏗️ Architecture

                      +-------------------+
                      |    AWS VPC        |
                      |  192.10.0.0/24    |
                      +-------------------+
                               |
            -----------------------------------
            |                                 |
    +-------------+                  +-------------+
    | Public Subnet|                  | Private Subnet|
    | 192.10.0.0/25 |                 | 192.10.0.128/25 |
    +-------------+                  +-------------+
            |                                 |
    +-------------+                  +-------------+
    | EC2 Instance |                  | EC2 Instance |
    |  (Public)    |                  |  (Private)   |
    +-------------+                  +-------------+
            |
    +---------------------+
    | Internet Gateway (IGW) |
    +---------------------+


---

## 🛠️ Prerequisites
- **Terraform** installed (`>= 1.0`)
- **AWS CLI** configured (`aws configure`)
- An **SSH key** for EC2 access

---

## 🚀 Deployment Steps

### 1️⃣ Clone the Repository
```sh
git clone <repo-url>
cd terraform-aws-vpc

Initialize Terraform
```bash
terraform init
```
Validate the Configuration
```bash
terraform validate
```
Plan Deployment
```bash
terraform plan
```
Apply the Changes
```bash
terraform apply
```


📌 Terraform Files
vpc.tf → Defines VPC, subnets, and route tables
security.tf → Security group rules
ec2-public.tf → Deploys an EC2 instance in the public subnet
ec2-private.tf → Deploys an EC2 instance in the private subnet
outputs.tf → Displays instance details after deployment
