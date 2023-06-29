provider "helm" {
  kubernetes {
    host                    = data.azurerm_kubernetes_cluster.aks.kube_config.0.host
    client_certificate      = base64decode(data.azurerm_kubernetes_cluster.aks.kube_config.0.client_certificate)
    client_key              = base64decode(data.azurerm_kubernetes_cluster.aks.kube_config.0.client_key)
    cluster_ca_certificate  = base64decode(data.azurerm_kubernetes_cluster.aks.kube_config.0.cluster_ca_certificate)
  }
}

resource "helm_release" "kafka-connector" {
  for_each  = var.kafka-connectors
  name      = each.value.name
  repository = ""
  chart = "kafka-connector"
  name  = "0.2.3"
  namespace = each.value.namespace
  set {
    name  = "kafkaConnect.Name"
    value = each.value.name
  }
  set {
    name  = "kafkaConnect.kafkaConnectCluster"
    value = each.value.kafkaConnectCluster
  }
  set {
    name  = "kafkaConnect.spec.tasksMax"
    value = each.value.tasksMax
  }
  set {
    name  = "kafkaConnect.spec.config.topics"
    value = each.value.topics
  }
  set {
    name  = "kafkaConnect.spec.config.buffer.countRecords"
    value = each.value.bufferCountRecords
  }
  set {
    name  = "kafkaConnect.spec.config.buffer.flushTime"
    value = each.value.bufferFlushTime
  }
  set {
    name  = "kafkaConnect.spec.config.buffer.sizeBytes"
    value = each.value.bufferSizeBytes
  }
  set {
    name  = "kafkaConnect.spec.config.session.timeoutMs"
    value = each.value.sessionTimeout
  }
  set {
    name  = "kafkaConnect.spec.config.consumer.override.pollIntervalMs"
    value = each.value.consumerOverridePollInterval
  }
  set {
    name  = "kafkaConnect.spec.config.consumer.override.pollRecords"
    value = each.value.consumerOverridePollRecords
  }
  set {
    name  = "kafkaConnect.spec.config.consumer.maxpollRecords"
    value = each.value.consumerMaxPollRecords
  }
  set {
    name  = "kafkaConnect.spec.config.consumer.maxPollIntervalMs"
    value = each.value.consumerMaxPollInterval
  }
  set {
    name  = "kafkaConnect.spec.config.maxpollRecords"
    value = each.value.maxPollRecords
  }
  set {
    name  = "kafkaConnect.spec.config.maxPollIntervalMs"
    value = each.value.maxPollInterval
  }
  set {
    name  = "kafkaConnect.spec.config.snowflake.privateKey"
    value = var.snowflakePrivateKey
  }
  set {
    name  = "kafkaConnect.spec.config.snowflake.passphrase"
    value = var.snowflakePassphrase
  }
  set {
    name  = "kafkaConnect.spec.config.snowflake.databaseName"
    value = each.value.snowflakeDatabase
  }
  set {
    name  = "kafkaConnect.spec.config.snowflake.schemaName"
    value = each.value.snowflakeSchema
  }
  set {
    name  = "kafkaConnect.spec.config.snowflake.urlName"
    value = each.value.snowflakeURL
  }
  set {
    name  = "kafkaConnect.spec.config.snowflake.userName"
    value = each.value.snowflakeUser
  }
  set {
    name  = "kafkaConnect.spec.config.snowflake.map"
    value = each.value.snowflakeMap
  }
}