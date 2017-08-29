source _schemas.sh
source _users.sh

db_host="arc-ng-ci.cykkw52s95iz.us-east-1.rds.amazonaws.com"
db_name="arc_features_ci"
#db_host="arc-ng-ci.cykkw52s95iz.us-east-1.rds.amazonaws.com"
#db_name="arc_ci"
#db_host="arc-ng-dev.cykkw52s95iz.us-east-1.rds.amazonaws.com"
#db_name="arc"
#db_host="arc-ng-qa.cykkw52s95iz.us-east-1.rds.amazonaws.com"
#db_name="arc"
#db_host="arc-ng-prod.cu9tfafkltur.us-east-1.rds.amazonaws.com"
#db_name="arc"

for schema in "${arc_schemas[@]}"
do
   echo '--- dropping' $schema ' user: ' ${arc_users[$schema]}

   drop_tables_sql=$(psql -h $db_host -U ${arc_users[$schema]} $db_name -t -c "select 'drop table ${schema}.' || tablename || ' cascade;' from pg_tables where schemaname = '${schema}';")
   echo $drop_tables_sql
   psql -h $db_host -U ${arc_users[$schema]} $db_name -c "$drop_tables_sql"

   drop_seq_sql=$(psql -h $db_host -U ${arc_users[$schema]} $db_name -t -c "select 'drop sequence ${schema}.' || sequence_name from information_schema.sequences where sequence_schema='${schema}';")
   echo $drop_seq_sql	
   psql -h $db_host -U ${arc_users[$schema]} $db_name -t -c "$drop_seq_sql"

done

echo "--- all dropped"

