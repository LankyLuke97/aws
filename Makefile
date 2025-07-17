.PHONY: run_blog stop_blog create_local_registry build_html
REGISTRY := $(shell minikube ip):30500

publish_blog: build_html
	eval $$(minikube docker-env) && docker build --tag test .
	kubectl rollout restart deployment blog-deployment -n development

run_blog: build_html
	docker build --tag test .
	docker run -d -p 8080:80 --name test-nginx test

stop_blog:
	docker stop test-nginx || true
	docker rm test-nginx || true

create_local_registry:
	mkdir -p registry/storage && \
	if docker ps | grep -q 'local-registry'; \
	then echo "---> local-registry already created, skipping"; \
	else docker run --name local-registry -d --restart=always -p 5000:5000 --mount type=bind,src=$$(pwd)/registry/storage,dst=/var/lib/registry -e REGISTRY_HTTP_ADDR=0.0.0.0:5000 registry:2; \
	fi 

build_html:
	mkdir -p static-html/data
	for md in $$(ls static-html/markdown/*.md); do \
		html_file=$$(basename $$md .md); \
		python -m markdown $$md > static-html/data/$$html_file.html; \
	done
	cp static-html/markdown/index.html static-html/data/index.html

teardown_cluster:
	minikube stop && minikube delete

create_cluster:
	minikube start --insecure-registry=192.168.49.2:30500
	# echo '{"insecure-registries":["192.168.49.2:30500"], "exec-opts":["native.cgroupdriver=cgroupfs"], "log-driver":"json-file", "log-opts":{"max-size":"100m"}, "storage-driver":"overlay2"}' > tmp-daemon.json
	# minikube cp tmp-daemon.json minikube:/tmp/daemon.json
	# minikube ssh "sudo mv /tmp/daemon.json /etc/docker/daemon.json && sudo systemctl restart docker"
	kubectl apply -f kube/namespace.yaml
	kubectl apply -f kube/registry.yaml
	kubectl apply -f kube/deployment.yaml
	kubectl apply -f kube/load_balancer.yaml
