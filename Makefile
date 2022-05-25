.PHONY: druid
.PHONY: hadoop
.PHONY: hadoop-on-tez
.PHONY: hbase
.PHONY: hive
.PHONY: hive-on-spark
.PHONY: hive-on-tez
.PHONY: impala
.PHONY: jupyterlab
.PHONY: mariadb
.PHONY: pig
.PHONY: phoenix
.PHONY: sklearn
.PHONY: spark
.PHONY: sphinx
.PHONY: sqoop
.PHONY: superset
.PHONY: techminer2
.PHONY: tensorflow
.PHONY: tez
.PHONY: ubuntu
.PHONY: zeppelin
.PHONY: zookeeper

druid:
	docker build --tag=jdvelasq/druid:0.22.1 druid/ 
	docker image prune --force

hadoop:
	docker build --tag=jdvelasq/hadoop:2.10.1 hadoop/ 
	docker image prune --force

hbase:
	docker build --tag=jdvelasq/hbase:2.3.0 hbase/ 
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

mariadb:
	docker build --tag=jdvelasq/mariadb:10.3.34 mariadb/	
	docker image prune --force	

pig:
	docker build --tag=jdvelasq/pig:0.17.0 pig/	
	docker image prune --force

phoenix:
	docker build --tag=jdvelasq/phoenix:5.1.2 phoenix/	
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
	docker build --tag=jdvelasq/tez:0.7.1 tez/ 
	docker image prune --force


ubuntu:
	docker build --tag=jdvelasq/ubuntu:20.04 ubuntu/
	docker image prune --force

zeppelin:
	docker build --tag=jdvelasq/zeppelin:0.10.1 zeppelin/
	docker image prune --force

zookeeper:
	docker build --tag=jdvelasq/zookeeper:3.7.1 zookeeper/
	docker image prune --force