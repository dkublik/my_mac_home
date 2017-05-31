source arc-schemas.sh

for schema in "${arc_schemas[@]}"
do
   echo '--- clearing' $schema

   drop_tables_sql=$(psql -h localhost -U postgres postgres -t -c "select 'drop table ${schema}.' || tablename || ' cascade;' from pg_tables where schemaname = '${schema}';")
#   drop_tables_sql=d${drop_tables_sql#*d}
#   drop_tables_sql=${drop_tables_sql%(*}
   echo $drop_tables_sql
   psql -h localhost -U postgres postgres -c "$drop_tables_sql"

   drop_seq_sql=$(psql -h localhost -U postgres postgres -t -c "select 'drop sequence ${schema}.' || sequence_name from information_schema.sequences where sequence_schema='${schema}';")
   echo $drop_seq_sql	
   psql -h localhost -U postgres postgres -t -c "$drop_seq_sql"

done

echo "--- all dropped"

