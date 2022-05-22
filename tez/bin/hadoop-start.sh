rm -rf /tmp/hadoop-root/dfs/name

hdfs namenode -format
bash /opt/hadoop/sbin/start-dfs.sh

hdfs dfs -mkdir       /tmp
hdfs dfs -chmod 777   /tmp
hdfs dfs -mkdir       /user
hdfs dfs -mkdir       /user/root

hdfs dfs -mkdir -p /apps/tez
hdfs dfs -copyFromLocal /opt/tez/share/tez-0.7.1.tar.gz /apps/tez/
bash start-yarn.sh

echo 
echo =========== Hadoop on Tez ===========
echo
echo Hadoop NameNode at:
echo 
echo "    http://127.0.0.1:50070/"
echo
echo Yarn ResourceManager at:
echo
echo "     http://127.0.0.1:8088/"
echo 
echo =====================================
echo

