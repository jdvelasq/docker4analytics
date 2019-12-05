# /etc/init.d/ssh start

rm -rf /tmp/hadoop-root/dfs/name

hdfs namenode -format
bash /usr/local/hadoop/sbin/start-dfs.sh
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
echo To run Zeppelin:
echo
echo "   bash zeppelin-daemon.sh start"
echo "   http://http://127.0.0.1:8090/"
echo "   bash zeppelin-daemon.sh stop"
echo 
echo ======================================