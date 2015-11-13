VERSION="2.1.11"
OPSCENTER="5.2.2"
AGENT="5.2.2"

    # checking if cassandra is present
    if [ ! -d dsc-cassandra-$VERSION ] & [ ! -d datastax-agent-$AGENT ] & [ ! -d opscenter-$OPSCENTER ] ; then
    echo "not found, grabbing packages"

    # download dsc
    curl -L http://downloads.datastax.com/community/dsc-cassandra-$VERSION-bin.tar.gz | tar xz

    # download datastax-agent
    curl -L http://downloads.datastax.com/community/datastax-agent-$AGENT.tar.gz | tar xz
    echo "stomp_interface: 127.0.0.1" >> ./datastax-agent-$AGENT/conf/address.yaml

    # download opscenter
    curl -L http://downloads.datastax.com/community/opscenter-$OPSCENTER.tar.gz | tar xz
    fi

# start the cassandra instance
echo 'starting cassandra'
dsc-cassandra-$VERSION/bin/cassandra start &> /dev/null
sleep 4

# start the datastax agent
echo 'starting the datastax-agent'
datastax-agent-$AGENT/bin/datastax-agent &> /dev/null
sleep 4

# start opscenter
echo 'starting opscenter'
opscenter-$OPSCENTER/bin/opscenter &> /dev/null
sleep 3


# add node via opscenter api
echo 'adding node via opscenter api'
curl -X DELETE http://127.0.0.1:8888/cluster-configs/Test_Cluster &> /dev/null
curl -X POST http://127.0.0.1:8888/cluster-configs -d '{"cassandra": {"seed_hosts": "localhost"}, "cassandra_metrics": {}, "jmx": {"port": "7199"}}' &> /dev/null

echo 'opscenter is running on 127.0.0.1:8888'
python -mwebbrowser http://127.0.0.1:8888 
