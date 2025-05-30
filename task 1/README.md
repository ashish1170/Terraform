                                                                 TASK-1
This whole guide will help you how to launch a virtual machine (EC2 instance) on Amazon Web Services (AWS) using Terraform. Variables are used for flexibility, but you can also insert values directly if you prefer simplicity.

Overview of the Setup
-Here's what will be created as part of this setup:
-EC2 instance type: t3.micro
-Operating system: Ubuntu (defined using an AMI ID)
-Subnet: Custom (defined by the user)
-Public IP: Disabled
-Root EBS volume: 12 GB

Step 1: Install Necessary Tools
 --Before starting, make sure the following tools are installed:
 --For AWS CLI on windows:
 --Run a system update
 --Install the AWS CLI package
Confirm installation using a version check command
 For Terraform on Windows:
 --Use Chocolatey to install Terraform

Step 2: Configure AWS CLI
 --After installation, the AWS CLI must be configured. Here's how:
 --Open your terminal or command prompt
 --Enter the command to start the configuration process
 --Provide your AWS Access Key ID
 --Enter your AWS Secret Access Key
 --Choose a default region
 --Select an output format (e.g., JSON)
To get the access keys:
 --Log in to your AWS account
 --Go to the top-right corner and click on your username
 --Navigate to “My Security Credentials”
 --In the "Access Keys" section, click on "Create New Access Key"
 --Save the key details shown on-screen or download the CSV file

Step 3: Create Your Terraform Project Files
 --Your project folder should contain the following files:
 --provider.tf – This file specifies the AWS provider and credentials setup
 --main.tf – Contains the configuration details for launching the EC2 instance
 --variables.tf – Lists all input variables used in the configuration
 --terraform.tfvars – Provides actual values for the input variables

Step 4: Execute Terraform Commands
 Once all files are in place, perform the following steps:
 --Initialize the project using the Terraform init command
 --Generate and review an execution plan
 --Apply the configuration to deploy the EC2 instance
 --When finished, use the destroy command to remove all created resources
