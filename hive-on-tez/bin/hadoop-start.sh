/etc/init.d/ssh start

rm -rf /tmp/hadoop-root/dfs/name

hdfs namenode -format
bash /opt/hadoop/sbin/start-dfs.sh
bash start-yarn.sh
hdfs dfs -mkdir       /tmp
hdfs dfs -chmod 777   /tmp
hdfs dfs -mkdir       /user
hdfs dfs -mkdir       /user/root

echo 
echo ======================================
echo
echo "     --- Hadoop on Tez ---"
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

#########################################################################################

echo 
echo
echo
hdfs dfs -mkdir /apps
hdfs dfs -mkdir /apps/tez
hdfs dfs -copyFromLocal /tmp/tez.tar.gz /apps/tez/tez.tar.gz
echo
echo
echo