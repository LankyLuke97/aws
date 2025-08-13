.PHONY: run_blog stop_blog create_local_registry build_html 

publish_blog: build_html
	eval $$(minikube -p minikube docker-env) && docker build --tag test .
	minikube kubectl -- rollout restart deployment blog-deployment -n development

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
		/home/lhowden/.local/python/bin/python3 -m markdown $$md > static-html/data/$$html_file.html; \
	done
	cp static-html/markdown/index.html static-html/data/index.html

teardown_cluster:
	minikube stop && minikube delete

create_cluster:
	minikube start --insecure-registry=192.168.49.2:30500 --driver=docker
	# echo '{"insecure-registries":["192.168.49.2:30500"], "exec-opts":["native.cgroupdriver=cgroupfs"], "log-driver":"json-file", "log-opts":{"max-size":"100m"}, "storage-driver":"overlay2"}' > tmp-daemon.json
	# minikube cp tmp-daemon.json minikube:/tmp/daemon.json
	# minikube ssh "mv /tmp/daemon.json /etc/docker/daemon.json && systemctl restart docker"
	minikube kubectl -- apply -f kube/namespace.yaml
	minikube kubectl -- apply -f kube/registry.yaml
	minikube kubectl -- apply -f kube/deployment.yaml
	minikube kubectl -- apply -f kube/load_balancer.yaml

install_minikube:
	curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb
	dpkg -i minikube_latest_amd64.deb

install_docker:
	for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do apt-get remove "$${pkg}"; done
	apt-get update
	apt-get install ca-certificates curl
	install -m 0755 -d /etc/apt/keyrings
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
	chmod a+r /etc/apt/keyrings/docker.asc

	# Add the repository to Apt sources:
	echo \
	  "deb [arch=$$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
	  $$(. /etc/os-release && echo "$${UBUNTU_CODENAME:-$$VERSION_CODENAME}") stable" | \
	  tee /etc/apt/sources.list.d/docker.list > /dev/null
	apt-get update
	apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin	
