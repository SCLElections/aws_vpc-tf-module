# AWS VPC
This modules creates AWS VPC's and subnets.

## Example

```hcl-terraform
module "vpc" {
  source         = "git@github.com:SCLElections/aws_vpc-tf-module"
  allocated-cidr = "10.0.0.0/8"
  production     = true
  newbits       = 4
  tags           = {
    Name                   = "projectname"
    project                = "github-repo-name"
    application            = "project-code"
    environment            = "production"
    cost-center            = "0000"
    type                   = "project-type"
    creator                = "filipe.ferreira@sclgroup.cc"
    responsible-department = "Engineering"
    responsible-party      = "SCL"
  }
}

```

## Input Variables
* **tags** - **[map]** - (required) - AWS resource tags following company recommended.
* **allocated-cidr** - **[string]** - (required) - Allocated cidr block for the specific vpc.
* **production** - **[boolean]** - (default: false) - If using a development enviroment and a production one this is used to split the cidr block into two.
* **split** - **[boolean]** - (default: false) - This will split your vpc cidr into two.
* **newbits** - **[string]** - (default: 8) - Number used to split vpc cidr.
* **availability-zones** - **[list]** - (default: ["a","b","c"]) - Availability zones for each of the subnets.
* **region** - **[string]** - (default: "eu-east-1") - AWS Region to create the vpc.
* **aws_profile** - **[string]** - (default: "scl-production") - AWS profile to use when creating this resource.
 

## Output Variables
* **public-route-table** - List of public route tables.
* **private-route-table** - List of private route tables.
* **public-subnets** - List of public subnets.
* **private-subnets** - List of private subnets.
* **id** - ID of the VPC.
* **cidr** - Cidr block of the VPC.
* **ngw** - Network gateway of the VPC.
* **igw** - Internet gateway of the VPC.