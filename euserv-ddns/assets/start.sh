while true
do
	curl --insecure "${SERVER:=https://ddns.euserv.org}/?ah=${AUTHHASH}"
	sleep "${INTERVAL:=310}"
done
