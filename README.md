# AWS Terraform module

[![Build Status](https://travis-ci.com/celkins/terraform-aws.svg?branch=master)](https://travis-ci.com/celkins/terraform-aws)

Terraform module which manages base resources in my AWS account(s).

## Usage

### Bootstrapping

Bootstrap the account by creating a CloudFormation stack that manages the following resources:

- IAM administrator role that trusts an AWS principal
- IAM developer role that trusts an AWS principal
- S3 bucket suitable for storing Terraform state files

This stack can be created via the console immediately after account creation (easy) or later with the CLI (hard, because it requires creating access keys for the root account [or creating some other adminstrator-ish role]):

```console
aws cloudformation create-stack             \
    --stack-name <value>                    \
    --template-body file://./bootstrap.yaml \
    --capabilities CAPABILITY_IAM           \
    --parameters ParameterKey=AdministratorPrincipal,ParameterValue=<value> ParameterKey=DeveloperPrincipal,ParameterValue=<value>
```
