variable "kubernetesCluster" {
  description = "Target Kubernetes Cluster"
  type        = string
  default     = ""
}

variable "kubernetesClusterRG" {
  description = "Resource Group Hosting Kubernetes Cluster"
  type        = string
  default     = ""
}

variable "snowflakePrivateKey" {
  description = "private key for snowflake"
  type = string
  default = "<ommitted>"
}

variable "snowflakePassphrase" {
  description = "passphrase for snowflake"
  type = string
  default = "<ommitted>"
}

variable "kafka-connectors" {
  type = map(object({
    name                          = string
    namespace                     = string
    kafkaConnectCluster           = string
    tasksMax                      = number
    topics                        = string
    bufferCountRecords            = number
    bufferFlushTime               = number
    bufferSizeBytes               = number
    sessionTimeout                = number
    consumerOverridePollInterval  = number
    consumerOverridePollRecords   = number
    consumerMaxPollInterval       = number
    consumerMaxPollRecords        = number
    maxPollInterval               = number
    maxPollRecords                = number
    snowflakeDatabase             = string
    snowflakeSchema               = string
    snowflakeURL                  = string
    snowflakeUser                 = string
    snowflakeMap                  = string
  }))
}