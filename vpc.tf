resource "aws_vpc" "main" {
  cidr_block           = "${cidrsubnet(var.allocated-cidr, var.split, var.production )}"
  enable_dns_support   = true
  enable_dns_hostnames = true

  lifecycle {
    create_before_destroy = true
  }

  tags {
    Name                   = "vpc-${var.tags["environment"]}-${var.tags["Name"]}"
    project                = "${var.tags["project"]}"
    application            = "${var.tags["application"]}"
    environment            = "${var.tags["environment"]}"
    cost-center            = "${var.tags["cost-center"]}"
    creator                = "${var.tags["creator"]}"
    responsible-department = "${var.tags["responsible-department"]}"
    type                   = "${var.tags["type"]}"
    responsible-party      = "${var.tags["responsible-party"]}"
  }
}

resource "aws_nat_gateway" "ngw" {
  subnet_id     = "${aws_subnet.public.*.id[0]}"
  allocation_id = "${aws_eip.nat.id}"
}

resource "aws_eip" "nat" {
  vpc      = true
}

resource "aws_internet_gateway" "igw" {
  vpc_id   = "${aws_vpc.main.id}"

  lifecycle {
    create_before_destroy = true
  }

  tags {
    Name                   = "igw-${var.tags["Name"]}-internet-gateway"
    project                = "${var.tags["project"]}"
    application            = "${var.tags["application"]}"
    environment            = "${var.tags["environment"]}"
    cost-center            = "${var.tags["cost-center"]}"
    creator                = "${var.tags["creator"]}"
    responsible-department = "${var.tags["responsible-department"]}"
    type                   = "${var.tags["type"]}"
    responsible-party      = "${var.tags["responsible-party"]}"
  }
}
