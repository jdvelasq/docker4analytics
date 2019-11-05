/etc/init.d/ssh start

rm -rf /tmp/hadoop-root/dfs/name

hdfs namenode -format
bash /usr/local/hadoop/sbin/start-dfs.sh
bash start-yarn.sh
mr-jobhistory-daemon.sh start historyserver
hdfs dfs -mkdir       /tmp
hdfs dfs -chmod 777   /tmp
hdfs dfs -mkdir       /user
hdfs dfs -mkdir       /user/root

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
