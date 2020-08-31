vracloudurl='https://api.mgmt.cloud.vmware.com'
apitoken='1lUWrQ0qY3MauPM6KAlXJkeXs5bZUsW2Ghw3zSQb7rAtDLv75SRal4Ft7MnvQfuI'
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

curl -X GET $vracloudurl/blueprint/api/blueprints -H "Authorization: Bearer $access_token" -k | jq "."

