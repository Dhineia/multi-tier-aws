🏗️ Multi-Tier AWS Infrastructure with Terraform
This project implements a secure and scalable three-tier architecture on AWS, built first through the AWS Console and then codified using Terraform. The architecture includes:
- A public Bastion Host
- A private app layer (EC2 with Nginx)
- A database subnet (planned for RDS)

🚀 Architecture Overview
- VPC: 10.0.0.0/16
- Subnets:
- Public: 10.0.1.0/24 (Bastion Host)
- Private: 10.0.2.0/24 (App Tier)
- DB: 10.0.3.0/24 (RDS-ready)
- Gateways:
- Internet Gateway for public access
- NAT Gateway for outbound access from private tiers
- Security Groups:
- Bastion SG: SSH from my IP only
- App SG: Port 80 + SSH from Bastion
- DB SG: Port 5432 from App subnet

📦 Project Phases
✅ Phase 1 – AWS Console Setup
Manual build of networking, subnets, IGW/NAT, and EC2s to validate the infrastructure design.
✅ Phase 2 – Terraform Codification
Replicated the entire architecture in .tf files for version control and automation.
✅ Phase 2.5 – SSH Validation Flow
- SSH from local → Bastion (public IP)
- SSH from Bastion → App EC2 (private IP)
- Nginx installed and tested via curl

🛠️ How to Deploy
terraform init
terraform plan
terraform apply
terraform destroy



🔐 How to Add .pem to SSH
scp -i aws-login.pem aws-login.pem ec2-user@54.145.230.13:~
ssh -i aws-login.pem ec2-user@54.145.230.13
chmod 400 aws-login.pem
ssh -i aws-login.pem ec2-user@<Private-EC2-IP>



🛠️ How to Install Nginx
sudo yum install nginx -y       # for Amazon Linux
sudo systemctl start nginx
sudo systemctl enable nginx

sudo systemctl status nginx
sudo netstat -tuln | grep :80
curl localhost



📘 Explanation

This project showcases a secure and scalable multi-tier infrastructure built on AWS using Terraform.
While it's not a full-featured website with a frontend UI like React or Vue, the design follows a classic three-tier model:
- A public tier with a Bastion Host to manage secure access
- An application tier with an EC2 instance running Nginx
- A data tier, currently scaffolded for RDS integration
I focused on network isolation, IAM roles, security groups, and NAT gateway configuration to simulate a real-world deployment environment.
This demonstrates my strength in infrastructure design, cloud security best practices, and automation with Terraform, even without a client-facing frontend. It’s not just a website—it’s a cloud-native foundation that could scale or integrate with any full-stack app later.

