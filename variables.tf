variable "dynamo_table_name"{
    type = string
    default = "dev-dynamo-table"
    description = "This is the name of the Dynamo table"
}

variable "ami_id"{
    default = "ami-01a00762f46d584a1"
    type = string
    description = "AMI ID for Ubuntu"
}