source appkey.conf

curl -i -X POST -b cookies.txt -c cookies.txt -F "login=mbaas@axway.com" -F "password=pass" "https://api.cloud.appcelerator.com/v1/users/login.json?key=$appkey&pretty_json=true"
