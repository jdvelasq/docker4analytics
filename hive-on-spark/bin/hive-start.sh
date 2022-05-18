hdfs dfs -mkdir       /tmp/hive
hdfs dfs -mkdir       /user/hive
hdfs dfs -mkdir       /user/hive/warehouse

hdfs dfs -chmod 777   /tmp/hive
hdfs dfs -chmod 777   /user/hive/
hdfs dfs -chmod 777   /user/hive/warehouse

schematool -dbType derby -initSchema