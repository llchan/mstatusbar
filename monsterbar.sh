#!/bin/sh
set +o posix

fifo="/tmp/m"

trap 'rm -f "${fifo}"' INT TERM EXIT
[ -p "${fifo}" ] || { rm -f "${fifo}"; mkfifo -m 600 "${fifo}"; }

mstatusbar < "${fifo}" | tee >(bar -s 0) >(bar -s 1) >/dev/null &

monsterwm > "${fifo}"
