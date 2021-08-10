
resource "aws_db_instance" "default" {
	allocated_storage    = 20
	identifier           = "testinstance"
	storage_type         = "gp2"
	engine               = "mysql"
	engine_version       = "5.7"
	instance_class       = "db.t2.micro"
	publicly_accessible  = true
	name                 = "test"
	db_subnet_group_name = "${aws_db_subnet_group.db-subnet.name}"
	username             = var.rds_username
	password             = var.rds_password
	parameter_group_name = "default.mysql5.7"
}

resource "aws_db_subnet_group" "db-subnet" {
	name                 = "db_subnet_group"
	subnet_ids           = ["${aws_subnet.PrivateAZA.id}","${aws_subnet.PrivateAZB.id}"]
}

