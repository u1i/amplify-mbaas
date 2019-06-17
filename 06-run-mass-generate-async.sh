rm killswitch 2>/dev/null

script_id=$RANDOM
echo "Running 05-mass-generate.sh, appending outut to mass-gen-$script_id.log"

exec 1>>$PWD/mass-gen-$script_id.log
exec 2>>$PWD/mass-gen-$script_id.log
./05-mass-generate.sh&
