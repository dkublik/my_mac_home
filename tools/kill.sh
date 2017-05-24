p_name=$1
processes=`ps -ef | grep $p_name`

#for pid in `ps -ef | grep $1' ; do echo "killing " $pid ; kill `$pid | awk '{print $2}'` ; done 

for process in "$processes"
do
   pid=$(echo $process | awk '{print $2}')
   name=$(echo $process | awk '{print $8}')
   aaa="/${p_name}/"
   echo $aaa
   params=$(echo $process | awk '{for(i=1;i<=NF;i++){if ($i ~ aaa && length($i) < 400){print $i}}}')
   echo "killing $name $params"
done

