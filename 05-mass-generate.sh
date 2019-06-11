source appkey.conf

cookie=$(cat cookies.txt | tr "\t" "\n" | tail -1)

while [ 1 ]
do

	cat /dev/urandom | hexdump -c | head -20000 | base64 > data.txt
	#curl -b cookies.txt -c cookies.txt -X PUT -F "name=key-$(date +%s)" -F "type=binary" -F "value=<data.txt" "https://api.cloud.appcelerator.com/v1/keyvalues/set.json?key=$appkey"
	curl -b cookies.txt -c cookies.txt -X PUT -F "name=key-$(date +%s)" -F "value=<data.txt" "https://api.cloud.appcelerator.com/v1/keyvalues/set.json?key=$appkey"
done
