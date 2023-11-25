variable REGION {
  default = "us-east-1" 
}

variable AMIs {
    type = map(string)
    default = {
        us-east-1 = "ami-0fc5d935ebf8bc3bc"
        us-east-2 = "ami-0a91cd140a1fc148a"
        us-west-1 = "ami-0bdb828fd58c52235"
        us-west-2 = "ami-0bdb828fd58c52235"
    }
}
