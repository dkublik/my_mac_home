
for pid in `ps -ef | grep java | grep -v "grep java" | awk '{print $2}'` ; do echo "killing " $pid ; kill $pid ; done

for pid in `ps -ef | grep java | grep -v "grep java" | awk '{print $2}'` ; do echo "killing " $pid ; kill -9 $pid ; done
