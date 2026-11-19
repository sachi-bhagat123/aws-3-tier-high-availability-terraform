\# AWS 3-Tier Highly Available Architecture using Terraform



\## Project Overview



This project demonstrates how to design and deploy a highly available, scalable, and secure 3-tier architecture on AWS using Terraform.



The infrastructure is deployed across two Availability Zones to improve availability and fault tolerance.



\## Architecture



The project contains three layers:



\### 1. Web Tier

\- External Application Load Balancer

\- EC2 instances

\- Auto Scaling Group

\- Private web subnets



\### 2. Application Tier

\- Internal Application Load Balancer

\- Application EC2 instances

\- Auto Scaling Group

\- Private application subnets



\### 3. Database Tier

\- Amazon RDS MySQL

\- Private database subnets

\- Database security groups

\- Multi-AZ deployment (if enabled)



\## AWS Services Used



\- Amazon VPC

\- Public and Private Subnets

\- Internet Gateway

\- NAT Gateway

\- Route Tables

\- Security Groups

\- EC2

\- Application Load Balancer

\- Auto Scaling Groups

\- Launch Templates

\- Amazon RDS MySQL

\- IAM

\- Amazon CloudWatch



\## Infrastructure as Code



Terraform is used to automate AWS infrastructure provisioning.



\## Project Structure



```text

.

├── provider.tf

├── variables.tf

├── terraform.tfvars.example

├── main.tf

├── vpc.tf

├── subnet.tf

├── internet-gateway.tf

├── nat-gateway.tf

├── route-table.tf

├── security-group.tf

├── iam.tf

├── alb.tf

├── launch-template.tf

├── autoscaling.tf

├── rds.tf

├── outputs.tf

└── user-data/

```



\## Deployment Steps



1\. Install Terraform and AWS CLI.

2\. Configure AWS credentials.

3\. Clone this repository.

4\. Create your local terraform.tfvars file.

5\. Initialize Terraform.



```bash

terraform init

```



6\. Validate the configuration.



```bash

terraform validate

```



7\. Review the infrastructure plan.



```bash

terraform plan

```



8\. Deploy the infrastructure.



```bash

terraform apply

```



\## Testing



\- Verify website access through the external ALB.

\- Verify web and application target health.

\- Test RDS connectivity from the application tier.

\- Test EC2 replacement through Auto Scaling.

\- Monitor infrastructure using CloudWatch.



\## Key Learnings



\- AWS cloud infrastructure design

\- Terraform Infrastructure as Code

\- High Availability and Fault Tolerance

\- Load Balancing and Auto Scaling

\- AWS Networking and Security

\- Database Connectivity

\- Infrastructure Monitoring



\## Author



Sachi Bhagat



AWS Cloud \& DevOps Engineer

