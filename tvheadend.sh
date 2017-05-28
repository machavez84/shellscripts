#!/bin/bash

TVHNAME="tvheadend"
TVHBIN="/usr/local/bin/tvheadend"
TVHUSER="tvheadend"
TVHGROUP="tvheadend"

case "$1" in
  start)
    echo "Starting tvheadend"
    start-stop-daemon --start --user ${TVHUSER} --exec ${TVHBIN} -- \
                -u ${TVHUSER} -g ${TVHGROUP} -f -C
  ;;
  stop)
    echo "Stopping tvheadend"
    start-stop-daemon --stop --quiet --name ${TVHNAME} --signal 2
  ;;
  restart)
    echo "Restarting tvheadend"

    start-stop-daemon --stop --quiet --name ${TVHNAME} --signal 2


    start-stop-daemon --start --user ${TVHUSER} --exec ${TVHBIN} -- \
                -u ${TVHUSER} -g ${TVHGROUP} -f -C

  ;;
  *)
    echo "Usage: tvheadend {start|stop|restart}"
    exit 1
esac
exit 0

