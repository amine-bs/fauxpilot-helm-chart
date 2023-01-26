wget https://minio.lab.sspcloud.fr/mbenxsalha/diffusion/fauxpilot/fauxpilot.vsix 
code-server --install-extension fauxpilot.vsix
key="fauxpilot.server"
value="$1:$2/v1/engines"
settings="$HOME/.local/share/code-server/User"
echo $settings
jq --arg key "$key" --arg value "$value" --indent 4 '. += {($key): $value}'  $settings/settings.json > settings.json
mv settings.json $settings
rm fauxpilot.vsix