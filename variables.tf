variable "AWS_ACCESS_KEY" {
      default = ""
}
variable "AWS_SECRET_KEY" {
     default = ""
}
variable "AWS_REGION" {
  default = "us-east-1"
}
variable "AMIS" {
  type = "map"
  default = {
    us-east-1 = "ami-0761dd91277e34178"
    us-west-2 = "ami-06b94666"
    eu-west-1 = "ami-844e0bf7"
  }
}
variable "key_name" {
    type = string
    default = "aug-key"
}

variable "subnet_id" {
    type = string
    default = "subnet-16e1d74a"
}

variable "security_groups" {
    type = string
    default = "sg-085b9a47385e99b3c"
}

variable "aws_iam_role" {
    type = string
    default = "arn:aws:iam::477308691551:role/eks-role"

}

variable "aws_policy_arn" {
    type = string
    default = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

