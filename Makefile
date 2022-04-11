sphinx:
	docker build --tag=jdvelasq/sphinx:3.0.4 \
		01-sphinx/

jupyterlab:
	docker build --tag=jdvelasq/jupyterlab:3.2.9 \
		02--jupyterlab/	

sklearn:
	docker build --tag=jdvelasq/sklearn:1.0.2 \
		03--sklearn/	

tensorflow:
	docker build --tag=jdvelasq/tensorflow:2.8 \
		04--tensorflow/	

techminer2:
	docker build --tag=jdvelasq/techminer2:0.0.0 \
		05--techminer2/	

hadoop:
	docker build --tag=jdvelasq/hadoop:2.8.5 \
		06--hadoop/

hive:
	docker build --tag=jdvelasq/hive:2.3.5 \
		07--hive/

pig:
	docker build --tag=jdvelasq/pig:0.17.0 \
		08--pig/

pyspark:
	docker build --tag=jdvelasq/pyspark:3.1.3 \
		09--pyspark/
