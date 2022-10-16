resource "kubernetes_horizontal_pod_autoscaler" "my-app-autoscaler" {
  metadata {
    name = "my-app-autoscaler"
  }
  
  spec {
    min_replicas = 1
    max_replicas = 3

  
    scale_target_ref {
      api_version = "apps/v1"
      kind = "Deployment"
      name = kubernetes_deployment.deployment-my-app.metadata[0].name
    }
    metric {
      type = "Resource"
      resource {
        name = "cpu"
        target {
          type = "Utilization"
          average_utilization = 50
        }
      }
    }
  }

}