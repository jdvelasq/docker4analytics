---+ python:3.6.9-minimal
   +--- python:3.6.9-ml
   \--- hadoop:2.8.5-pseudo
        +--- hadoop:2.8.5-standalone
        +--- hive:2.3.6-pseudo
        |    +--- hive:2.3.6-standalone
        +--- mahout:0.13.0-pseudo 
        |    +--- mahout:0.13.0-standalone
        +--- pig:0.17.0-pseudo
        |    +--- pig:0.17.0-standalone
        +--- spark:2.4.4-pseudo
             +--- pyspark:2.4.4-pseudo
                  +--- pyspark:2.4.4-standalone


cd python/minimal && docker build --tag=jdvelasq/python:3.6.9-minimal .
cd ../ml && docker build --tag=jdvelasq/python:3.6.9-ml . && cd ../..
cd hadoop/pseudo && docker build --tag=jdvelasq/hadoop:2.8.5-pseudo . 
cd ../standalone && docker build --tag=jdvelasq/hadoop:2.8.5-standalone .
cd hive/pseudo && docker build --tag=jdvelasq/hive:2.3.6-pseudo .
cd ../standalone && docker build --tag=jdvelasq/hive:2.3.6-standalone . && cd ../..

cd mahout/pseudo && docker build --tag=jdvelasq/mahout:0.13.0-pseudo . && cd ../standalone && docker build --tag=jdvelasq/mahout:0.13.0-standalone . && cd ../..

cd pig/pseudo && docker build --tag=jdvelasq/pig:0.17.0-pseudo . && cd ../standalone && docker build --tag=jdvelasq/pig:0.17.0-standalone . && cd ../..

cd spark/pseudo && docker build --tag=jdvelasq/spark:2.4.4-pseudo . 

cd pyspark/pseudo && docker build --tag=jdvelasq/pyspark:2.4.4-pseudo . && cd ../standalone && docker build --tag=jdvelasq/pyspark:2.4.4-standalone . && cd ../..


docker push jdvelasq/python:3.6.9-minimal
docker push jdvelasq/python:3.6.9-ml
docker push jdvelasq/hadoop:2.8.5-standalone
docker push jdvelasq/hive:2.3.6-pseudo 
docker push jdvelasq/hive:2.3.6-standalone
docker push jdvelasq/mahout:0.13.0-pseudo 
docker push jdvelasq/mahout:0.13.0-standalone 
docker push jdvelasq/pig:0.17.0-pseudo
docker push jdvelasq/pig:0.17.0-standalone 
docker push jdvelasq/spark:2.4.4-pseudo 
docker push jdvelasq/pyspark:2.4.4-pseudo 
docker push jdvelasq/pyspark:2.4.4-standalone
