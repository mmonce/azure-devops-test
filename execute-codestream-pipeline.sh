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




pipelineID='63e02fb0-dc23-4e3a-8c8a-f44660d400cd'


 curl -X POST \
 $vracloudurl/codestream/api/pipelines/$pipelineID/executions \
 -H "Authorization: Bearer $access_token" \
 -H 'Content-Type: application/json' \
 -d '{

}' -k | jq "."
