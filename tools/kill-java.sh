
for pid in `ps -ef | grep java | awk '{print $2}'` ; do echo "killing " $pid ; kill $pid ; done


