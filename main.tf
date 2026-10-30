# 1. Declaration Provider
terraform {
	required_providers {
		aws = {
			source = "hashicorp/aws"
			version = "~> 5.0"
		}
	}
}

# 2. Region Configuration
provider "aws" {
	region = "ap-southeast-1"
}

# 3. Create resource commands
resource "aws_s3_bucket" "my_first_bucket" {
	bucket = "devops-portfolio-bucket-tunt" 
	
	tags = {
		Environment = "Dev"
		Managed     = "Terraform"
	}
}
# 4. Lock all public access
resource "aws_s3_bucket_public_access_block" "secure_my_bucket" {
	bucket = aws_s3_bucket.my_first_bucket.id
	
	block_public_acls	= true
	block_public_policy	= true
	ignore_public_acls	= true
	restrict_public_buckets	= true
}

