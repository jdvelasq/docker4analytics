.PHONY: minimal  colab
.PHONY: hadoop  pig  hive  mahout  spark  
.PHONY: pyspark spark-r-base sparkr sparklyr spark-in-r
.PHONY: aws

hdp_version = 2.8.5
pig_version = 0.17.0
hive_version = 2.3.5
mahout_version = 0.13.0
spark_version = 2.4.3

minimal:
	docker build --tag=jdvelasq/jupyterlab:minimal  minimal/


hadoop:
	docker build --tag=jdvelasq/jupyterlab:hadoop  \
	             --build-arg  HDP_VERSION=$(hdp_version) \
				 hadoop/	

pig:
	docker build --tag=jdvelasq/jupyterlab:pig  \
	             --build-arg  PIG_VERSION=$(pig_version) \
				 pig/	

mahout:
	docker build --tag=jdvelasq/jupyterlab:mahout  \
	             --build-arg  MAHOUT_VERSION=$(mahout_version) \
				 mahout/	
hive:
	docker build --tag=jdvelasq/jupyterlab:hive  \
	             --build-arg  HIVE_VERSION=$(hive_version) \
				 hive/	

spark:
	docker build --tag=jdvelasq/jupyterlab:spark  \
	             --build-arg  SPARK_VERSION=$(spark_version) \
				 spark/	

pyspark:
	docker build --tag=jdvelasq/jupyterlab:pyspark  \
				 pyspark/	

spark-r-base:
	docker build --tag=jdvelasq/jupyterlab:spark-r-base  \
				 spark-r-base/	

sparkr:
	docker build --tag=jdvelasq/jupyterlab:sparkr  \
				 sparkR/	

sparklyr:
	docker build --tag=jdvelasq/jupyterlab:sparklyr  \
				 sparklyr/	

spark-on-r:
	docker build --tag=jdvelasq/jupyterlab:spark-on-r  \
				 spark-on-r/	



colab: 
	docker build --tag=jdvelasq/jupyterlab:colab  colab/

aws:
	docker build --tag=jdvelasq/jupyterlab:aws  \
				 --build-arg  PIG_VERSION=$(pig_version) \
				 --build-arg  HIVE_VERSION=$(hive_version) \
				 --build-arg  MAHOUT_VERSION=$(mahout_version) \
	             --build-arg  SPARK_VERSION=$(spark_version) \
				 aws/