.PHONY: hadoop
.PHONY: hive
.PHONY: jupyterlab
.PHONY: pig
.PHONY: sphinx
.PHONY: ubuntu
.PHONY: zeppelin


hadoop:
	docker build --tag=jdvelasq/hadoop:2.10.1 hadoop/ 
	docker image prune --force

hive:
	docker build --tag=jdvelasq/hive:2.3.9 hive/ 
	docker image prune --force

jupyterlab:
	docker build --tag=jdvelasq/jupyterlab:3.2.9 jupyterlab/	
	docker image prune --force

pig:
	docker build --tag=jdvelasq/pig:0.17.0 pig/	
	docker image prune --force

sphinx:
	docker build --tag=jdvelasq/sphinx:3.0.4 sphinx/
	docker image prune --force

ubuntu:
	docker build --tag=jdvelasq/ubuntu:20.04 ubuntu/
	docker image prune --force

zeppelin:
	docker build --tag=jdvelasq/zeppelin:0.10.1 ubuntu/
	docker image prune --force