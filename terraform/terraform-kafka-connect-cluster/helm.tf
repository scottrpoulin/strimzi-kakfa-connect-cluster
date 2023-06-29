provider "helm" {
  kubernetes {
    host                    = data.azurerm_kubernetes_cluster.aks.kube_config.0.host
    client_certificate      = base64decode(data.azurerm_kubernetes_cluster.aks.kube_config.0.client_certificate)
    client_key              = base64decode(data.azurerm_kubernetes_cluster.aks.kube_config.0.client_key)
    cluster_ca_certificate  = base64decode(data.azurerm_kubernetes_cluster.aks.kube_config.0.cluster_ca_certificate)
  }
}

resource "helm_release" "kafka-connect-cluster" {
  count       = var.deployEnvResource == true ? 1 : 0
  name        = "kafka-connect-cluster"
  repository  = ""
  chart       = "kafka-connect-cluster"
  version     = "1.0.10"
  depends_on  = [
    helm_reelase.kafka-connect-cluster-secrets
  ]

  namespace   = var.namespace
  create_namespace = true
  recreate_pods = true
  force_update = true
  wait = true
  timeout = 600
  set {
    name  = "kafkaConnect.trustStore.password"
    value = var.trustStorePass
  }
  set {
    name  = "kafkaConnect.keyStore.password"
    value = var.keyStorePass
  }
  set {
    name  = "kafkaConnect.Name"
    value = var.connectClusterName
  }
  set {
    name  = "kafkaConnect.offsetStorageTopic"
    value = var.connectOffsetTopic
  }
  set {
    name  = "kafkaConnect.configStorageTopic"
    value = var.connectConfigTopic
  }
  set {
    name  = "kafkaConnect.statusStorageTopic"
    value = var.connectStatusTopic
  }
  set {
    name  = "kafkaConnect.schemaRegistryUrl"
    value = var.connectSchemaRegistryURL
  }
  set {
    name  = "kafkaConnect.converterSchemaRegistryUrl"
    value = var.connectConverterSchemaRegistryURL
  }
  set {
    name  = "kafkaConnect.Image"
    value = var.connectImage
  }
}

resource "helm_release" "kafka-connect-cluster-secrets" {
  count = var.deployEnvResource == true ? 1 : 0
  chart = "kafka-secrets"
  name  = "kafka-connect-cluster-secrets"
  repository = ""
  version = "1.0.0"
  namespace = var.namespace
  create_namespace = true
  recreate_pods = true
  set {
    name  = "secretProvider.namespace"
    value = var.namespace
  }
}