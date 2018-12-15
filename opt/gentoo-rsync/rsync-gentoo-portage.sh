#!/bin/bash

LOGFILE="/var/log/rsync-gentoo-portage.log"
MAX_ATTEMPTS=5
RSYNC="/usr/bin/rsync"
OPTS="--quiet --recursive --links --perms --times -D --delete --timeout=300 --checksum"
SRC="rsync://rsync.europe.gentoo.org/gentoo-portage"
DST="/var/rsync/gentoo-portage/"

echo "Started update at "$(date) >> "${LOGFILE}" 2>&1
logger -t rsync "re-rsyncing the gentoo-portage tree"

timeout=60
attempt=0
ret=0

while [[ ${attempt} -lt ${MAX_ATTEMPTS} ]]
do
	"${RSYNC}" ${OPTS} "${SRC}" "${DST}" >> "${LOGFILE}" 2>&1

	if [[ ${?} -eq 0 ]]
	then
		break
	fi

	sleep ${timeout}
	attempt=$((attempt + 1))
	timeout=$((timeout * 2))
done

echo "End: "$(date) >> "${LOGFILE}" 2>&1
