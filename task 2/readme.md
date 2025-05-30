Terraform-Based AWS Infrastructure: VPC, Subnet, and EC2 Instance Setup

This project provisions a base AWS environment in an automated fashion using Terraform. It configures three fundamental components: a Virtual Private Cloud (VPC), a subnet within the VPC, and an EC2 virtual machine instance. The code is modular—each element is contained within its own directory—facilitating improved structure, reusability, and maintenance.
Project Structure Overview
The infrastructure is divided into three primary modules:

1. EC2 Instance Module
This module is tasked with creating an EC2 instance in the subnet that has been configured.

Important files in the EC2 module:

main.tf – It defines the EC2 resource along with its AMI (Ubuntu), instance type (t3.micro), association with a subnet, and tagging information.

variables.tf – It takes input parameters such as:

AMI ID

Instance type (e.g., t3.micro)

Subnet ID

Tag name for the instance

outputs.tf – It shows the instance's information after deployment, e.g., the EC2 Instance ID.

2. VPC Module
This section deals with the setup of a Virtual Private Cloud, which is the segregated network space.

Files in the VPC module:

main.tf – Holds the setup for creating a VPC with a given CIDR block (e.g., 10.0.0.0/16) and a name.

variables.tf – Declares inputs needed for VPC setup, such as:

CIDR block

VPC name

outputs.tf – Exports the VPC ID, which can be consumed by other modules.

3. Subnet Module
The subnet module allocates a subnet within the VPC, defining its availability zone and address range.

Files in the Subnet module:

main.tf – Creates the subnet and associates it with the VPC using a smaller CIDR block.

variables.tf – Accepts the following inputs:

VPC ID

CIDR block for the subnet

Availability zone

outputs.tf – Outputs the Subnet ID after creation.

Root Module (Project Entry Point)
The root module orchestrates the run of all three modules and passes them the necessary variables.

Root directory files:

main.tf – Points to the EC2, subnet, and VPC modules and passes values into them. This is the main orchestrator.

variables.tf – Defines the global variables required across modules.
terraform.tfvars – Provides real values for the input variables (e.g., VPC CIDR, instance type).

outputs.tf – Outputs combined outputs consisting of:

VPC ID

Subnet ID

EC2 Instance ID
