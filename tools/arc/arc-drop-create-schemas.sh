source _schemas.sh
source _users.sh
source _env-choice.sh


for schema in "${arc_schemas[@]}"
do
   	if [ "$1" != 'local'  ]; then
        	db_user=${arc_users[$schema]}
	fi
	echo '--- dropping' $schema ' user:' ${db_user}

	drop_sql="DROP SCHEMA $schema cascade;"
	echo $drop_sql
	psql -h $db_host -p $db_port -U ${db_user} $db_name -c "$drop_sql"

	create_sql="CREATE SCHEMA $schema AUTHORIZATION $db_user;"
	echo $create_sql
	psql -h $db_host -p $db_port -U ${db_user} $db_name -c "$create_sql"
done

echo '--- all dropped created '

