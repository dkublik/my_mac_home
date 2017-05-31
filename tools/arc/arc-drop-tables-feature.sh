source arc-schemas.sh

declare -A users
users=( ["localization_dictionaries"]="arc_user_localization_dictionaries" ["assets"]="arc_user_assets" ["content"]="arc_user_content" ["scheduling"]="arc_user_scheduling" ["delivery"]="arc_user_delivery" ["casl_migration"]="arc_user_casl_migration")
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
   echo '--- clearing' $schema ' user: ' ${users[$schema]}

   drop_tables_sql=$(psql -h $db_host -U ${users[$schema]} $db_name -t -c "select 'drop table ${schema}.' || tablename || ' cascade;' from pg_tables where schemaname = '${schema}';")
   echo $drop_tables_sql
   psql -h $db_host -U ${users[$schema]} $db_name -c "$drop_tables_sql"

   drop_seq_sql=$(psql -h $db_host -U ${users[$schema]} $db_name -t -c "select 'drop sequence ${schema}.' || sequence_name from information_schema.sequences where sequence_schema='${schema}';")
   echo $drop_seq_sql	
   psql -h $db_host -U ${users[$schema]} $db_name -t -c "$drop_seq_sql"

done

echo "--- all dropped"

