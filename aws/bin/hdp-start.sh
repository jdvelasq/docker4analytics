/etc/init.d/ssh start

rm -rf /tmp/hadoop-root/dfs/name

hdfs namenode -format
bash /usr/local/hadoop/sbin/start-dfs.sh
bash start-yarn.sh
hdfs dfs -mkdir       /tmp
hdfs dfs -chmod 777   /tmp
hdfs dfs -mkdir       /user
hdfs dfs -mkdir       /user/root

hdfs dfs -mkdir       /tmp/hive
hdfs dfs -mkdir       /user/hive
hdfs dfs -mkdir       /user/hive/warehouse
hdfs dfs -chmod 777   /tmp/hive
hdfs dfs -chmod 777   /user/hive/
hdfs dfs -chmod 777   /user/hive/warehouse

schematool -dbType derby -initSchema

echo 
echo ======================================
echo
echo Hadoop NameNode at:
echo 
echo "    http://127.0.0.1:50070/"
echo
echo Yarn ResourceManager at:
echo
echo "     http://127.0.0.1:8088/"
echo 
echo ======================================
echo
