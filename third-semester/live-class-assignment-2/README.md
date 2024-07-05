## Live Class Assignment 2

#### Instructions
__Project__ 
Deploy a Static Website on AWS using Terraform

__Objective__
Create an AWS infrastructure to host a static website using Terraform. The infrastructure will include AWS S3 for storing the website files, CloudFront for content delivery, and Route 53 for domain name management. Additional configurations will involve setting API Gateway, and SSL certificates.

__Prerequisites__
- AWS IAM Account with sufficient permissions to create and modify resources
- teraform install properly configured and connected to the aws iam account
- Static files
- Domain name registered in Route 53
- Helpful to have gone through a similar process using the console

__Steps__
This terraform project provides a configuration host a static website using AWS bucket and cloudfront to servve the content.

- Go through codebase to have a grasp of what the configuration is meant to do
- Copy and replace static web files to be hosted into the `website` directory in the `s3_bucket` module
- Edit `terraform.tfvars` files and add custom arguments
- Run 
-- `terraform init` to initialize initializes a working directory and install plugin & modules 
-- `terraform validate` to verify the correctness of Terraform configuration files after adding custom changes
-- `terraform plan` to perform a dry run and preview resources that will be created
-- `terraform apply` to executes planned actions
- If successful, Confirm if your website is up via your domain name
- Remember to run `terrafrom destroy` if you are just testing or runnign a demo

__Troubleshooting__
If your wite is not up on your domain name, can be domain issue, so check if you can access your website via the outputted cloudfront dns.

