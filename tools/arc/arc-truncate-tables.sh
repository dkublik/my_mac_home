source _schemas.sh
source _clearable-tables.sh

for schema in "${arc_schemas[@]}"
do
   echo '--- truncating' $schema ' user: ' ${arc_users[$schema]}

   schema_tables=${arc_clearable_tables[$schema]}
	IFS=',' read -ra ADDR <<< $schema_tables
	for table in "${ADDR[@]}"; do
		clear_table_sql="TRUNCATE TABLE ${schema}.${table} CASCADE;"
   		echo $clear_table_sql
   		psql -h localhost -U postgres postgres -c "$clear_table_sql"
	done
done

echo "--- all truncated"

