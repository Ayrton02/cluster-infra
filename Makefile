build:
	docker build -t my-app ./my-app

plan: build
	terraform plan

apply: 
	terraform apply -auto-approve
	make install-metrics

destroy:
	terraform destroy -auto-approve

proxy:
	kubectl proxy --port=8001

install-metrics:
	helm upgrade --install metrics-server metrics-server/metrics-server \
	--create-namespace --namespace metrics-server \
	--set apiService.create=true \
	--set args={--kubelet-insecure-tls}

uninstall-metrics:
	helm uninstall metrics-server -n metrics-server