#!/bin/bash

#variables the user needs to add
clientsecret=""
clientid=""

#const variables for my app
appid="LightChanger"
deviceid="AlexaMeetsHue"
state="72561051606410793415287018249431983"
verb="POST"
path="/oauth2/token"
realm="oauth2_client@api.meethue.com"

curl -v "https://api.meethue.com/oauth2/auth?clientid=$clientid&appid=$appid&deviceid=$deviceid&state=$state&response_type=code"

echo ""
echo "Click the link next to location to authenticate"
echo "This will redirect you to philips and sign in."
echo "Now authenticate my app and you will be redirected to a website"
echo "In the url there is a code what is the code?"
read code

curl -X POST -v "https://api.meethue.com/oauth2/token?code=$code&grant_type=authorization_code"
echo "Next to WWW-Authenticate there is a line with a realm and a nonce"
echo "What is your nonce? (copy without the quotes)"
read nonce

#HASH1 = MD5("CLIENTID" + ":" + "REALM" + ":" + "CLIENTSECRET")
echo "$clientid":"$realm":"$clientsecret"
HASH1="$(echo -n "$clientid":"$realm":"$clientsecret" | md5sum | sed 's/\(.*\).../\1/')"
echo "hash 1:"
echo "$HASH1"

#HASH2 = MD5("VERB" + ":" + "PATH")
HASH2="$(echo -n "$verb":"$path" | md5sum | sed 's/\(.*\).../\1/')"
echo "hash 2:"
echo "$HASH2"

#response = MD5(HASH1 + ":" + "NONCE" + ":" + HASH2)
response="$(echo -n "$HASH1":"$nonce":"$HASH2" | md5sum | sed 's/\(.*\).../\1/')"
echo "response:"
echo "$response"
echo ""

curl -v -H "Authorization: Digest username=\"$clientid\", realm=\"$realm\", \
nonce=\"$nonce\", uri=\"$path\", response=\"$response\"" \
-X POST "https://api.meethue.com/oauth2/token?code=$code&grant_type=authorization_code"

echo ""
echo "copy this acces token into your env.json (as explained in the README.md)"

exit 0