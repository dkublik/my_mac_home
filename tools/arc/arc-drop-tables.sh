source _schemas.sh
source _users.sh
source _env-choice.sh


for schema in "${arc_schemas[@]}"
do
        if [ "$1" != 'local'  ]; then
                db_user=${arc_users[$schema]}
        fi   
	echo '--- dropping tables in' $schema ' user:' ${db_user}

   drop_tables_sql=$(psql -h $db_host -p $db_port -U ${db_user} $db_name -t -c "select 'drop table ${schema}.' || tablename || ' cascade;' from pg_tables where schemaname = '${schema}';")
   echo $drop_tables_sql
   psql -h $db_host -p $db_port -U ${db_user} $db_name -c "$drop_tables_sql"

   drop_seq_sql=$(psql -h $db_host -p $db_port -U ${db_user} $db_name -t -c "select 'drop sequence ${schema}.' || sequence_name from information_schema.sequences where sequence_schema='${schema}';")
   echo $drop_seq_sql	
   psql -h $db_host -p $db_port -U ${db_user} $db_name -t -c "$drop_seq_sql"

done

echo "--- all dropped"

