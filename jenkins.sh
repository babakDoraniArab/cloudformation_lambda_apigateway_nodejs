echo $apigatewayurl
echo $SelecttheOperation

case $SelecttheOperation in
	create)
    echo 'Create Operation Executed'
    payloadstring='"id":"'$id'", "name":"'$name'", "occupation":"'$occupation'"'
    curl -X POST -d "{\"operation\":\"$SelecttheOperation\",\"tableName\":\"Dynamo_api-lambda-db\",\"payload\":{\"Item\":{ $payloadstring }}}" $apigatewayurl
    ;;
	read)
		echo 'Read Operation Executed'
    payloadstring='"id":"'$id'"'
		curl -X POST -d "{\"operation\":\"$SelecttheOperation\",\"tableName\":\"Dynamo_api-lambda-db\",\"payload\":{\"Key\":{ $payloadstring }}}" $apigatewayurl
		;;
	list)
    echo 'List Operation Executed'
    curl -X POST -d "{\"operation\":\"$SelecttheOperation\",\"tableName\":\"Dynamo_api-lambda-db\",\"payload\":{\"Item\":{\"id\":\"2\"}}}" $apigatewayurl
		;;
  delete)
		echo 'Delete Operation Executed'
    payloadstring='"id":"'$id'"'
		curl -X POST -d "{\"operation\":\"$SelecttheOperation\",\"tableName\":\"Dynamo_api-lambda-db\",\"payload\":{\"Key\":{ $payloadstring }}}" $apigatewayurl
		;;
	update)
		echo $SelecttheOperation 'Operation Executed'
    payloadstring='"id":"'$id'"'
  	curl -X POST -d "{\"operation\":\"$SelecttheOperation\",\"tableName\":\"Dynamo_api-lambda-db\",\"payload\":{\"Key\":{ $payloadstring }, \"UpdateExpression\": \"set occupation=:o\", \"ExpressionAttributeValues\":{ \":o\": \"$occupation\"}}}" $apigatewayurl
  	;;
esac