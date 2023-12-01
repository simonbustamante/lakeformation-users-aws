# APP USERS for AWS 

## Description
This repository contains Terraform scripts and Bash scripts for configuring and managing users and policies in AWS environments for the Dev Lake project. The scripts are designed to facilitate access and management of AWS resources such as Athena, IAM, and Lake Formation across different environments (development, UAT, production).

## Repository Structure
The repository is organized as follows:

- `main.tf`: Contains Terraform configuration to create IAM policies, users, and their access keys in different environments (dev, uat, prd).
- `user_management.sh`: Bash script for granting specific permissions to users in the AWS Lake Formation environment.

## Terraform Configuration
### Providers
Providers for different environments (development, UAT, production) are defined with specific profiles and regions.

### Variables
- `users`: List of user names for development, UAT, and production environments.
- `users_dev`: Specific users for the development environment.
- `users_uat`: Specific users for the UAT environment.
- `users_prd`: Specific users for the production environment.

### Resources
The following resources are created for each environment:
- IAM Policies (`aws_iam_policy`): Defines access policies for Athena and other services.
- IAM Users (`aws_iam_user`): Creates users in IAM.
- IAM User Policy Attachments (`aws_iam_user_policy_attachment`): Associates policies with users.
- IAM Access Keys (`aws_iam_access_key`): Generates access keys for users.
- Local Files (`local_file`): Saves the access keys in CSV files.

## Bash Script for User Management
The `user_management.sh` script automates the process of granting permissions in AWS Lake Formation to the defined users. It uses `PROFILE`, `ACCOUNTID`, and lists of databases to grant `DESCRIBE` permissions and others as needed.

### Usage
To run the script, simply execute the command `bash user_management.sh` in your terminal. Ensure you have the appropriate credentials and execution permissions for the script.

