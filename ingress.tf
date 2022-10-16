# resource "kubernetes_ingress" "nginx-ingress" {
#   metadata {
#     name = "nginx-ingress"
#     annotations = {
#       "kubernetes.io/ingress.class" = "nginx"
#     }
#   }
#   spec {
#     rule {
#       http {
#         path {
#           path = "/*"
#           backend {
#             service_name = kubernetes_service.nodeport-manager.metadata.0.name
#             service_port = 8080
#           }
#         }
#       }
#     }
#   }
# }