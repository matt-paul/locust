provider "kubernetes" {}

resource "kubernetes_namespace" "load-test-namespace" {
  metadata {
    name = "load-test-namespace"
  }
}

resource "kubernetes_pod" "locust" {
  metadata {
    name = "locust"
  }
  spec {
    container {
      image = "gcr.io/locust-load-testing-123/myapp"
      name  = "locust"
      args = ["-listen=:80", "-text='Hello World'"]
      port {
        container_port = 80
      } 
    } 
  } 
}

resource "kubernetes_service" "locust" {
  metadata {
    name = "locust"
  }
  spec {
    port {
      port        = 80
      target_port = 80
    }
    type = "LoadBalancer"
  } 
}

output "lb_ip" {
  value = "${kubernetes_service.locust.load_balancer_ingress.0.ip}"
}
