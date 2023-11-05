locals {
  region                 = "ap-northeast-2"
  profile                = "meturial"
  vpc_cidr_block         = "10.0.0.0/16"
  route_table_cidr_block = "0.0.0.0/0"
  subnet_1_cidr_block    = "10.0.1.0/24"
  subnet_2_cidr_block    = "10.0.2.0/24"
  subnet_3_cidr_block    = "10.0.3.0/24"
  subnet_4_cidr_block    = "10.0.4.0/24"
  name_prefix            = "test"
}