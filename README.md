# 🏗️ Multi-Tier AWS Infrastructure with Terraform

This project implements a secure and scalable three-tier architecture on AWS, built first through the AWS Console and then codified using Terraform. The architecture includes a public Bastion Host, a private app layer (EC2 with Nginx), and a database subnet (planned for RDS).

---

## 🚀 Architecture Overview

- **VPC**: 10.0.0.0/16
- **Subnets**:
  - Public: 10.0.1.0/24 (Bastion Host)
  - Private: 10.0.2.0/24 (App Tier)
  - DB: 10.0.3.0/24 (RDS-ready)
- **Gateways**:
  - Internet Gateway for public access
  - NAT Gateway for outbound internet on private tiers
- **Security Groups**:
  - Bastion SG: SSH from my IP only
  - App SG: Port 80 + SSH from Bastion
  - DB SG: Port 5432 from App subnet

---

## 📦 Project Phases

### ✅ Phase 1 – AWS Console Setup
Manual build of networking, subnets, IGW/NAT, and EC2s to validate infra design.

### ✅ Phase 2 – Terraform Codification
Replicated the entire architecture in `.tf` files for version control and automation.

### ✅ Phase 2.5 – SSH Validation Flow
- SSH from local → Bastion (public IP)
- SSH from Bastion → App EC2 (private IP)
- Nginx installed and tested via curl

---

## 🛠️ How to Deploy

```bash
terraform init
terraform plan
terraform apply
terraform destroy

## How to add .pem to ssh
scp -i aws-login.pem aws-login.pem ec2-user@54.145.230.13:~
ssh -i aws-login.pem ec2-user@54.145.230.13
chmod 400 aws-login.pem
ssh -i aws-login.pem ec2-user@<Private-EC2-IP>
---

## 🛠️ How to Install Nginx
sudo yum install nginx -y       # for Amazon Linux
sudo systemctl start nginx
sudo systemctl enable nginx

sudo systemctl status nginx
sudo netstat -tuln | grep :80
curl localhost
