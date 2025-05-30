aws_region    = "eu-north-1"
vpc_cidr      = "172.31.0.0/16"
az_count      = 2
db_pass       = "syndicates"
availability_zones = ["eu-north-1a", "eu-north-1b"]
key_name      = "prod-key"
instance_type = "t2.micro"
ami_id        = "ami-00f34bf9aeacdf007"
user_data     = ""
tags = {
  Project     = "Task4"
}
