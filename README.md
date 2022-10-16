# Terraform

Esse projeto tem como intuito construir a infra necessária para rodar o projeto dentro do Cluster Kubernetes

São criadas os seguintes recursos

* Deployment
* ClusterIP
* NodePort
* Role
* RoleBiding

## Deployment

Deployment é um recurso do Kubernetes que permite realizar o controle de réplicas da aplicação e também facilita o versionamento da aplicação.

## Role

Série de configurações necessárias para que o Pod possa ter acesso a API do Kubernetes.