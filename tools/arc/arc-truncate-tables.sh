source _schemas.sh
source _clearable-tables.sh
source _users.sh
source _env-choice.sh

for schema in "${arc_schemas[@]}"
do
	if [ "$1" != 'localhost'  ]; then
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
	reset_seq_sql=$(psql -h $db_host -p $db_port -U ${db_user} $db_name -t -c "select 'alter sequence ${schema}.' || sequence_name || ' restart with 1;' from information_schema.sequences where sequence_schema='${schema}';")
	echo $reset_seq_sql
	psql -h $db_host -p $db_port -U ${db_user} $db_name -c "$reset_seq_sql"
done

echo "--- all truncated"

