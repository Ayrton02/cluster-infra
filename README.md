# Infra

Esse projeto tem como intuito construir a infra necessária para rodar o projeto [cluster-service](https://github.com/Ayrton02/cluster-service) dentro do Cluster Kubernetes.
O projeto possui uma API (My App) que servirá para os testes.

São criadas os seguintes recursos:

* Deployment
* ClusterIP
* NodePort
* Role
* RoleBiding

## Deployment

[Deployment](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/) é um recurso do Kubernetes que permite realizar o controle de réplicas da aplicação e também facilita o versionamento da aplicação.

## Role

[Role](https://kubernetes.io/docs/reference/access-authn-authz/rbac/) é uma série de configurações necessárias para que o Pod possa ter acesso a API do Kubernetes.

## ClusterIP

[ClusterIP](https://kubernetes.io/docs/concepts/services-networking/service/) é um serviço do Kubernetes que permite a comunicação entre Pods por dentro do Cluster.

## NodePort

[NodePort](https://kubernetes.io/docs/concepts/services-networking/service/#type-nodeport) é um serviço que permite acesso ao Node externamente.

## Rolebiding

[Rolebiding](https://kubernetes.io/docs/reference/access-authn-authz/rbac/) aplica as configurações criadas por um Role a um namespace.

# Como executar

É recomendado utilizar um ambiente Linux para execução do projeto.

Para executar o projeto é necessário a instalação das seguintes ferramentas: 

* [Make](https://www.gnu.org/software/make/)
* [Docker](https://www.docker.com/)
* [Kubernetes](https://kubernetes.io/)
* [Helm](https://helm.sh/)
* [Terraform](https://www.terraform.io/)

Antes de executar os comandos, certifique-se que foram realizadas todas as configurações e a imagem do [cluster-service](https://github.com/Ayrton02/cluster-service) foi construída.


```sh
$ make plan
```

```sh
$ make apply
```

Para destruir a infra execute o comando:

```sh
$ make destroy
```