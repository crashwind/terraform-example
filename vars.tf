variable "Mongo_host_address" {
    type = list(string)
    description = "mongo hosts ip addresses"
    default = ["10.0.0.101", "10.0.0.102", "10.0.0.103"]
}
