db_user=""
if [ $# -eq 0 ]; then
	echo "choice: local, feature, ci, dev, qa, prod"
  	exit 
elif [ "$1" = "local" ]; then
	db_host="localhost"
	db_name="postgres"
	db_port=5432
	db_user=postgres
	echo "------------------ running for local:" ${db_host}':'${db_port}
elif [ "$1" = "feature" ]; then
	db_host="arc-ng-ci.cykkw52s95iz.us-east-1.rds.amazonaws.com"
	db_name="arc_features_ci"
	db_port=5432
	echo "------------------ running for features-ci:" ${db_host}':'${db_port}
elif [ "$1" = "ci" ]; then
	db_host="arc-ng-ci.cykkw52s95iz.us-east-1.rds.amazonaws.com"
	db_name="arc_ci"
	db_port=5432
	echo "------------------ running for ci:" ${db_host}':'${db_port}
elif [ "$1" = "dev" ]; then
	db_host="arc-ng-dev.cykkw52s95iz.us-east-1.rds.amazonaws.com"
	db_name="arc"
	db_port=5432
	echo "------------------ running for dev:" ${db_host}':'${db_port}
elif [ "$1" = "qa" ]; then
	db_host="arc-ng-qa.cykkw52s95iz.us-east-1.rds.amazonaws.com"
	db_name="arc"
	db_port=5432
	echo "------------------ running for qa:" ${db_host}':'${db_port}
elif [ "$1" = "prod" ]; then
	#db_host="arc-ng-prod.cu9tfafkltur.us-east-1.rds.amazonaws.com"
	db_host="localhost"
	db_name="arc"
	db_port=5433
	echo "------------------ running for prod:" ${db_host}':'${db_port}
fi

