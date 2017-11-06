source _schemas.sh
source _clearable-tables.sh
source _users.sh

#db_host="arc-ng-ci.cykkw52s95iz.us-east-1.rds.amazonaws.com"
#db_name="arc_features_ci"
#db_host="arc-ng-ci.cykkw52s95iz.us-east-1.rds.amazonaws.com"
#db_name="arc_ci"
#db_host="arc-ng-dev.cykkw52s95iz.us-east-1.rds.amazonaws.com"
#db_name="arc"
#db_host="arc-ng-qa.cykkw52s95iz.us-east-1.rds.amazonaws.com"
#db_name="arc"
#db_host="arc-ng-prod.cu9tfafkltur.us-east-1.rds.amazonaws.com"
#db_name="arc"
db_host="localhost"
db_name="arc"

db_port=5433

for schema in "${arc_schemas[@]}"
do
   echo '--- truncating' $schema ' user: ' ${arc_users[$schema]}

   schema_tables=${arc_clearable_tables[$schema]}
	IFS=',' read -ra ADDR <<< $schema_tables
	for table in "${ADDR[@]}"; do
		clear_table_sql="TRUNCATE TABLE ${schema}.${table} CASCADE;"
   		echo $clear_table_sql
		psql -h $db_host -p $db_port -U ${arc_users[$schema]} $db_name -c "$clear_table_sql"
	done
done

echo "--- all truncated"

