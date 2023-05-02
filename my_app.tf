provider "kubernetes" {
  config_path = "~/.kube/config"
}

resource "kubernetes_deployment" "deployment-my-app" {
  metadata {
    name = "deployment-my-app"
    labels = var.app-label
  }

  spec {
    replicas = 1
    selector {
      match_labels = var.app-label
    }

    template {
      metadata {
        labels = var.app-label
      }

      spec {
        container {
          name              = "app"
          image             = "my-app:latest"
          image_pull_policy = "IfNotPresent"
          port {
            container_port = 8080
          }
          resources {
            requests = {
              "cpu" = "0.5"
            }
          }
        }
      }
    }
  }
}


resource "kubernetes_service" "clusterip-my-app" {
  metadata {
    name = "my-app"
  }

  spec {
    selector = var.app-label
    type     = "ClusterIP"
    port {
      port        = 8080
      target_port = 8080
    }
  }
}
