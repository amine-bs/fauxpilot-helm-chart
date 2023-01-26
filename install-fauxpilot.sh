wget -O $HOME/fauxpilot.vsix https://minio.lab.sspcloud.fr/mbenxsalha/diffusion/fauxpilot/fauxpilot.vsix 
code-server --install-extension $HOME/fauxpilot.vsix
key="fauxpilot.server"
value="$1:$2/v1/engines"
settings="$HOME/.local/share/code-server/User"
jq --arg key "$key" --arg value "$value" --indent 4 '. += {($key): $value}'  $settings/settings.json > $HOME/settings.json
mv $HOME/settings.json $settings
rm $HOME/fauxpilot.vsix
