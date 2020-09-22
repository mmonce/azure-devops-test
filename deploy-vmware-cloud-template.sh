vracloudurl='https://api.mgmt.cloud.vmware.com'
apitoken='ffSxI5s6BM1qIYSNgXeywHvk3z8GeS6zxv59acFWuHUT8RVdA42YXrhb99RbovE8'
blueprint_name='Ubuntu-API'
api_version='2019-09-12'

echo $vracloudurl


access_token=`curl -X POST \
 "$vracloudurl/iaas/api/login" \
 -H 'Content-Type: application/json' \
 -s \
 -d '{
  "refreshToken":"'"$apitoken"'"
}' -k | jq -r .token`



echo $token

# curl -X GET \
# "$vracloudurl/csp/gateway/am/api/loggedin/user/orgs" \
# -H, -k "csp-auth-token: $token"

#curl -X GET $vracloudurl/blueprint/api/blueprints -H "Authorization: Bearer $access_token" -k | jq "."

blueprint_id='d2ba6fe0-3d82-4d03-93ae-556c7ceb89b2'
image_mapping='ubuntu'
flavor_mapping='small'

echo $blueprint_id

 curl -X POST \
 $vracloudurl/blueprint/api/blueprint-requests?apiVersion=$api_version \
 -H "Authorization: Bearer $access_token" \
 -H 'Content-Type: application/json' \
 -d '{
 "description": "Blueprint Request",
 "blueprintId": "'"$blueprint_id"'",
 "inputs": {
 		"count": 1,
 		"image":"'"$image_mapping"'",
 		"flavor":"'"$flavor_mapping"'"
 }
}' -k | jq "."
