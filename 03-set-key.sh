source appkey.conf

cookie=$(cat cookies.txt | tr "\t" "\n" | tail -1)

curl -b cookies.txt -c cookies.txt -X PUT -F "name=mykey" -F "value=stuff" "https://api.cloud.appcelerator.com/v1/keyvalues/set.json?key=$appkey"
