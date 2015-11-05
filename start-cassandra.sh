    # checking if cassandra is present
    if [ ! -d dsc-cassandra-2.2.3 ] & [ ! -d datastax-agent-5.2.2 ] & [ ! -d opscenter-5.2.2 ] ; then
    echo "files not found, grabbing packages"

    # download dsc
    curl -L http://downloads.datastax.com/community/dsc-cassandra-2.2.3-bin.tar.gz | tar xz

    # download datastax-agent
    curl -L http://downloads.datastax.com/community/datastax-agent-\5.2.2.tar.gz | tar xz
    echo "stomp_interface: 127.0.0.1" >> ./datastax-agent-5.2.2/conf/address.yaml

    # download opscenter
    curl -L http://downloads.datastax.com/community/opscenter-5.2.2.tar.gz | tar xz
    fi

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
