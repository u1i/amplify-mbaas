source appkey.conf

curl -b cookies.txt -c cookies.txt -X POST --data-urlencode "email=mbaas@axway.com" --data-urlencode "first_name=John" --data-urlencode "last_name=Smith" --data-urlencode "password=pass" --data-urlencode "password_confirmation=pass" "https://api.cloud.appcelerator.com/v1/users/create.json?key=$appkey&pretty_json=true"
