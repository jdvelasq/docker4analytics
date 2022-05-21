# /etc/init.d/ssh start

rm -rf /tmp/hadoop-root/dfs/name

hdfs namenode -format
bash /opt/hadoop/sbin/start-dfs.sh
bash start-yarn.sh
hdfs dfs -mkdir       /tmp
hdfs dfs -chmod 777   /tmp
hdfs dfs -mkdir       /user
hdfs dfs -mkdir       /user/root

# Si se agrega para Apache Pig hadoop muere en la corrida
# mr-jobhistory-daemon.sh start historyserver

echo 
echo ======================================
echo
echo "     --- Hadoop on Tez ---"
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

#########################################################################################

echo 
echo
echo
hdfs dfs -mkdir /apps
hdfs dfs -mkdir /apps/tez
hdfs dfs -copyFromLocal /tmp/tez.tar.gz /apps/tez/tez.tar.gz
hdfs dfs -chmod -R 755 /apps/tez
hdfs dfs -chmod -R 555 /apps/tez
hdfs dfs -chmod -R 444 /apps/tez/tez.tar.gz
echo
echo
echo