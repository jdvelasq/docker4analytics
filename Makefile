.PHONY: minimal  
.PHONY: hadoop  pig  hive  mahout  spark  
.PHONY: pyspark spark-on-r
.PHONY: jupyterlab

hdp_version = 2.8.5
pig_version = 0.17.0
hive_version = 2.3.5
mahout_version = 0.13.0
spark_version = 2.4.3

minimal:
	docker build --tag=jdvelasq/jupyterlab:minimal-2019-2  minimal/

hadoop:
	docker build --tag=jdvelasq/hadoop:$(hdp_version)  \
	             --build-arg  HDP_VERSION=$(hdp_version) \
				 hadoop/	

hive:
	docker build --tag=jdvelasq/hive:$(hive_version)  \
	             --build-arg  HIVE_VERSION=$(hive_version) \
				 hive/	
mahout:
	docker build --tag=jdvelasq/mahout:$(mahout_version)  \
	             --build-arg  MAHOUT_VERSION=$(mahout_version) \
				 mahout/	

pig:
	docker build --tag=jdvelasq/pig:$(pig_version)  \
	             --build-arg  PIG_VERSION=$(pig_version) \
				 pig/	

spark:
	docker build --tag=jdvelasq/spark:$(spark_version)  \
	             --build-arg  SPARK_VERSION=$(spark_version) \
				 spark/	

pyspark:
	docker build --tag=jdvelasq/pyspark:$(spark_version)  \
				 pyspark/	

spark-on-r:
	docker build --tag=jdvelasq/spark-on-r:$(spark_version)  \
				 spark-on-r/	

jupyterlab: 
	docker build --tag=jdvelasq/jupyterlab:2019-2  jupyterlab/


