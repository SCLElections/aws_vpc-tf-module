resource "aws_subnet" "public" {
  count                   = "${length(var.availability-zones)}"
  vpc_id                  = "${aws_vpc.main.id}"
  cidr_block              = "${cidrsubnet(aws_vpc.main.cidr_block, var.newbits, length(var.availability-zones) + count.index)}"
  availability_zone       = "${var.region}${element(var.availability-zones, count.index)}"
  map_public_ip_on_launch = true

  lifecycle {
    create_before_destroy = true
  }

  tags {
    Name                   = "sub-${var.tags["environment"]}-${var.tags["Name"]}-${element(var.availability-zones, count.index)}-public"
    project                = "${var.tags["project"]}"
    application            = "${var.tags["application"]}"
    environment            = "${var.tags["environment"]}"
    cost-center            = "${var.tags["cost-center"]}"
    creator                = "${var.tags["creator"]}"
    responsible-department = "${var.tags["responsible-department"]}"
    type                   = "${var.tags["type"]}"
    responsible-party      = "${var.tags["responsible-party"]}"
    Tier                   = "public"
  }
}

resource "aws_subnet" "private" {
  count             = "${length(var.availability-zones)}"
  vpc_id            = "${aws_vpc.main.id}"
  cidr_block        = "${cidrsubnet(aws_vpc.main.cidr_block, var.newbits, count.index)}"
  availability_zone = "${var.region}${element(var.availability-zones, count.index)}"

  lifecycle {
    create_before_destroy = true
  }

  tags {
    Name                   = "sub-${var.tags["environment"]}-${var.tags["Name"]}-${element(var.availability-zones, count.index)}-private"
    project                = "${var.tags["project"]}"
    application            = "${var.tags["application"]}"
    environment            = "${var.tags["environment"]}"
    cost-center            = "${var.tags["cost-center"]}"
    creator                = "${var.tags["creator"]}"
    responsible-department = "${var.tags["responsible-department"]}"
    type                   = "${var.tags["type"]}"
    responsible-party      = "${var.tags["responsible-party"]}"
    Tier                   = "private"
  }
}
