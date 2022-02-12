## tip
if you want to run and test it you can use the shell with jenkins also you need to configure your jenkins job as parameterised job  

 a choice parameter Named `SelecttheOperation`
 three string Parameter named `[id,name,occupation]`
 the last one is the ApiGateway url. you can use a string parameter with the default value and you have to named it `apigatewayurl`

### example
`https://7anlkisfw3.execute-api.eu-west-1.amazonaws.com/Prod/Lambda_api-lambda-db`

----------------------------------------------------------------

the execute shell is:
```
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

```