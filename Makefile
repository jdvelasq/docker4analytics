.PHONY: hadoop
.PHONY: hadoop-on-tez
.PHONY: hbase
.PHONY: hive
.PHONY: hive-on-spark
.PHONY: hive-on-tez
.PHONY: impala
.PHONY: jupyterlab
.PHONY: pig
.PHONY: sklearn
.PHONY: spark
.PHONY: sphinx
.PHONY: sqoop
.PHONY: superset
.PHONY: techminer2
.PHONY: tensorflow
.PHONY: ubuntu
.PHONY: zeppelin


hadoop:
	docker build --tag=jdvelasq/hadoop:2.10.1 hadoop/ 
	docker image prune --force

hbase:
	docker build --tag=jdvelasq/hbase:2.4.12 hbase/ 
	docker image prune --force

hive:
	docker build --tag=jdvelasq/hive:2.3.9 hive/ 
	docker image prune --force

hive-on-spark:
	docker build --tag=jdvelasq/hive-on-spark:2.3.9-3.1.3 hive-on-spark/ 
	docker image prune --force

hive-on-tez:
	docker build --tag=jdvelasq/hive:2.3.9 hive-on-tez/ 
	docker image prune --force

impala:
	docker build --tag=jdvelasq/impala:3.4.1 impala/	
	docker image prune --force

jupyterlab:
	docker build --tag=jdvelasq/jupyterlab:3.2.9 jupyterlab/	
	docker image prune --force

pig:
	docker build --tag=jdvelasq/pig:0.17.0 pig/	
	docker image prune --force

sklearn:
	docker build --tag=jdvelasq/sklearn:1.0.2 sklearn/	
	docker image prune --force

spark:
	docker build --tag=jdvelasq/spark:3.1.3 spark/	
	docker image prune --force

sphinx:
	docker build --tag=jdvelasq/sphinx:3.0.4 sphinx/
	docker image prune --force

sqoop:
	docker build --tag=jdvelasq/sqoop:1.4.7 sqoop/
	docker image prune --force	

superset:
	docker build --tag=jdvelasq/superset:1.5.0 superset/
	docker image prune --force

techminer2:
	docker build --tag=jdvelasq/techminer2:0.0.0 techminer2/
	docker image prune --force

tensorflow:
	docker build --tag=jdvelasq/tensorflow:2.8 tensorflow/
	docker image prune --force

tez:
	docker build --tag=jdvelasq/tez:0.9.2 tez/ 
	docker image prune --force


ubuntu:
	docker build --tag=jdvelasq/ubuntu:20.04 ubuntu/
	docker image prune --force

zeppelin:
	docker build --tag=jdvelasq/zeppelin:0.10.1 zeppelin/
	docker image prune --force