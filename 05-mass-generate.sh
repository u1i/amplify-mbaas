source appkey.conf

# 20000 is ~ 2MB
size=20000
runid=$RANDOM

cookie=$(cat cookies.txt | tr "\t" "\n" | tail -1)

while [ 1 ]
do
	if [ -r killswitch ]
	then
		echo "killswitch detected, aborting"
		exit
	fi

	echo "$(date) generate data"
	cat /dev/urandom | hexdump -c | head -$size | base64 > data-$runid.txt
	#curl -b cookies.txt -c cookies.txt -X PUT -F "name=key-$(date +%s)" -F "type=binary" -F "value=<data.txt" "https://api.cloud.appcelerator.com/v1/keyvalues/set.json?key=$appkey"
	echo "$(date) RUN request"
	time curl -b cookies.txt -c cookies.txt -X PUT -F "name=ws2key-$(date +%s)" -F "value=<data-$runid.txt" "https://api.cloud.appcelerator.com/v1/keyvalues/set.json?key=$appkey"
done
