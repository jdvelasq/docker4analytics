.PHONY: drill
.PHONY: druid
.PHONY: hadoop
.PHONY: hadoop-classroom
.PHONY: hadoop-on-tez
.PHONY: hbase
.PHONY: hive
.PHONY: hive-classroom
.PHONY: hive-on-spark
.PHONY: hive-on-tez
.PHONY: hue
.PHONY: impala
.PHONY: jupyterlab
.PHONY: mariadb
.PHONY: phoenix
.PHONY: pig
.PHONY: pig-classroom
.PHONY: pydruid
.PHONY: sklearn
.PHONY: spark
.PHONY: sphinx
.PHONY: sqoop
.PHONY: superset
.PHONY: techminer2
.PHONY: tensorflow
.PHONY: tensorflow-hdfs
.PHONY: tez
.PHONY: ubuntu
.PHONY: zeppelin
.PHONY: zookeeper


drill:
	docker build --tag=jdvelasq/drill:1.19.0 drill/ 
	docker image prune --force
	echo
	docker image ls


druid:
	docker build --tag=jdvelasq/druid:0.22.1 druid/ 
	docker image prune --force
	echo
	docker image ls

hadoop:
	docker build --tag=jdvelasq/hadoop:2.10.1 hadoop/ 
	docker image prune --force
	echo
	docker image ls	

hadoop-classroom:
	docker build --tag=jdvelasq/hadoop:classroom hadoop-classroom/ 
	docker image prune --force
	echo
	docker image ls	

hbase:
	docker build --tag=jdvelasq/hbase:2.3.0 hbase/ 
	docker image prune --force
	echo
	docker image ls	

hive:
	docker build --tag=jdvelasq/hive:2.3.9 hive/ 
	docker image prune --force
	echo
	docker image ls	

hive-classroom:
	docker build --tag=jdvelasq/hive:classroom hive-classroom/ 
	docker image prune --force
	echo
	docker image ls	

hive-on-spark:
	docker build --tag=jdvelasq/hive-on-spark:2.3.9-3.1.3 hive-on-spark/ 
	docker image prune --force
	echo
	docker image ls	

hive-on-tez:
	docker build --tag=jdvelasq/hive:2.3.9 hive-on-tez/ 
	docker image prune --force
	echo
	docker image ls	

hue:
	docker build --tag=jdvelasq/hue:4.10.0 hue/ 
	docker image prune --force
	echo
	docker image ls	

impala:
	docker build --tag=jdvelasq/impala:3.4.1 impala/	
	docker image prune --force
	echo
	docker image ls	

jupyterlab:
	docker build --tag=jdvelasq/jupyterlab:3.5.2 jupyterlab/	
	docker image prune --force
	echo
	docker image ls	

mariadb:
	docker build --tag=jdvelasq/mariadb:10.3.34 mariadb/	
	docker image prune --force	
	echo
	docker image ls	

pig:
	docker build --tag=jdvelasq/pig:0.17.0 pig/	
	docker image prune --force
	echo
	docker image ls	

pig-classroom:
	docker build --tag=jdvelasq/pig:classroom pig-classroom/	
	docker image prune --force
	echo
	docker image ls	

pydruid:
	docker build --tag=jdvelasq/pydruid:0.22.1 pydruid/	
	docker image prune --force
	echo
	docker image ls	

phoenix:
	docker build --tag=jdvelasq/phoenix:5.1.2 phoenix/	
	docker image prune --force
	echo
	docker image ls	

sklearn:
	docker build --tag=jdvelasq/sklearn:1.2 sklearn/	
	docker image prune --force
	echo
	docker image ls	

spark:
	docker build --tag=jdvelasq/spark:3.1.3 spark/	
	docker image prune --force
	echo
	docker image ls	

sphinx:
	docker build --tag=jdvelasq/sphinx:5.3.0 sphinx/
	docker image prune --force
	echo
	docker image ls	

sqoop:
	docker build --tag=jdvelasq/sqoop:1.4.7 sqoop/
	docker image prune --force	
	echo
	docker image ls	

superset:
	docker build --tag=jdvelasq/superset:1.5.0 superset/
	docker image prune --force
	echo
	docker image ls	

techminer2:
	docker build --no-cache --tag=jdvelasq/techminer2:0.1.0 techminer2/
	docker image prune --force
	echo
	docker image ls	

tensorflow:
	docker build --tag=jdvelasq/tensorflow:2.9.1 tensorflow/
	docker image prune --force
	echo
	docker image ls	

tensorflow-hdfs:
	docker build --tag=jdvelasq/tensorflow-hdfs:2.9.1 tensorflow-hdfs/
	docker image prune --force
	echo
	docker image ls		

tez:
	docker build --tag=jdvelasq/tez:0.7.1 tez/ 
	docker image prune --force
	echo
	docker image ls	

ubuntu:
	docker build --tag=jdvelasq/ubuntu:20.04 ubuntu/
	docker image prune --force
	echo
	docker image ls	

zeppelin:
	docker build --tag=jdvelasq/zeppelin:0.10.1 zeppelin/
	docker image prune --force
	echo
	docker image ls	

zookeeper:
	docker build --tag=jdvelasq/zookeeper:3.7.1 zookeeper/
	docker image prune --force
	echo
	docker image ls	