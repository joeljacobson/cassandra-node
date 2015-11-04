# start the cassandra instance
echo 'starting cassandra'
dsc-cassandra-2.2.3/bin/cassandra start &> /dev/null
sleep 4

# start the datastax agent
echo 'starting the datastax-agent'
datastax-agent-5.2.2/bin/datastax-agent &> /dev/null
sleep 4

# start opscenter
echo 'starting opscenter'
opscenter-5.2.2/bin/opscenter &> /dev/null
sleep 3
echo 'opscenter is running on 127.0.0.1:8888'
