base_dir=~

schemas=( "localization_dictionaries" "assets" "content" "scheduling" "delivery" "casl_migration")

for schema in "${schemas[@]}"
do
   echo 'clearing' $schema

   psql -h localhost -U postgres postgres -c "DROP SCHEMA $schema cascade;"

   psql -h localhost -U postgres postgres -c "CREATE SCHEMA $schema AUTHORIZATION postgres;"

done

echo '--- all cleared '

