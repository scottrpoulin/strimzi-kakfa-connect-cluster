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

variable "namespace" {
  description = "namespace where connect cluster should be deployed"
  type = string
  default = "strimzi-kafka-operator"
}

variable "keyStorePass" {
  description = "Keystore password value set in release pipeline"
  type = string
  default = "ommitted"
}

variable "trustStorePass" {
  description = "Truststore Password, value set in release pipeline"
  type = string
  default = "ommitted"
}

variable "connectClusterName" {
  description = "Connect Cluster Name to be Deployed"
  type = string
}

variable "connectOffsetTopic" {
  description = "Kafka Connect Internal Offset Topic"
  type = string
}

variable "connectConfigTopic" {
  description = "Kafka Connect Internal Config Topic"
  type = string
}

variable "connectStatusTopic" {
  description = "Kafka Connect Internal Status Topic"
  type = string
}

variable "connectSchemaRegistryURL" {
  description = "Kafka Connect Schema Registry URL must included port 443"
  type = string
}

variable "connectConverterSchemaRegistryURL" {
  description = "Converter Schema Registry URL without port"
  type = string
}

variable "connectImage" {
  description = "Kafka Connect Image"
  type = string
}

variable "deployEnvResource" {
  type = bool
  default = false
}