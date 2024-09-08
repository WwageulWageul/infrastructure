# Docs

AWS Infrastructure provisioning depends on Terraform

Follow the commands to spin up resources on AWS

**`aws-cli` and `terraform` is prerequisite**

# VPC

Tree structure of the VPC module

```sh
.
├── modules
│   └── vpc
│       ├── bastion_sg.tf
│       ├── global_variables.tf -> ../../../global_variables.tf
│       ├── isolated_private_subnet.tf
│       ├── locals.tf
│       ├── outputs.tf
│       ├── private_subnet.tf
│       ├── public_subnet.tf
│       ├── variables.tf
│       └── vpc.tf
├── sandoki_dev_apnortheast2
│   ├── backend.tf
│   ├── local.tfvars
│   ├── locals.tf
│   ├── main.tf
│   ├── provider.tf -> ../../provider.tf
│   └── variables.tf
├── sandoki_prod_apnortheast2
│   ├── backend.tf
│   ├── local.tfvars
│   ├── main.tf
│   ├── provider.tf -> ../../provider.tf
│   └── variables.tf
└── sandoki_stag_apnortheast2
    ├── backend.tf
    ├── local.tfvars
    ├── locals.tf
    ├── main.tf
    ├── provider.tf -> ../../provider.tf
    └── variables.tf  
```

>follow the commands in sequence

```sh
# 1. first of all, configure aws information to authorize permissions for accessment to AWS resources
$ aws configure

# 2. You must inject variable of `allowed_cidr_blocks_to_bastion_host`
# because it must be validated before executing `apply`
# type of the variables is `list(string)` and the cidr_blocks means
# only specific cidr blocks you input can access to resources inside private subnet through SSH protocol
$ echo "allowed_cidr_blocks_to_bastion_host = ["1.2.3.4/32"]" > local.tfvars 

# 3. check planning of the resource provisioning
# you must include the `local.tfvars`
$ tf plan -var-file=local.tfvars

# 4. after checking plan is valid, apply them
$ tf apply -auto-approve -var-file=local.tfvars -paralellism=30
```

>3 environments `dev`, `stag`, `prod` exists
and it's divided either directory
therefore you can manage and isolate resources by each environment.
