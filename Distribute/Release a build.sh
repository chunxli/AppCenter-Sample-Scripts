# App Center APIs
# https://openapi.appcenter.ms/
echo '=== App Center APIs ==='

# Base URL
baseHost='api.appcenter.ms'
echo "Base URL: ${baseHost}"

# Prepare Basic Information
owner_name=''
app_name=''
api_token=''

# Prepare Release Infomation
echo "Distribution - uplaod release"
release_id=''
file_path='@xxx.ipa'
group_name=''

echo "release_id: ${release_id}"
echo "file_path: ${file_path}"
echo "group_name: ${group_name}"

# Begins the upload process for a new release for the specified application.
echo "[Endpoint] '/v0.1/apps/{owner_name}/{app_name}/release_uploads'"
response=$(curl --location --request POST "https://${baseHost}/v0.1/apps/${owner_name}/${app_name}/release_uploads" \
--header "X-API-Token: ${api_token}" \
--header 'Content-Type: application/json' \
--header 'accept: application/json' \
--data-raw '{
  "release_id": '$release_id'
}')

echo -e "\n"

echo "[Endpoint] Upload URL (Get from previous response): https://upload.appcenter.ms/v0.1/apps/<token>/uploads/<token>file.appcenter.ms"
upload_url=$(echo $response|jq -r '.upload_url')
echo "Upload URL: ${upload_url}"
curl -X POST $upload_url \
-H "X-API-Token: ${api_token}" \
--form "ipa=${file_path}"

echo -e "\n"

# Commits or aborts the upload process for a release for the specified application
echo "[Endpoint] '/v0.1/apps/{owner_name}/{app_name}/release_uploads/{upload_id}'"
upload_id=$(echo $response | jq -r '.upload_id')
echo "Upload ID: ${upload_id}"
curl -X PATCH "https://${baseHost}/v0.1/apps/${owner_name}/${app_name}/release_uploads/${upload_id}" \
-H "X-API-Token: ${api_token}" \
-H 'Content-Type: application/json' \
-H 'accept: application/json' \
--data-raw '{
  "status": "committed"
}'

echo -e "\n"

# Updates a release
echo "[Endpoint] '/v0.1/apps/{owner_name}/{app_name}/releases/{release_id}'"
curl -X PATCH "https://${baseHost}/v0.1/apps/${owner_name}/${app_name}/releases/${release_id}" \
-H "X-API-Token: ${api_token}" \
-H 'Content-Type: application/json' \
-H 'accept: application/json' \
--data-raw '{
  "destination_name": '$group_name', 
  "release_notes": "Example new release via the APIs"
}'

echo -e "\n"