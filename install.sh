# download dsc
curl -L http://downloads.datastax.com/community/dsc-cassandra-2.2.3-bin.tar.gz | tar xz

# download datastax-agent
curl -L http://downloads.datastax.com/community/datastax-agent-\5.2.2.tar.gz | tar xz
echo "stomp_interface: 127.0.0.1" >> ./datastax-agent-5.2.2/conf/address.yaml

# download opscenter
curl -L http://downloads.datastax.com/community/opscenter-5.2.2.tar.gz | tar xz
