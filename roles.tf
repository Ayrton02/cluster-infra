resource "kubernetes_role" "manager_role" {
  metadata {
    name = "manager-role"
    namespace = "default"
  }

  rule {
    api_groups = ["*"] 
    verbs = ["*"]
    resources = [ "*" ]
  }
}

resource "kubernetes_role_binding" "manager_role_binding" {
  metadata {
    name = "manager-role-biding"
  }

  subject {
    name = "default"
    kind = "ServiceAccount"
    namespace = "default"
  }

  role_ref {
    kind = "Role"
    api_group = "rbac.authorization.k8s.io"
    name = "manager-role"
  }

}

resource "kubernetes_cluster_role" "manager_cluster_role" {
  metadata {
    name = "manager-cluster-role"
  }

  rule {
    api_groups = [""] 
    verbs = ["get", "watch", "list"]
    resources = [ "nodes" ]
  }
}


resource "kubernetes_cluster_role_binding" "manager_cluster_role_binding" {
  metadata {
    name = "manager-cluster-role-biding"
  }

  subject {
    name = "default"
    kind = "ServiceAccount"
  }

  role_ref {
    kind = "ClusterRole"
    api_group = "rbac.authorization.k8s.io"
    name = "manager-cluster-role"
  }
}