resource "kubernetes_deployment" "deployment-cluster-service" {
  metadata {
    name   = "cluster-service"
    labels = var.cluster-service-label
  }

  spec {
    selector {
      match_labels = var.cluster-service-label
    }
    template {
      metadata {
        labels = var.cluster-service-label
      }
      spec {
        container {
          name              = "app"
          image             = "ayrtonborges2/cluster-service:2023-05-02.544128"
          image_pull_policy = "IfNotPresent"
          port {
            container_port = 8080
          }
          env {
            name = "NAMESPACE"
            value = "default"
          }

          env {
            name = "METRICS_NAMESPACE"
            value = "metrics-server"
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "nodeport-manager" {
  metadata {
    name = "manager"
  }

  spec {
    selector = var.cluster-service-label
    type     = "NodePort"
    port {
      port        = 8080
      target_port = 8080
      node_port = 30000
    }
  }
}