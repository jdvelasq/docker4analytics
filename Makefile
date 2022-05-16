.PHONY: hadoop
.PHONY: jupyterlab
.PHONY: sphinx
.PHONY: ubuntu

hadoop:
	docker build --tag=jdvelasq/hadoop:2.10.1 hadoop/ 
	docker image prune --force

jupyterlab:
	docker build --tag=jdvelasq/jupyterlab:3.2.9 jupyterlab/	
	docker image prune --force

sphinx:
	docker build --tag=jdvelasq/sphinx:3.0.4 sphinx/
	docker image prune --force

ubuntu:
	docker build --tag=jdvelasq/ubuntu:20.04 ubuntu/
	docker image prune --force