# Package releases


```
.
|___ apache/ubuntu 20.04                                  718MB      
     |___ jupyterlab 3.2.9                                1.18GB
          |___ sklearn 1.0.2                             
          |    |___ tensorflow 2.9.1                      
          |    |___ mxnet
          |    \___ techminer2
          |
          \___ hadoop 2.10.1                              2.88GB
               |___ drill 1.19.0                          3.73GB
               |___ zeppelin 0.10.1                       4.69GB
               |___ druid 0.22.1                          3.73GB
               |    \___ pydruid                          
               |___ tensorflow-hdfs                       
               |___ mxnet-hdfs
               |___ spark 3.1.3                           5.23GB
               |___ pig 0.17.0                            3.46GB
               |___ hive 2.3.9                            3.76GB
               |    \___ hue
               |
               |___ mariadb 10.3.34                       3.7GB
               |    |___ sqoop 1.4.7                      3.76GB
               |
               |___ zookeeper 3.7.1                       2.93GB                         
                    |___ hbase 2.3.0                      3.96GB
                         \___ phoenix 5.1.2     
                    
                                   
                                              
                                        |___ trino 381

https://127.0.0.1:8047/storage.                 

docker push jdvelasq/ubuntu:20.03 \
&& docker push jdvelasq/jupyterlab:3.2.9 \
&& docker push jdvelasq/hadoop:2.10.1 \
&& docker push jdvelasq/zeppelin:0.10.1 \
&& docker push jdvelasq/druid:0.22.1 \
&& docker push jdvelasq/spark:3.1.3 \
&& docker push jdvelasq/pig:0.17.0 \
&& docker push jdvelasq/zookeper:3.7.1 \
&& docker push jdvelasq/hbase:2.3.0 \
&& docker push jdvelasq/phoenix:5.1.2


update pig 0.17.0 to hadoop 2.10.1
update spark 3.1.3 to hadoop 2.10.1
update hive 2.3.9 to hadoop 2.10.1
update mariadb 10.3.34 to hadoop 2.10.1
update sqoop 1.4.7 to hadoop 2.10.1
update zookeeper 3.7.1 to hadoop 2.10.1
update hbase 2.3.0 to hadoop 2.10.1
update phoenix 5.1.2 to hadoop 2.10.1

tez 0.7.1 2.98GB
** pydruid
                   
PySpark + MySQL
casandra


Name        Distribution
----------------------------------------------------------------------------------------

            Curso          EMR 5.35  EMR 6.6  HDP 2.6.5  HDP 3.1.5

Sesión 03  ---------------------------------------------------------

Hadoop      2.10.1         2.10.1    3.2.1    2.7.3      3.1.5

Sesión 04  ---------------------------------------------------------

Zeppelin    0.10.1         0.10.0    0.10.0   0.7.3      0.8.0
MariaDB
Sqoop                      1.4.7     1.4.7    1.4.6      1.4.7
Pig         0.17.0         0.17.0    0.17.0   0.16.0     0.16.0

Sesión 05  ---------------------------------------------------------

Drill                      -         -        -          -
Druid       0.22.1         -         -        0.10.1     0.12.1

Hive        2.3.9          2.3.9     3.1.2    2.1.0      3.1.0

Sesión 06  ---------------------------------------------------------

HBase                      1.4.13    2.4.4    1.1.2      2.1.6
Phoenix                    4.14.3    5.1.2    4.7.0      5.0.0


Sesión 07  ---------------------------------------------------------

Spark       3.1.3          2.4.8     3.2.2    2.3.0      2.3.2

Sesión 08  ---------------------------------------------------------

Spark

------------------------------< end >-------------------------------

MXNet                      1.8.0     1.8.0    -          -

Tensorflow  2.9.1          2.4.1     2.4.1    -          -


Presto                     0.266     0.2667   -
Trino                      -         367      -          - 
Tez                        0.9.2     0.9.2    0.7.0      0.9.1
Hue                        4.10.0    4.10.0   2.6.1      -

ZooKeeper                  3.4.14    3.5.7    3.4.6      3.4.6
Acummulo                   -         -        1.7.0      1.7.0
Ambari                     -         -        2.6.2      2.7.5 
Atlas                      -         -        0.8.0      2.0
Calcite                    -         -        1.2.0      1.16.0
Cascading                  -         -        3.0.0      -
DataFu                     -         -        1.3.0      1.3.0
Falcon                     -         -        0.10.0     -
Flink                      1.14.2    1.14.2   -          -
Flume                      -         -        1.5.2      -
Ganglia                    3.7.2     3.7.2    -          -
HCatalog                   2.3.9     3.1.2    -          -
Hudi                       0.9.0     0.10.1   -          -
Kafka                      -         -        1.0.0      2.0.0
Knox                       -         -        0.12.0     1.0.0
Livy                       0.7.1     0.7.1    0.4        0.5
Mahout                     0.13.0    -        0.9.0      -
Oozie                      5.2.1     5.2.1    0.4.2      4.3.1
Ranger                     -         -        0.7.0      1.2.0
Slider                     -         -        0.92.0     -
Storm                      -         -        -          1.2.1 
Superset                   -         -        Si         0.25





```
