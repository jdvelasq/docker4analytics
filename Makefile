.PHONY: minimal  colab
.PHONY: hadoop  pig  hive  mahout  spark  aws

hdp_version = 2.8.5
pig_version = 0.17.0
hive_version = 2.3.5
mahout_version = 0.13.0
spark_version = 2.3.4

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
colab: 
	docker build --tag=jdvelasq/jupyterlab:colab  colab/

aws:
	docker build --tag=jdvelasq/jupyterlab:aws  \
	             --build-arg  HDP_VERSION=$(hdp_version) \
				 --build-arg  PIG_VERSION=$(pig_version) \
				 --build-arg  HIVE_VERSION=$(hive_version) \
				 --build-arg  MAHOUT_VERSION=$(mahout_version) \
	             --build-arg  SPARK_VERSION=$(spark_version) \	
				 spark/	