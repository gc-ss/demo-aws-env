availability_zones = ["us-west-2a","us-west-2b"]

vpc_facts = {
    name = "demo"
    cidr = "192.168.0.0/16"

    }

public_subnets = ["192.168.10.0/24", "192.168.20.0/24"]
private_subnets = ["192.168.30.0/24"]
