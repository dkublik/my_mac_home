source _schemas.sh
source _clearable-tables.sh
source _users.sh
source _env-choice.sh

for schema in "${arc_schemas[@]}"
do
	if [ $db_host != 'localhost'  ]; then
		db_user=${arc_users[$schema]}
	fi	
   	echo '--- truncating' $schema ' user:' ${db_user}

   	schema_tables=${arc_clearable_tables[$schema]}
	IFS=',' read -ra ADDR <<< $schema_tables
	for table in "${ADDR[@]}"; do
		clear_table_sql="TRUNCATE TABLE ${schema}.${table} CASCADE;"
   		echo $clear_table_sql
		psql -h $db_host -p $db_port -U ${db_user} $db_name -c "$clear_table_sql"
	done
done

echo "--- all truncated"

