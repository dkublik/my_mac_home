source _schemas.sh
source _clearable-tables.sh
source _users.sh

#db_host="arc-ng-ci.cykkw52s95iz.us-east-1.rds.amazonaws.com"
#db_name="arc_features_ci"
#db_host="arc-ng-ci.cykkw52s95iz.us-east-1.rds.amazonaws.com"
#db_name="arc_ci"
db_host="arc-ng-dev.cykkw52s95iz.us-east-1.rds.amazonaws.com"
db_name="arc"
#db_host="arc-ng-qa.cykkw52s95iz.us-east-1.rds.amazonaws.com"
#db_name="arc"
#db_host="arc-ng-prod.cu9tfafkltur.us-east-1.rds.amazonaws.com"
#db_name="arc"
#db_host="localhost"
#db_name="arc"

db_port=5432

for schema in "${arc_schemas[@]}"
do
   echo '--- adding prviliges in' $schema ' user: ' ${arc_users[$schema]}

	sql="GRANT ALL PRIVILEGES on ALL TABLES IN SCHEMA ${schema} TO arc_developer;"
   	echo $sql
	psql -h $db_host -p $db_port -U ${arc_users[$schema]} $db_name -c "$sql"
done

echo "--- all added"

