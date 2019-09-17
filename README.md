# AWS Migrating S3 buckets and RDS databases to a new region

This repo is used to set up the infrastructure used to demo how to migrate S3 buckets and RDS databases to new regions.

## Setup

1. Create an IAM user with sufficient permissions to create the infrastructure you require. Generate an API key for the user, and create a named profile in `~/.aws/credentials` that looks like this:
~~~
[aws-webinar]
aws_access_key_id = your_api_key
aws_secret_access_key = your_api_key_secret
~~~

2. Create an S3 bucket in your region of choice. Edit `infra/terraform-state.tf` by replacing the `bucket`, `region` and `profile` values to what you have configured.

3. Run `terraform init` in the `infra` directory.

4. Run `terraform plan out=plan.out` and review the output.

5. To create the infrastructure, run `terraform apply plan.out`.