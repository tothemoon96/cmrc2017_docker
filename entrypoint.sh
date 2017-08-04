#!/bin/bash

USER_ID=${LOCAL_USER_ID:-0}

if [ ${USER_ID} != "0" ]; then
	echo "Starting with UID : $USER_ID"
	useradd --shell /bin/bash -u ${USER_ID} -o -c "" -m user
	export HOME=/home/user
	cd /home/user
	exec /usr/local/bin/gosu user "$@"
else
	exec "$@"
fi