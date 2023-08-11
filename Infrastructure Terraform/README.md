# Secure AWS infrastructure

Welcome to the project repository for Secure AWS infrastructure project. This repository contains the Terraform code for creating a secure AWS infrastructure using AWS services such as VPC, EC2, Target Group, Application Load Balancer (ALB), and Auto Scaling Group (ASG). This infrastructure is designed to provide a reliable and scalable environment for hosting applications.

## Table of Contents

- Description
- How to Use
  - Prerequisites
  - Installation
  - Configuration
  - Deployment
- Contributing
  
## Description

The goal of this project is to provide a secure and scalable AWS infrastructure using Terraform. The infrastructure consists of the following components:

- **VPC**: A Virtual Private Cloud (VPC) is created to isolate the resources within a private network. It provides control over network configuration, IP address ranges, and subnets.

- **EC2**: Amazon Elastic Compute Cloud (EC2) instances are launched within the VPC. These instances serve as the computing resources for hosting applications.

- **Target Group**: A Target Group is created to define a set of EC2 instances that can receive traffic from an ALB.

- **ALB**: An Application Load Balancer (ALB) is created to distribute incoming traffic across multiple EC2 instances. It improves availability and scalability of the application.

- **ASG**: An Auto Scaling Group (ASG) is created to automatically adjust the number of EC2 instances based on the application load. It ensures that the desired capacity is maintained even if instances fail.

This project follows best practices for security and reliability, incorporating features such as private subnets, security groups, and automated scaling.

## How to Use

Follow the steps below to use this project:

### Prerequisites

- Terraform installed on your local machine.
- AWS account credentials with appropriate permissions to create resources.
  
### Installation

1. Clone this repository to your local machine using the following command:

    ```shell
    git clone https://github.com/Aahil13/Secure-AWS-Infrastructure.git
    ```

2. Change into the project directory:

    ```shell
    cd Secure AWS Infrastructure
    ```

### Configuration

1. Use the variables.tf file to provide values for the variables used in the Terraform code. You can use the provided `variables.tf.example` file as a template:

    ```shell
    cp variables.tf.example variables.tf
    ```

    Modify the values in variables.tfvars to match your requirements.

2. Review and modify the Terraform code as needed, such as adjusting resource configurations, adding or removing resources, etc.

## Deployment

1. Initialize the Terraform project:

    ```shell
    terraform init
    ```

2. Validate the Terraform code:

    ```shell
    terraform validate
    ```

    Ensure that there are no errors in the code.

3. Plan the infrastructure changes to be applied:

    ```shell
    terraform plan
    ```

    Review the planned changes to ensure they align with your expectations.

4. Apply the infrastructure changes:

    ```shell
    terraform apply
    ```

    Confirm the changes by typing yes when prompted.

    Terraform will create the AWS resources based on the provided configuration. The output will show the created resources.

## Contributing

Contributions to this project are welcome! If you find any issues or would like to suggest improvements, please open an issue or submit a pull request.
