# kill the processes
ps -ef | grep 'cassandra\|datastax\|opscenter' | grep -v grep | awk '{print $2}' | xargs kill | echo 'killing processes'

