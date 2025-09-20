                                              Multi-Environment Infrastructure Setup with Terraform

This is a project to setup and manage AWS cloud infrastructure in multiple environments—dev, test, and prod—using Terraform. The infrastructure is composed using reusable modules, which keeps the codebase tidy, scalable, and easy to manage. Every environment (dev, test, prod) maintains its own configurations, with the common logic abstracted into modules.

Project Folder Structure

The project directory is set as follows:
dev
test

prod

modules

All the first three folders have configurations for one environment each. The modules folder stores shared building blocks that are referenced in each environment.

Development Environment Configuration (dev folder)

The dev folder stores all Terraform files required to configure the development environment infrastructure. It establishes how modules such as VPC, EC2, and subnets are joined and tailored using development-specific values.

Files commonly found in this folder:

backend.tf – Declares where the state file for Terraform will be remotely stored, e.g., an S3 bucket or Terraform Cloud workspace. Remote state provides consistency and facilitates team collaboration.

local.tf – Declares local-only variables that are utilized to declutter internal logic within the environment. Such variables are not passed in from outside.

main.tf – Serves as the main configuration file that consolidates different modules such as VPC, subnets, and EC2 instances by providing them values.

output.tf – Specifies the values that will be returned by Terraform when it executes the configuration. For instance, this can contain the public IP of the instance or IDs of the created resources.

provider.tf – Configures the cloud provider utilized for this project, AWS. It has details like the region chosen and authentication credentials.

terraform.tfvars – Holds real input values for variables declared in variable.tf. These are specific to the development environment.

variable.tf – Defines the input variables needed for the main configuration file. These can be CIDR blocks, EC2 instance types, and availability zones.

This structure enables every environment to run in isolation, which is perfect for ensuring separation between development, test, and production phases.

Modules Folder Overview (modules folder)

The modules folder contains reusable modules, which are designed to handle a piece of the AWS infrastructure. These modules are referred to by the core configuration files in each environment directory, lessening duplication and enhancing consistency.

Subfolders typically in the modules directory:

ec2 – Specifies how instances of EC2 are launched. Accepts parameters such as the image ID, instance type, key pair, subnet ID, and name tags.

eip – Controls the launch of Elastic IP addresses, which are static public IP addresses that can be associated with EC2 instances.

igw – Has logic for launching an Internet Gateway, used for public subnets to access the internet.

nat – Specifies a NAT Gateway setup. This enables private instances to see the internet (e.g., for updated downloads) but not expose them to incoming traffic.

s3 – Employed to create S3 buckets. They might be used to store application files, logs, or even Terraform remote state.

sg – Controls security groups and rules. These specify what network traffic is permitted to and from AWS resources such as EC2.

subnet – Establishes subnets in the VPC. Subnets are defined with CIDR blocks and are allocated to designated availability zones. They can be designated as public or private.

vpc – Manages the creation of the Virtual Private Cloud (VPC), which serves as the root network in AWS where all other elements are spun up.
