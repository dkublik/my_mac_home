source _schemas.sh
source _clearable-tables.sh
source _users.sh
source _env-choice.sh

for schema in "${arc_schemas[@]}"
do
	if [ $db_host != 'localhost'  ]; then
		db_user=${arc_users[$schema]}
	fi	
   	echo '--- adding prviliges in' $schema ' user:' ${db_user}

	sql="GRANT ALL PRIVILEGES on ALL TABLES IN SCHEMA ${schema} TO arc_developer;"
   	echo $sql
	psql -h $db_host -p $db_port -U ${db_user} $db_name -c "$sql"
done

echo "--- all added"

