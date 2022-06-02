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


----------------------------< EMR 5.35 >---------------------------
ubuntu                 718MB


jdvelasq/sklearn                                  1.0.2     7fad9ef65e45   28 hours ago   2.44GB
jdvelasq/hue                                      4.10.0    7b2f97a24e30   38 hours ago   4.87GB
gethue/hue                                        latest    6b61a01097f5   2 days ago     1.91GB
jdvelasq/drill                                    1.19.0    b0e061322f5a   2 days ago     3.73GB
jdvelasq/drill                                    1.20.1    d3cae5225853   2 days ago     4.16GB
jdvelasq/jupyterlab                               3.2.9     ba3b95c9c4cf   4 days ago     1.18GB
jdvelasq/spark                                    3.1.3     2c7dea54e6f2   4 days ago     5.4GB
jdvelasq/tensorflow                               2.9.1     02a2941ec863   4 days ago     4.6GB
jdvelasq/phoenix                                  5.1.2     d0f358346c72   5 days ago     4.82GB
jdvelasq/sphinx                                   3.0.4     6f26f0046696   5 days ago     443MB
jdvelasq/hbase                                    2.3.0     2ab09125ebc7   5 days ago     3.96GB
jdvelasq/zookeeper                                3.7.1     97c79bf190d8   5 days ago     2.93GB
jdvelasq/sqoop                                    1.4.7     8204b5ff104e   5 days ago     3.76GB
jdvelasq/mariadb                                  10.3.34   afc533b3cc20   5 days ago     3.7GB
jdvelasq/hive                                     2.3.9     e2fceee19b62   5 days ago     3.46GB
jdvelasq/pig                                      0.17.0    b80c1aea5fe6   5 days ago     3.46GB
jdvelasq/druid                                    0.22.1    c04ec7c83740   5 days ago     3.73GB
jdvelasq/zeppelin                                 0.10.1    e6c8b786f37a   5 days ago     4.69GB
jdvelasq/hadoop                                   2.10.1    e2ed908edd54   5 days ago     2.88GB
jdvelasq/ubuntu                                   20.04     5df73acde139   5 days ago     718MB
apache/drill                                      latest    c5fa057ba6e8   2 weeks ago    1GB

Hadoop      2.10.1    2.88GB
Zeppelin    0.10.0    4.69GB 
Sqoop       1.4.7     3.76GB
Pig         0.17.0    3.46GB
Hive        2.3.9     3.46GB 
HBase       1.4.13    
Spark       2.4.8     5.4GB
MXNet       1.8.0
Tensorflow  2.4.1
Phoenix     4.14.3    4.82GB
Tez         0.9.2
Oozie       5.2.1
ZooKeeper   3.4.14
Mahout      0.13.0
Hue         4.10.0

----------------------------< EMR 6.6 >---------------------------
Hadoop      3.2.1    
Zeppelin    0.10.0
Sqoop       1.4.7
Pig         0.17.0
Hive        3.1.2    
HBase       2.4.4
Spark       3.2.2
MXNet       1.8.0
Tensorflow  2.4.1
Phoenix     5.1.2
Tez         0.9.2
Oozie       5.2.1
ZooKeeper   3.5.7
Hue         4.10.0

----------------------------< HDP 2.6.5 >---------------------------
Hadoop      2.7.3      
Zeppelin    0.7.3
Sqoop       1.4.6
Pig         0.16.0
Hive        2.1.0    
HBase       1.1.2
Spark       2.3.0
Phoenix     4.7.0
Druid       0.10.1
Tez         0.7.0
Oozie       0.4.2
ZooKeeper   3.4.6
Mahout      0.9.0
Hue         2.6.1

----------------------------< HDP 3.1.5 >---------------------------
Hadoop      3.1.5
Zeppelin    0.8.0
Sqoop       1.4.7
Pig         0.16.0
Hive        3.1.0
HBase       2.1.6
Spark       2.3.2
Phoenix     5.0.0
Druid       0.12.1
Tez         0.9.1
Oozie       4.3.1
ZooKeeper   3.4.6


Sesión 03  ---------------------------------------------------------

MariaDB

Sesión 05  ---------------------------------------------------------

Drill                      -         -        -          -

Sesión 06  ---------------------------------------------------------

Sesión 07  ---------------------------------------------------------


Presto                     0.266     0.2667   -
Trino                      -         367      -          - 


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
Ranger                     -         -        0.7.0      1.2.0
Slider                     -         -        0.92.0     -
Storm                      -         -        -          1.2.1 
Superset                   -         -        Si         0.25








```
