provider "aws" {}



data "aws_availability_zone" "working" {
 state = "available"
}

data "aws_caller_identity" "current" {}
data "aws_region" "current" {}
data "aws_vpcs" "current" {}
data "aws_vpc" "current" {
  tags = {
    Name = "My_Terraform"
  }
}

resource "aws_subnet" "Lesson_su-1" {
  vpc_id = data.aws_vpc.current.id
  availability_zone = data.aws_availability_zone.working.name
  cidr_block = "10.10.1.0/24"
  tags = {
   Name = "Subnet-1 in ${data.aws_availability_zone.working.name}"
   Account = "Subnet-1 ni ${data.aws_caller_identity.current.account_id}"
   Region = data.aws_region.current.description
  }
}


resource "aws_subnet" "Lesson_sub-2" {
  vpc_id = data.aws_vpc.current.id
  availability_zone = data.aws_availability_zone.working.name
  cidr_block = "10.10.2.0/24"
  tags = {
   Name = "Subnet-2 in ${data.aws_availability_zone.working.name}"
   Account = "Subnet-2 ni ${data.aws_caller_identity.current.account_id}"
   Region = data.aws_region.current.description
  }
}

output "aws_caller_identity" {
  value = data.aws_caller_identity.current.account_id
}

output "aws_region_name" {
  value = data.aws_region.current.name
}

output "aws_region_description" {
  value = data.aws_region.current.description
}

output "aws_vpcs_current" {
  value = data.aws_vpcs.current.ids
}

output "aws_vpc_id" {
  value = data.aws_vpc.current.id
}

output "aws_vpc_Lesson" {
  value = data.aws_vpc.current.id
}

output "aws_vpc_cidr_block" {
  value = data.aws_vpc.current.cidr_block
}

output "aws_availability_zone" {
  value = data.aws_availability_zone.working.name
}
