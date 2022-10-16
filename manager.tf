resource "kubernetes_deployment" "deployment-manager-app" {
  metadata {
    name   = "manager-app"
    labels = var.manager-app-label
  }

  spec {
    selector {
      match_labels = var.manager-app-label
    }
    template {
      metadata {
        labels = var.manager-app-label
      }
      spec {
        container {
          name              = "app"
          image             = "manager-server:latest"
          image_pull_policy = "Never"
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
    selector = var.manager-app-label
    type     = "NodePort"
    port {
      port        = 8080
      target_port = 8080
      node_port = 30000
    }
  }
}