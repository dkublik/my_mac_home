source arc-schemas.sh

for schema in "${arc_schemas[@]}"
do
   echo 'clearing' $schema

   psql -h localhost -U postgres postgres -c "DROP SCHEMA $schema cascade;"

   psql -h localhost -U postgres postgres -c "CREATE SCHEMA $schema AUTHORIZATION postgres;"

done

echo '--- all cleared '

