variable "Mongo_host_address" {
    type = list(string)
    description = "mongo hosts ip addresses"
    default = ["10.10.0.101", "10.10.0.102", "10.10.0.103"]
}
