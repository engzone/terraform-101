resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr

  tags = merge(
    {
      "Name" = format("%s", data.aws_region.current.name)
    },
    var.tags,
  )
}

resource "aws_subnet" "main" {
  count = length(var.azs)

  vpc_id            = aws_vpc.main.id
  cidr_block        = element(concat(var.subnets_cidr, [""]), count.index)
  availability_zone = element(var.azs, count.index)

  tags = merge(
    {
      "Name" = format("%s", element(data.aws_availability_zones.available.names, count.index))
    },
    var.tags,
  )
}
