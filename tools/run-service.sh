base_dir=~

service_name=$1
if [ $# -eq 0 ]; then
	service_name=${PWD##*/}
fi

echo '---------------- running ' service_name
service_homes=( "$base_dir/projects/arc-ng" "$base_dir/projects/arc-ng2" )

for service_home in "${service_homes[@]}"
do
   echo 'checking location' $service_home
   maybe_service_dir="$service_home"/"$service_name"
   if [ -d "$maybe_service_dir" ]
      then
	 service_dir=$maybe_service_dir
         break
      else
	:
   fi
done

echo '--- building ' $service_dir

cd $service_dir
./gradlew build
./gradlew -Dspring.profiles.active=dev-local bootRun

